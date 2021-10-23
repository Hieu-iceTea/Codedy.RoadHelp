import 'package:flutter/material.dart';

class AddImageForm extends StatelessWidget {
  const AddImageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: IconButton(
        icon: const Icon(Icons.add_a_photo),
        onPressed: () {},
      ),
    );
  }
}
