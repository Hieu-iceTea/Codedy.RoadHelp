import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage_image.dart';
import 'package:roadhelp/providers/garage_provider.dart';

class ImageItem extends StatelessWidget {
  final GarageImage garageImage;

  const ImageItem({Key? key, required this.garageImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Hero(
              tag: garageImage.imageUrl! +
                  "RepairPlaceDetails_RepairPlaceManageImage",
              child: Image.network(
                garageImage.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            top: -15,
            right: -15,
            child: RoundedIconBtn(
              icon: Icons.cancel,
              press: () => onDeleteImage(context),
              showShadow: true,
            )),
      ],
    );
  }

  Future<void> onDeleteImage(context) async {
    try {
      bool confirm = await Util.confirmDialog(
          context: context, title: "Xác nhận xóa ảnh này?");

      if (confirm) {
        await Provider.of<GarageProvider>(context, listen: false)
            .removeGarageImage(garageImage);
      }
    } catch (error) {
      await Util.showDialogNotification(
          context: context, content: error.toString());
    }
  }
}
