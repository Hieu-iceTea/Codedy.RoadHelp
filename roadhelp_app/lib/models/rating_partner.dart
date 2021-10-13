import 'base_model.dart';

class RatingPartner extends BaseModel {
  //
  String? partnerId;
  String? userId;
  String? issueId;

  //
  double? ratePoint;
  String? comment;

  RatingPartner({
    this.partnerId,
    this.userId,
    this.issueId,
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
