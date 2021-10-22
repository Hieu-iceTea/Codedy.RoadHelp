import 'package:flutter/material.dart';
import 'package:roadhelp/models/garage.dart';

class Body extends StatelessWidget {
  final Garage garage;

  const Body({Key? key, required this.garage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(25),
        itemCount: garage.garageImages.length,
        itemBuilder: (context, index) => Image.network(garage.garageImages[index].imageUrl!),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
