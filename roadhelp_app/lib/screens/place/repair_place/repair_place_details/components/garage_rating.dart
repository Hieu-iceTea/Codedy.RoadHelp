import 'package:flutter/material.dart';
import 'package:roadhelp/components/rounded_icon_btn.dart';
import 'package:roadhelp/config/size_config.dart';
import 'package:roadhelp/helper/util.dart';
import 'package:roadhelp/models/garage.dart';
import 'package:roadhelp/models/rating_garage.dart';
import 'package:roadhelp/repositories/rating_garage_repository.dart';

class GarageRating extends StatelessWidget {
  const GarageRating({
    Key? key,
    required this.garage,
  }) : super(key: key);

  final Garage garage;

  Future<List<RatingGarage>> _fetchAllData(BuildContext context) async {
    return await RatingGarageRepository.findAllByGarageId(garageId: garage.id!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RatingGarage>>(
      future: _fetchAllData(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: (garage.ratingGarages != null &&
                        garage.ratingGarages!.isNotEmpty)
                    ? Text(
                        "Reviews (" + snapshot.data!.length.toString() + ")",
                        style: Theme.of(context).textTheme.headline6,
                      )
                    : Text(
                        "Reviews (0)",
                        style: Theme.of(context).textTheme.headline6,
                      ),
              ),
              (snapshot.data != null && snapshot.data!.isNotEmpty)
                  ? ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) => ListTile(
                        onTap: () {},
                        leading: Image.network(
                            snapshot.data![index].userMember!.imageUrl!),
                        title: Text(
                          snapshot.data![index].userMember!.firstName! +
                              " " +
                              snapshot.data![index].userMember!.lastName!,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                            getRate(snapshot.data![index].ratePoint!) +
                                "\n" +
                                snapshot.data![index].comment!),
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
        } else if (snapshot.hasError) {
          return Util.showWidgetNotification(
            content: snapshot.error.toString(),
            isError: true,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  String getRate(int rate) {
    String result = "";

    for (int i = 0; i < rate; i++) {
      result += "⭐";
    }

    result += " (" + rate.toString() + ")";

    return result;
  }
}
