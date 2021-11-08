import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/providers/auth_provider.dart';

import '../../../config/size_config.dart';
import 'categories.dart';
import 'home_header.dart';
import 'popular_garages.dart';
import 'send_rescue_banner.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            SendRescueBanner(),
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) => Categories(
                currentUser: authProvider.authData.currentUser,
              ),
            ),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularGarages(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
