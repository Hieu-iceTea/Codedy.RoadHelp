import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/models/garage.dart';

class GarageRating extends StatelessWidget {
  const GarageRating({
    Key? key,
    required this.garage,
  }) : super(key: key);

  final Garage garage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: (garage.ratingGarages != null &&
                  garage.ratingGarages!.isNotEmpty)
              ? Text(
                  "Reviews (" + garage.ratingGarages!.length.toString() + ")",
                  style: Theme.of(context).textTheme.headline6,
                )
              : Text(
                  "Reviews (0)",
                  style: Theme.of(context).textTheme.headline6,
                ),
        ),
        (garage.ratingGarages != null && garage.ratingGarages!.isNotEmpty)
            ? ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: garage.ratingGarages!.length,
                itemBuilder: (ctx, index) => ListTile(
                  onTap: () {},
                  leading:
                      Image.network("https://picsum.photos/100?random=$index"),
                  title: Text(
                      garage.ratingGarages![index].userMemberId.toString()),
                  subtitle: Text(garage.ratingGarages![index].comment!),
                  trailing: RoundedIconBtn(
                    icon: Icons.thumb_up,
                    press: () {},
                  ),
                  isThreeLine: true,
                ),
              )
            : const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Chưa có đánh giá nào về gara này."),
              )
      ],
    );
  }
}
