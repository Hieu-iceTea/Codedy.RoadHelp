import 'package:flutter/material.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'components/body.dart';
import 'components/header_bar.dart';
import 'components/panel_body.dart';
import 'components/panel_header.dart';

class RepairPlaceScreen extends StatelessWidget {
  static String routeName = "/repair_place";

  const RepairPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen:
    SizeConfig().init(context);

    final RepairPlaceArguments? arguments =
        ModalRoute.of(context)!.settings.arguments as RepairPlaceArguments?;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SlidingUpPanel(
            //backdropEnabled: true,
            collapsed: PanelHeader(opacity: 1),
            maxHeight: SizeConfig.screenHeight * .75,
            minHeight: 95.0,
            parallaxEnabled: true,
            parallaxOffset: .5,
            header: PanelHeader(opacity: 0.9),
            panel: SingleChildScrollView(
              child: Column(
                children: [PanelBody()],
              ),
            ),
            //panelBuilder: (scrollController) => _panel(scrollController),
            body: const Body(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
          ),
          Positioned(
            top: 10,
            child: HeaderBar(initialKeyword: arguments?.initialKeyword),
          )
        ],
      ),
    );
  }
}

class RepairPlaceArguments {
  final String initialKeyword;

  RepairPlaceArguments({required this.initialKeyword});
}
