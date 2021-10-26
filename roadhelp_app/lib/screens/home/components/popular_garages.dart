import 'package:flutter/material.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/repositories/garage_repository.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place/repair_place_screen.dart';

import '../../../config/size_config.dart';
import 'garage_card.dart';
import 'section_title.dart';

class PopularGarages extends StatelessWidget {
  Future<List<Garage>> _fetchAllData(BuildContext context) async {
    /*return await Provider.of<GarageProvider>(context, listen: false)
        .fetchAllData();*/

    return await GarageRepository.findAllByFeatured();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Tiệm sửa xe nổi bật",
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
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      snapshot.data!.length,
                      (index) {
                        return GarageCard(garage: snapshot.data![index]);
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
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
