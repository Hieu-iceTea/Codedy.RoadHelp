import 'package:flutter/material.dart';
import 'package:roadhelp/components/default_button.dart';
import 'package:roadhelp/config/constants.dart';
import 'package:roadhelp/config/size_config.dart';

class LocationForm extends StatefulWidget {
  @override
  _LocationFormState createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.maxFinite,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              buildLocation(),
              SizedBox(height: getProportionateScreenHeight(50)),
              DefaultButton(
                text: "Open Map",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildLocation() {
    String? location = 'ton that thuyet ha noi viet nam';
    return Column(
      children: [
        // SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$location\n",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: kTextColor, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: 120.0,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                color: kPrimaryColor,
                onPressed: () {},
                child: Text(
                  "Current Position",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
