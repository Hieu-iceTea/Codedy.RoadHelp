import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/providers/auth_provider.dart';

import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';
import 'become_to_partner_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) =>
          !authProvider.authData.currentUser!.requestBecomePartner!
              ? SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: SizeConfig.screenHeight * 0.03),
                            Text("Đăng kí đối tác", style: headingStyle),
                            Text(
                              "Vui lòng xác nhận lại thông tin\nđể đăng kí làm đối tác.",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.06),
                            BeComeToPartnerForm(
                                user: authProvider.authData.currentUser),
                            SizedBox(height: getProportionateScreenHeight(30)),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: Text(
                      "Bạn đã gửi yêu cầu trở thành đối tác. Chúng tôi đang xem xét và phê duyệt nó.\nCảm ơn về sự kiên nhẫn của bạn!",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
    );
  }
}
