import 'base_model.dart';

class Issue extends BaseModel {
  int? userId;
  int? partnerId;
  String? address;
  String? phone;
  double? longitude;
  double? latitude;
  String? category;
  String? description;
  int? status;

  Issue({
    this.userId,
    this.partnerId,
    this.address,
    this.phone,
    this.longitude,
    this.latitude,
    this.category,
    this.description,
    this.status,
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
