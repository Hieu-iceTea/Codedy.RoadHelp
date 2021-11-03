import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/util.dart';

class CustomAppBar extends StatelessWidget {
  final Future<bool> Function() onCancel;

  const CustomAppBar({required this.onCancel, Key? key}) : super(key: key);

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF5F6F9),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    primary: kPrimaryColor,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () async {
                    bool confirm = await Util.confirmDialog(
                      context: context,
                      content: "Bạn muốn hủy cứu hộ này?",
                    );
                    if (confirm) {
                      if (await onCancel()) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: SvgPicture.asset(
                    "assets/icons/Close.svg",
                    height: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
