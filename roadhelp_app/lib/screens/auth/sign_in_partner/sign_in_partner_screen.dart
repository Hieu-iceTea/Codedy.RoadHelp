import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInPartnerScreen extends StatelessWidget {
  static String routeName = "/sign_in_partner";

  const SignInPartnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Partner"),
      ),
      body: Body(),
    );
  }
}
