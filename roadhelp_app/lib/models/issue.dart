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
  }) : super();
}
