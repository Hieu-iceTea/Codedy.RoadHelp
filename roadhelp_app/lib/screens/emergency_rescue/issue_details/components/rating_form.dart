import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:roadhelp/helper/keyboard.dart';
import 'package:roadhelp/helper/util.dart';

import '/components/custom_surfix_icon.dart';
import '/components/default_button.dart';
import '/config/size_config.dart';

class RatingForm extends StatefulWidget {
  Function(double ratePoint, String comment) onSubmit;

  RatingForm({
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  _RatingFormState createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  final _formKey = GlobalKey<FormState>();

  double? ratePoint;
  String? comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: double.maxFinite,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              buildRatingBarFormField(),
              SizedBox(height: getProportionateScreenHeight(50)),
              buildCommentFormField(),
              SizedBox(height: getProportionateScreenHeight(50)),
              DefaultButton(
                text: "Okey",
                press: () => _submitForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildCommentFormField() {
    return TextFormField(
      initialValue: comment,
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: 5,
      onSaved: (newValue) => comment = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập bình luận";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Bình luận",
        hintText: "Nhập bình luận",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Chat bubble Icon.svg"),
      ),
    );
  }

  RatingBar buildRatingBarFormField() {
    return RatingBar.builder(
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        ratePoint = rating;
      },
    );
  }

  Future<void> _submitForm() async {
    KeyboardUtil.hideKeyboard(context);

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (ratePoint == null) {
      await Util.showDialogNotification(
          context: context,
          title: "Thiếu thông tin",
          content: "Vui lòng nhập số điểm đánh giá");

      return;
    }

    _formKey.currentState!.save();

    widget.onSubmit(ratePoint!, comment!);

    Navigator.of(context).pop();
  }
}
