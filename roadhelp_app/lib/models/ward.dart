import 'base_model.dart';

class Ward extends BaseModel {
  //
  int? provinceId;
  int? districtId;

  //
  String? name;
  String? prefix;

  Ward({
    this.provinceId,
    this.districtId,
    this.name,
    this.prefix,
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
