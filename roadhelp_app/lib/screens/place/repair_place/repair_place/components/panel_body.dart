import 'package:flutter/material.dart';
import 'package:roadhelp/models/garage.dart';

import 'garage_item.dart';

class PanelBody extends StatelessWidget {
  PanelBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              itemCount: demoGarages.length,
              itemBuilder: (ctx, index) => Card(
                child: GarageItem(
                  garage: demoGarages[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
