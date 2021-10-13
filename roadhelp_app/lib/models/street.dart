import 'base_model.dart';

class Street extends BaseModel {
  //
  int? provinceId;
  int? districtId;

  //
  String? name;
  String? prefix;

  Street({
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
