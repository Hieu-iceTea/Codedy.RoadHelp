import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/keyboard.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/auth.dart';
import 'package:roadhelp/models/user.dart';
import 'package:roadhelp/providers/auth_provider.dart';
import 'package:roadhelp/screens/auth/otp/otp_screen.dart';
import 'package:roadhelp/screens/home/home_screen.dart';
import 'package:roadhelp/screens/my_account/success_partner/success_partner_screen.dart';

import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';

class BeComeToPartnerForm extends StatefulWidget {
  User? user;

  BeComeToPartnerForm({
    this.user,
    Key? key,
  }) : super(key: key);

  @override
  _BeComeToPartnerFormState createState() => _BeComeToPartnerFormState();
}

class _BeComeToPartnerFormState extends State<BeComeToPartnerForm> {
  User _user = User(); //khởi tạo giá trị ban đầu, cập nhật ở initState()

  final _formKey = GlobalKey<FormState>();
  bool _isLoadingSubmit = false;

  @override
  void initState() {
    //Lấy giá trị từ widget.user, nếu nó null thì khởi tạo :
    _user = widget.user ?? User();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          !_isLoadingSubmit
              ? DefaultButton(
                  text: "Tiếp tục",
                  press: _submitForm,
                )
              : Container(
                  width: double.infinity,
                  height: getProportionateScreenHeight(56),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: kPrimaryColor,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      enabled: false,
      //readOnly: true,
      initialValue: _user.phone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => _user.phone = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Số Điện Thoại",
        hintText: "Vui lòng nhập số điện thoại...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/phonenumber.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      enabled: false,
      //readOnly: true,
      initialValue: _user.username,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => _user.username = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kUserNameNullError;
        } else if (value.trim().length < 6) {
          return kInvalidUserNameError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Tên đăng nhập",
        hintText: "Vui lòng nhập tên đăng nhập...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user_icon.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      enabled: false,
      //readOnly: true,
      initialValue: _user.email,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _user.email = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Vui lòng nhập Email...",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/email.svg"),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    KeyboardUtil.hideKeyboard(context);

    try {
      setState(() {
        _isLoadingSubmit = true;
      });

      Auth authResponse =
          await Provider.of<AuthProvider>(context, listen: false)
              .becomeToPartner();

      setState(() {
        _isLoadingSubmit = false;
      });

      /*await Util.showDialogNotification(
          context: context, title: "Thông báo", content: authResponse.message);*/

      Navigator.pushNamed(
        context,
        OtpScreen.routeName,
        arguments: OtpArguments(
          to: widget.user!.email!,
          onSubmit: _submitVerificationPartnerCode,
          onResend: () {},
        ),
      );
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }

  Future<void> _submitVerificationPartnerCode(
      String verificationPartnerCode) async {
    try {
      Auth authResponse =
          await Provider.of<AuthProvider>(context, listen: false)
              .becomeToPartnerVerification(verificationPartnerCode);

      /*await Util.showDialogNotification(
          context: context, title: "Thông báo", content: authResponse.message);*/

      //
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PartnerSuccessScreen(
            "Hoàn thành",
            "Yêu cầu nâng cấp tài khoản của bạn đã được \n ghi nhận tại hệ thống. Bạn vui lòng đợi \n Admin kiểm duyệt nhé!!",
            HomeScreen.routeName,
          ),
        ),
      );
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
