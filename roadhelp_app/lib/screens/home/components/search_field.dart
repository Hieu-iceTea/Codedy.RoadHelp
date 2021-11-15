import 'package:flutter/material.dart';
import 'package:roadhelp/helper/keyboard.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place/repair_place_screen.dart';

import '../../../config/constants.dart';
import '../../../config/size_config.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
  }) : super(key: key);

  String? _keyword;

  TextEditingController _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.74,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: _keywordController,
        onChanged: (value) => _keyword = value,
        onEditingComplete: () => _submitForm(context),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Tìm tiệm sửa xe",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Future<void> _submitForm(context) async {
    KeyboardUtil.hideKeyboard(context);

    if (_keyword == null || _keyword!.isEmpty) {
      return;
    }

    _keywordController.text = "";//Xóa input

    Navigator.pushNamed(
      context,
      RepairPlaceScreen.routeName,
      arguments: RepairPlaceArguments(
        initialKeyword: _keyword!,
      ),
    );
  }
}
