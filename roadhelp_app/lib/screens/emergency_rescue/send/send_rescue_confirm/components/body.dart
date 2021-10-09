import 'package:flutter/material.dart';
import 'package:roadhelp/components/default_button.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/screens/emergency_rescue/send/send_rescue_confirm/components/partner_pic.dart';
import 'package:roadhelp/screens/emergency_rescue/send/send_rescue_confirm/components/send_rescue_confirm_detail.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.maxFinite,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Center(
          child: Column(
            children: [
              PartnerPic(),
              SizedBox(height: 40),
              SendRescueConfirmDetail(
                title: "Name",
                content: "Codedy",
              ),
              SizedBox(height: 15),
              SendRescueConfirmDetail(
                title: "Phone",
                content: "0978123456",
              ),
              SizedBox(height: 15),
              SendRescueConfirmDetail(
                title: "Intend time",
                content: "4 minute",
              ),
              SizedBox(height: getProportionateScreenHeight(50)),
              // DefaultButton(text: "Confirm", press: () {}),
              // DefaultButton(text: "Cancel", press: () {}),
              SizedBox(
                width: 150.0,
                height: 60,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              SizedBox(
                width: 150.0,
                height: 60,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
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
