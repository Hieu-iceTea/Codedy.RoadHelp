import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/providers/garage_provider.dart';

import 'garage_item.dart';

class PanelBody extends StatelessWidget {
  PanelBody({
    Key? key,
  }) : super(key: key);

  Future<List<Garage>> _fetchAllData(BuildContext context) async {
    return await Provider.of<GarageProvider>(context, listen: false)
        .fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Garage>>(
        future: _fetchAllData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Consumer<GarageProvider>(
                builder: (context, value, child) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white60.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.only(top: 55),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.items.length,
                        itemBuilder: (ctx, index) => GarageItem(
                          garage: value.items[index],
                        ),
                      ),
                    )
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
        });
  }
}
