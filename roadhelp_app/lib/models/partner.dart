import 'base_model.dart';

class Partner extends BaseModel {
  String? userName;
  String? email;
  String? password;
  String? imageUrl;
  bool? gender;
  String? firstName;
  String? lastName;
  String? phone;
  bool? active;
  double? rateAvg; //Cột này không có trong: User, Admin

  Partner({
    this.userName,
    this.email,
    this.password,
    this.imageUrl,
    this.gender,
    this.firstName,
    this.lastName,
    this.phone,
    this.active,
    this.rateAvg,
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
