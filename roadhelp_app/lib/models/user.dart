import 'base_model.dart';

class User extends BaseModel {
  String? userName;
  String? email;
  String? password;
  String? imageUrl;
  bool? gender;
  String? firstName;
  String? lastName;
  String? phone;
  bool? active;

  User({
    this.userName,
    this.email,
    this.password,
    this.imageUrl,
    this.gender,
    this.firstName,
    this.lastName,
    this.phone,
    this.active,
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
