import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/screens/place/repair_place/repair_place_details/repair_place_details_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'components/body.dart';

class RepairPlaceScreen extends StatelessWidget {
  static String routeName = "/repair_place";

  const RepairPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    return Scaffold(
      body: SlidingUpPanel(
        //backdropEnabled: true,
        collapsed: _panelHeader(opacity: 1),
        maxHeight: SizeConfig.screenHeight * .75,
        minHeight: 95.0,
        parallaxEnabled: true,
        parallaxOffset: .5,
        header: _panelHeader(opacity: 0.9),
        panel: SingleChildScrollView(
          child: Column(
            children: [_panelBody()],
          ),
        ),
        //panelBuilder: (scrollController) => _panel(scrollController),
        body: Body(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
    );
  }

  Widget _panelHeader({required double opacity}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(height: 18.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "List Repair Place",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0),
        ],
      ),
    );
  }

  Widget _panelBody() {
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
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 55),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: demoGarages.length,
              itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  onTap: () => Navigator.pushNamed(
                    ctx,
                    RepairPlaceDetailsScreen.routeName,
                    arguments:
                        RepairPlaceDetailsArguments(garage: demoGarages[index]),
                  ),
                  leading: Hero(
                    tag: demoGarages[index].id.toString(),
                    child: Image.network(demoGarages[index].imageUrls![0]),
                  ),
                  title: Text(demoGarages[index].name!),
                  subtitle: Text(demoGarages[index].phone! +
                      '\n' +
                      demoGarages[index].address! +
                      '| 2 Km'),
                  trailing: RoundedIconBtn(
                    icon: Icons.directions,
                    showShadow: true,
                    press: () {},
                  ),
                  isThreeLine: true,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
