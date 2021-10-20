import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/providers/garage_provider.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_manage/components/repair_place_item.dart';

import '/config/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> _fetchAllData(BuildContext context) async {
    await Provider.of<GarageProvider>(context, listen: false).fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchAllData(context),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _fetchAllData(context),
                  child: Consumer<GarageProvider>(
                    builder: (context, value, child) => ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15)),
                      itemCount: value.items.length,
                      itemBuilder: (ctx, index) => RepairPlaceItem(
                        garage: value.items[index],
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                ),
    );
  }
}
