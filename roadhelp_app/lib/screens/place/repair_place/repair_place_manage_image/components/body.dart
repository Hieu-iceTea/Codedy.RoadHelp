import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/providers/garage_provider.dart';

import 'add_image_form.dart';
import 'image_item.dart';

class Body extends StatelessWidget {
  final Garage garage;

  const Body({Key? key, required this.garage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GarageProvider>(
      builder: (context, value, child) => SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(25),
          itemCount: garage.garageImages.length + 1,
          itemBuilder: (context, index) => index != garage.garageImages.length
              ? ImageItem(garageImage: garage.garageImages[index])
              : AddImageForm(
                  onSelectImage: (imageFileSelected) =>
                      onSelectImage(context, imageFileSelected)),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }

  Future<void> onSelectImage(context, imageFileSelected) async {
    try {
      await Provider.of<GarageProvider>(context, listen: false)
          .createGarageImage(
        garageId: garage.id!,
        imageFile: imageFileSelected,
      );
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
