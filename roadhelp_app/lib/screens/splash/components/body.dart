import 'package:flutter/material.dart';

import '/components/default_button.dart';
import '../../../config/constants.dart';
import '/screens/auth/sign_in/sign_in_screen.dart';
import '/screens/auth/sign_in_partner/sign_in_partner_screen.dart';
import '../../../config/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Chào mừng bạn đến với Road Help vui lòng chọn hình thức đăng nhập!",
      "image": "assets/images/splash.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3 ),

                    Column(
                      children: [

                        DefaultButton(
                          text: "Đăng Nhập Thành Viên",
                          press: () {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          },
                        ),
                        Container(height: 10,),
                        DefaultButton(
                          text: "Đăng Nhập Đối Tác",
                          press: () {
                            Navigator.pushNamed(context, SignInPartnerScreen.routeName);
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
