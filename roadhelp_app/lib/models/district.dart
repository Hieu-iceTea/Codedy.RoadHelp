import 'base_model.dart';

class District extends BaseModel {
  //
  int? provinceId;

  //
  String? name;
  String? prefix;

  District({
    this.provinceId,
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
