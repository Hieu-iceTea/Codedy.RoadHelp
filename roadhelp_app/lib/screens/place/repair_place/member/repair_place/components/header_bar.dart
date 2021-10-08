import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';

import 'button_back.dart';
import 'search_field.dart';


class HeaderBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            ButtonBack(),
            SizedBox(width: getProportionateScreenWidth(10)),
            SearchField(),
          ],
        ),
      ),
    );
  }
}
