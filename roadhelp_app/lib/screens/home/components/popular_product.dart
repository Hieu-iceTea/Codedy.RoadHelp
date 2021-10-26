import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/providers/garage_provider.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place/repair_place_screen.dart';

import '../../../config/size_config.dart';
import 'product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  Future<List<Garage>> _fetchAllData(BuildContext context) async {
    return await Provider.of<GarageProvider>(context, listen: false)
        .fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Popular Garages",
            press: () {
              Navigator.pushNamed(context, RepairPlaceScreen.routeName);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder<List<Garage>>(
          future: _fetchAllData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Consumer<GarageProvider>(
                builder: (context, value, child) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        value.items.length,
                        (index) {
                          if (value.items[index].featured)
                            return ProductCard(garage: value.items[index]);

                          return SizedBox
                              .shrink(); // here by default width and height is 0
                        },
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Util.showWidgetNotification(
                content: snapshot.error.toString(),
                isError: true,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
