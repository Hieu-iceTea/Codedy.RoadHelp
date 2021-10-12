class BaseModel {
  int? id;
  DateTime? createdAt;
  String? createdBy;
  DateTime? updatedAt;
  String? updatedBy;
  int? version;
  bool? deleted;

  BaseModel({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.version,
    this.deleted,
  });
}
