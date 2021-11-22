import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/keyboard.dart';
import 'package:roadhelp/models/district.dart';
import 'package:roadhelp/models/province.dart';
import 'package:roadhelp/models/ward.dart';
import 'package:roadhelp/providers/garage_provider.dart';

import 'location_filter_form.dart';

class SearchField extends StatefulWidget {
  String? initialKeyword;

  SearchField({
    this.initialKeyword,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String? keyword;
  Province? provinceSelected;
  District? districtSelected;
  Ward? wardSelected;

  @override
  Widget build(BuildContext context) {
    if (widget.initialKeyword != null) {
      keyword = widget.initialKeyword;
      _submitForm();
    }

    return Container(
      width: SizeConfig.screenWidth * 0.75,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.30),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        //controller: new TextEditingController(text: 'Initial value'),
        controller: TextEditingController()
          ..text = widget.initialKeyword ?? keyword ?? "",
        onChanged: (value) => keyword = value,
        onEditingComplete: () => _submitForm(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(9)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Tìm kiếm...",
          prefixIcon: IconButton(
            onPressed: () => {},
            icon: Icon(Icons.search),
          ),
          suffixIcon: IconButton(
            onPressed: () => _showMyDialog(),
            icon: Icon(Icons.filter_list, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Bộ lọc vị trí',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: LocationFilterForm(
            onSubmit: (provinceSelected, districtSelected, wardSelected) {
              this.provinceSelected = provinceSelected;
              this.districtSelected = districtSelected;
              this.wardSelected = wardSelected;

              _submitForm();
            },
          ),
        );
      },
    );
  }

  Future<void> _submitForm() async {
    await Provider.of<GarageProvider>(context, listen: false).fetchAllData(
      name: keyword,
      provinceId: provinceSelected?.id,
      districtId: districtSelected?.id,
      wardId: wardSelected?.id,
    );

    KeyboardUtil.hideKeyboard(context);
  }
}
