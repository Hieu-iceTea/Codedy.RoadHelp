import 'dart:convert';
import 'dart:math';

import 'package:roadhelp/models/rating_garage.dart';

import 'base_model.dart';

class Garage extends BaseModel {
  //#region - Foreign Keys (Khóa ngoại) -

  final int? partnerId;
  final int? provinceId;
  final int? districtId;
  final int? wardId;

  //#endregion

  //#region - Main Fields (Các trường chính của bảng này) -

  final String? name;
  final List<String>? imageUrls;
  final String? phone;
  final double? ratingAvg;
  final String? address;
  final double? longitude;
  final double? latitude;
  final String? description;
  final bool? active;
  final bool? isFeatured;

  //#endregion

  //#region - Relationship (Mối quan hệ & liên kết bảng khác) -

  final List<RatingGarage>? garageRatings;

  //#endregion

  //#region - Constructor (Hàm tạo)-

  Garage({
    this.partnerId,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.garageRatings,
    this.name,
    this.imageUrls,
    this.phone,
    this.ratingAvg,
    this.address,
    this.longitude,
    this.latitude,
    this.description,
    this.active,
    this.isFeatured,
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

//#endregion

  //
  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      partnerId: json['partnerId'],
      provinceId: json['provinceId'],
      districtId: json['districtId'],
      wardId: json['wardId'],
      garageRatings: json['garageRatings'],
      name: json['name'],
      imageUrls: json['imageUrls'],
      phone: json['phone'],
      ratingAvg: json['ratingAvg'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      description: json['description'],
      active: json['active'],
      isFeatured: json['isFeatured'],
      //
      id: json['id'],
      //createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      //updatedAt: json['updatedAt'],
      updatedBy: json['updatedBy'],
      version: json['version'],
      deleted: json['deleted'],
    );
  }

  //
  String toJson() {
    return json.encode({
      'partnerId': partnerId,
      'provinceId': provinceId,
      'districtId': districtId,
      'wardId': wardId,
      'garageRatings': garageRatings,
      'name': name,
      'imageUrls': imageUrls,
      'phone': phone,
      'ratingAvg': ratingAvg,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
      'description': description,
      'active': active,
      'isFeatured': isFeatured,
      //
      'id': id,
      //'createdAt': createdAt,
      'createdBy': createdBy,
      //'updatedAt': updatedAt,
      'updatedBy': updatedBy,
      'version': version,
      'deleted': deleted,
    });
  }
}

//#region - Fake Data -

final List<Garage> demoGarages = [
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
  getTmpGarage(),
];

Garage getTmpGarage() {
  return Garage(
    id: Random().nextInt(1000),
    imageUrls: [
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
      "https://picsum.photos/500/400?random=" + Random().nextInt(99).toString(),
    ],
    name: "Garage Name™ " + Random().nextInt(99).toString(),
    phone: "012345678",
    address: "Thanh Xuan, Ha Noi",
    description: description,
    ratingAvg: 4.8,
    garageRatings: [
      RatingGarage(
          id: Random().nextInt(1000),
          garageID: 1,
          userID: 1,
          ratePoint: 4.5,
          comment: "This is Comment for garage..."),
      RatingGarage(
          id: Random().nextInt(1000),
          garageID: 1,
          userID: 2,
          ratePoint: 4.5,
          comment: "This is Comment for garage..."),
    ],
    isFeatured: true,
  );
}

const String description =
    "Sản phẩm và dịch vụ của chúng tôi bao gồm bảo dưỡng, sửa chữa, đồng sơn xe ô tô, các dịch vụ chăm sóc xe, cung cấp phụ tùng chính hãng và thay thế, nhận ký gửi, mua bán xe. Chúng tôi luôn tự hào khi được sở hữu mô hình khép kín từ đội ngũ nhân viên tài năng đến hệ thống trang thiết bị tân tiến, hiện đại, với phương châm “trung thực – tận tâm – trách nhiệm – chia sẻ” đây là tài sản vô hình để tạo ra động lực thức đẩy sự phát triển, nâng cao năng lực cạnh tranh vươn tới vị trí hàng đầu tại thành phố Hồ chí Minh.";

//#endregion
