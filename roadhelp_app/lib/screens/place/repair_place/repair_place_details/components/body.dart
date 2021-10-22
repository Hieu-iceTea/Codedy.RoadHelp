import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/providers/garage_provider.dart';

import '/components/default_button.dart';
import 'garage_description.dart';
import 'slider_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Garage garage;

  const Body({Key? key, required this.garage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GarageProvider>(
      builder: (context, value, child) => ListView(
        children: [
          SliderImages(garage: garage),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                GarageDescription(
                  garage: garage,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(20)),
                            child: (garage.ratingGarages != null &&
                                    garage.ratingGarages!.isNotEmpty)
                                ? Text(
                                    "Reviews (" +
                                        garage.ratingGarages!.length
                                            .toString() +
                                        ")",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                : Text(
                                    "Reviews (0)",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                          ),
                          (garage.ratingGarages != null &&
                                  garage.ratingGarages!.isNotEmpty)
                              ? ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(),
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(15)),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (ctx, index) => ListTile(
                                    onTap: () {},
                                    leading: Image.network(
                                        "https://picsum.photos/100?random=$index"),
                                    title: Text('User Name $index'),
                                    subtitle: Text('Cửa hàng phụ vụ rất \ntốt'),
                                    trailing: RoundedIconBtn(
                                      icon: Icons.thumb_up,
                                      press: () {},
                                    ),
                                    isThreeLine: true,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child:
                                      Text("Chưa có đánh giá nào về gara này."),
                                )
                        ],
                      ),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "View on map",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
