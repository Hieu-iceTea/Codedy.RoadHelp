import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPartner extends StatefulWidget {
  const RatingPartner({Key? key}) : super(key: key);

  @override
  _RatingPartnerState createState() => _RatingPartnerState();
}

class _RatingPartnerState extends State<RatingPartner> {
  double _initialRating = 2.0;
  bool _isVertical = false;
  late double _rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: _initialRating,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return Container();
        }
      },
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }
}
