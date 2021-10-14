import 'package:flutter/material.dart';

import 'size_config.dart';

//Localhost IOS emulator 127.0.0.1 or localhost
//Localhost Android emulator: 10.0.2.2
//Localhost on real driver means different
//Wifi Hieu iceTea: 192.168.1.102
const String baseApiUrl = "http://192.168.1.102:8080/";

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp phoneNumberValidatorRegExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");

final RegExp phoneValidatorRegExp = RegExp(r"(84|0[3|5|7|8|9])+([0-9]{8})\b");

const String kEmailNullError = "Vui lòng nhập email của bạn!";
const String kInvalidEmailError = "Vui lòng nhập email hợp lệ!";
const String kPassNullError = "Vui lòng nhập mật khẩu của bạn!";
const String kShortPassError = "Mật khẩu phải có ít nhất 8 kí tự!";
const String kMatchPassError = "Mật khẩu không khớp !";
const String kNamelNullError = "Xin hãy nhập tên của bạn!";
const String kPhoneNumberNullError = "Vui lòng nhập số điện thoại của bạn!";
const String kInvalidPhoneNumberError =
    "Số điện thoại không hợp lệ vui lòng kiểm tra lại!";
const String kAddressNullError = "Vui lòng nhập địa chỉ của bạn!";
const String kUserNameNullError = "Vui lòng nhập tên đăng nhập của bạn!";
const String kFirstNameNullError = "Vui lòng nhập tên của bạn!";
const String kLastNameNullError = "Vui lòng nhập họ của bạn!";
const String kPassOldNullError = "Vui lòng nhập mật khẩu cũ của bạn!";
const String kPassNewNullError = "Vui lòng nhập mật khẩu mới của bạn!";
const String kEnterPassNewNullError = "Vui lòng nhập lại mật khẩu mới của bạn!";
const String kPassNewEqualOldError = "Mật khẩu mới phải khác với mật khẩu cũ!";
const String kPassNewError = "Mật khẩu mới không khớp với nhau!";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
