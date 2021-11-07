import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadhelp/helper/keyboard.dart';

import '/components/default_button.dart';
import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';

class OtpForm extends StatefulWidget {
  Function(String) onSubmit;

  OtpForm({
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  String? pin1;
  String? pin2;
  String? pin3;
  String? pin4;

  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextOrPreviousField(String value, FocusNode? currentFocusNode) {
    if (value.length == 1) {
      currentFocusNode!.nextFocus();
      //nextFocusNode!.requestFocus();
    } else {
      if (currentFocusNode != pin1FocusNode) {
        currentFocusNode!.previousFocus();
      }
      //previousFocusNode!.previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  focusNode: pin1FocusNode,
                  //obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => pin1 = newValue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  //maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      pin1 = value;
                    });
                    nextOrPreviousField(value, pin1FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  //readOnly: !(pin1 != null && pin1!.isNotEmpty),
                  //obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => pin2 = newValue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  //maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      pin2 = value;
                    });
                    nextOrPreviousField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  //readOnly: !(pin2 != null && pin2!.isNotEmpty),
                  //obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => pin3 = newValue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  //maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      pin3 = value;
                    });
                    nextOrPreviousField(value, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  //readOnly: !(pin3 != null && pin3!.isNotEmpty),
                  //obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => pin4 = newValue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  //maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      pin4 = value;
                    });
                    nextOrPreviousField(value, pin4FocusNode);
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                      //_submitForm();
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Tiếp tục",
            press: () => _submitForm(),
          )
        ],
      ),
    );
  }

  void _submitForm() {
    KeyboardUtil.hideKeyboard(context);

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    String _verificationCode = pin1! + pin2! + pin3! + pin4!;

    widget.onSubmit(_verificationCode);
  }
}
