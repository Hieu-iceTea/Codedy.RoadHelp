import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/size_config.dart';
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
              itemCount: 10,
              itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  onTap: () {},
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Garage Name ($index)'),
                  subtitle: Text(
                      'Số điện thoại\nĐịa chỉ | Khoảng cách'),
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
