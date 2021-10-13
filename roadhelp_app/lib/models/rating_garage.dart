import 'base_model.dart';

class RatingGarage extends BaseModel {
  //
  int? garageID;
  int? userID;

  //
  double? ratePoint;
  String? comment;

  RatingGarage({
    this.garageID,
    this.userID,
    this.ratePoint,
    this.comment,
    int? id,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    String? updatedBy,
    int? version,
    bool? deleted,
  }) : super(
          id: id,
          createdAt: createdAt,
          createdBy: createdBy,
          updatedAt: updatedAt,
          updatedBy: updatedBy,
          version: version,
          deleted: deleted,
        );
}
