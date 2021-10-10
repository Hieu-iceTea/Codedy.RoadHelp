import 'package:flutter/material.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/screens/emergency_rescue/send/send_rescue_reviews/components/partner_pic_review.dart';
import 'package:roadhelp/screens/emergency_rescue/send/send_rescue_reviews/components/rating_partner.dart';
import 'package:roadhelp/screens/emergency_rescue/send/send_rescue_reviews/components/send_rescue_review.dart';

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
              PartnerPicReview(),
              SizedBox(height: 40),
              SendRescueReview(
                title: "Name",
                content: "Codedy",
              ),
              SizedBox(height: 15),
              SendRescueReview(
                title: "Phone",
                content: "0978123456",
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              RatingPartner(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildNameFormField(),
              SizedBox(height: getProportionateScreenHeight(50)),
              // DefaultButton(text: "Confirm", press: () {}),
              // DefaultButton(text: "Cancel", press: () {}),
              SizedBox(
                width: 250.0,
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
                    "Submit a review",
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


TextFormField buildNameFormField() {
  String? comment;
  return TextFormField(
    onSaved: (newValue) => comment = newValue,
    maxLines: null,
    keyboardType: TextInputType.multiline,
    onChanged: (value) {
      return null;
    },
    decoration: InputDecoration(
      labelText: "Comment",
      hintText: "Enter your comment",
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
