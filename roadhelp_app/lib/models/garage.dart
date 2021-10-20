import 'dart:convert';
import 'dart:math';

import '/models/province.dart';
import '/models/rating_garage.dart';
import '/models/user.dart';
import '/models/ward.dart';
import 'base_model.dart';
import 'district.dart';
import 'garage_image.dart';

class Garage extends BaseModel {
  //Foreign Keys
  final int? userPartnerId;
  final int? provinceId; //Tỉnh/TP
  final int? districtId; //Quận/Huyện
  final int? wardId; //Phường/Xã

  //Main Fields
  final String? name;
  final String? phone;
  final double? ratingAvg;
  final String? address;
  final double? longitude;
  final double? latitude;
  final String? description;
  final bool? active;
  final bool? isFeatured;

  //Relationship
  final User? userPartner;
  final List<GarageImage>? garageImages;
  final List<RatingGarage>? ratingGarages;
  final Province? province;
  final District? district;
  final Ward? ward;

  Garage({
    this.userPartnerId,
    this.provinceId,
    this.districtId,
    this.wardId,
    //
    this.name,
    this.phone,
    this.ratingAvg,
    this.address,
    this.longitude,
    this.latitude,
    this.description,
    this.active,
    this.isFeatured,
    //Relationship:
    this.userPartner,
    this.garageImages,
    this.ratingGarages,
    this.province,
    this.district,
    this.ward,
    //BaseModel:
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

  //
  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      userPartnerId: json['partnerId'],
      provinceId: json['provinceId'],
      districtId: json['districtId'],
      wardId: json['wardId'],
      //
      name: json['name'],
      phone: json['phone'],
      ratingAvg: json['ratingAvg'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      description: json['description'],
      active: json['active'],
      isFeatured: json['isFeatured'],
      //Relationship:
      userPartner: User.fromJson(json['userPartner']),
      garageImages: GarageImage.fromJsonToList(json['garageImages']),
      ratingGarages: RatingGarage.fromJsonToList(json['ratingGarages']),
      province: Province.fromJson(json['province']),
      district: District.fromJson(json['district']),
      ward: Ward.fromJson(json['ward']),
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
  static List<Garage> fromJsonToList(dynamic json) {
    return json.map<Garage>((element) => Garage.fromJson(element)).toList();
  }

  //
  String toJson() {
    return json.encode({
      'partnerId': userPartnerId,
      'provinceId': provinceId,
      'districtId': districtId,
      'wardId': wardId,
      'garageRatings': ratingGarages,
      'name': name,
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
    garageImages: [
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
      GarageImage(
          imageUrl: "https://picsum.photos/500/400?random=" +
              Random().nextInt(99).toString()),
    ],
    name: "Garage Name™ " + Random().nextInt(99).toString(),
    phone: "012345678",
    address: "Thanh Xuan, Ha Noi",
    description: description,
    ratingAvg: 4.8,
    ratingGarages: [
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
