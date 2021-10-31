import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/providers/issues_provider.dart';
import 'package:roadhelp/repositories/issues_repository.dart';
import 'package:roadhelp/screens/emergency_rescue/send/wait_websocket/wait_websocket_screen.dart';
import 'package:roadhelp/screens/emergency_rescue/user_info/user_info_screen.dart';

import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '/config/enums.dart';
import '/config/size_config.dart';
import '/helper/util.dart';
import '/models/issues.dart';
import '/screens/place/repair_place/repair_place_manage_add_edit/components/location_input.dart';

class IssuesForm extends StatefulWidget {
  Issues? issue;

  IssuesForm({Key? key}) : super(key: key);

  @override
  _IssuesFormState createState() => _IssuesFormState();
}

class _IssuesFormState extends State<IssuesForm> {
  final _formKey = GlobalKey<FormState>();

  List<IssueCategory> issueCategories = IssueCategory.values;

  //IssueCategory? issueCategorySelected;

  @override
  Widget build(BuildContext context) {
    widget.issue ??= Issues(); //Khởi tạo nếu null

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildCategoryDropdownFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLocationInput(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDescriptionFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Yêu cầu hỗ trợ",
            press: () => _submitForm(),
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField buildCategoryDropdownFormField() {
    return DropdownButtonFormField(
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      items: issueCategories
          .map<DropdownMenuItem<IssueCategory>>((IssueCategory value) {
        return DropdownMenuItem<IssueCategory>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
      //value: widget.issue!.category,
      onSaved: (newValue) => widget.issue!.category = newValue,
      onChanged: (newValue) {
        setState(() {
          widget.issue!.category = newValue!;
        });
      },
      validator: (value) {
        if (value == null) {
          return "Vui lòng chọn danh mục của bạn";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Danh Mục",
        hintText: "-- Chọn Danh Mục --",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 42, right: 22),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      initialValue: widget.issue?.phone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => widget.issue!.phone = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập số điện thoại của bạn";
        }
        if (value.length < 10) {
          return "Kích thước phải lớn hơn 10";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Điện thoại",
        hintText: "Nhập số điện thoại của bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      initialValue: widget.issue?.address,
      onSaved: (newValue) => widget.issue!.address = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập địa chỉ của bạn";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mô tả địa chỉ hiện tại",
        hintText: "Nhập địa chỉ của bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      initialValue: widget.issue?.description,
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: 5,
      onSaved: (newValue) => widget.issue!.description = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập mô tả";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mô tả sự số",
        hintText: "Nhập mô tả chi tiết",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Chat bubble Icon.svg"),
      ),
    );
  }

  Widget buildLocationInput() {
    return LocationInput(
      onSelectPlace: (latLngSelected) {
        widget.issue!.latitude = latLngSelected.latitude;
        widget.issue!.longitude = latLngSelected.longitude;
      },
      latLngInitial:
          widget.issue?.latitude != null && widget.issue?.longitude != null
              ? LatLng(widget.issue!.latitude!, widget.issue!.longitude!)
              : null,
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (widget.issue?.latitude == null && widget.issue?.longitude == null) {
      await Util.showDialogNotification(
          context: context,
          title: "Thiếu thông tin",
          content: "Vui lòng chọn vị trí trên bản đồ");

      return;
    }

    _formKey.currentState!.save();

    try {
      Issues itemResponse =
          await Provider.of<IssuesProvider>(context, listen: false)
              .send(widget.issue!);

      await Util.showDialogNotification(
          context: context,
          title: "Thành Công",
          content: "Đã gửi yêu cầu cứu hộ khẩn cấp");

      Navigator.pushNamed(
        context,
        WaitWebSocketScreen.routeName,
        arguments: WaitWebSocketArguments(
          message: "Chỉ một lúc thôi...\nHệ thống đang tìm người hỗ trợ bạn.",
          destination:
              '/topic/issue/memberWaitPartner/' + itemResponse.id.toString(),
          callback: (stompFrame) async {
            if (stompFrame.body != null) {
              Map<String, dynamic> response = json.decode(stompFrame.body!);
              IssueStatus issueStatus = IssueStatus.values.firstWhere(
                (element) =>
                    element.toString() ==
                    "IssueStatus." + response['data']['issueStatus'],
              );

              if (issueStatus == IssueStatus.waitMemberConfirm) {
                Issues issue =
                    await IssuesRepository.findById(itemResponse.id!);

                Navigator.pushReplacementNamed(
                  context,
                  UserInfoScreen.routeName,
                  arguments: UserInfoArguments(user: issue.userPartner!),
                );
                //Navigator.pop(context);
              }
            }
          },
        ),
      );
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
