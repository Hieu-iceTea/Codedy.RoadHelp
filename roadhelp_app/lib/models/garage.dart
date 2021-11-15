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
  int? userPartnerId;
  int? provinceId; //Tỉnh/TP
  int? districtId; //Quận/Huyện
  int? wardId; //Phường/Xã

  //Main Fields
  String? name;
  String? phone;
  double? rateAvg;
  String? address;
  double? longitude;
  double? latitude;
  String? description;
  bool? active;
  bool featured;

  //Relationship
  User? userPartner;
  List<GarageImage> garageImages;
  List<RatingGarage> ratingGarages;
  Province? province;
  District? district;
  Ward? ward;

  Garage({
    this.userPartnerId,
    this.provinceId,
    this.districtId,
    this.wardId,
    //
    this.name,
    this.phone,
    this.rateAvg,
    this.address,
    this.longitude,
    this.latitude,
    this.description,
    this.active,
    this.featured = false,
    //Relationship:
    this.userPartner,
    this.garageImages = const [],
    this.ratingGarages = const [],
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
      userPartnerId: json['userPartnerId'],
      provinceId: json['provinceId'],
      districtId: json['districtId'],
      wardId: json['wardId'],
      //
      name: json['name'],
      phone: json['phone'],
      rateAvg: json['rateAvg'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      description: json['description'],
      active: json['active'],
      featured: json['featured'] ?? false,
      //Relationship:
      userPartner: json['userPartner'] != null
          ? User.fromJson(json['userPartner'])
          : null,
      ratingGarages: json['ratingGarages'] != null
          ? RatingGarage.fromJsonToList(json['ratingGarages'])
          : [],
      garageImages: json['garageImages'] != null
          ? GarageImage.fromJsonToList(json['garageImages'])
          : [],
      province:
          json['province'] != null ? Province.fromJson(json['province']) : null,
      district:
          json['district'] != null ? District.fromJson(json['district']) : null,
      ward: json['ward'] != null ? Ward.fromJson(json['ward']) : null,
      //
      id: json['id'],
      createdAt: json['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'], isUtc: true) : null,
      createdBy: json['createdBy'],
      updatedAt: json['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(json['updatedAt'], isUtc: true) : null,
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
      //'garageRatings': ratingGarages,
      'name': name,
      'phone': phone,
      'rateAvg': rateAvg,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
      'description': description,
      'active': active,
      'isFeatured': featured,
      //
      'userPartner':
          userPartner != null ? json.decode(userPartner!.toJson()) : null,
      'province': province != null ? json.decode(province!.toJson()) : null,
      'district': district != null ? json.decode(district!.toJson()) : null,
      'ward': ward != null ? json.decode(ward!.toJson()) : null,
      //
      'id': id,
      //'createdAt': createdAt,
      'createdBy': createdBy,
      //'updatedAt': updatedAt, //DateTime.now().millisecondsSinceEpoch | updatedAt.millisecondsSinceEpoch
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
    /*garageImages: [
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
      GarageImage()
        ..imageUrl = "https://picsum.photos/500/400?random=" +
            Random().nextInt(99).toString(),
    ],*/
    name: "Garage Name™ " + Random().nextInt(99).toString(),
    phone: "012345678",
    address: "Thanh Xuan, Ha Noi",
    description: description,
    rateAvg: 4.8,
    ratingGarages: [
      RatingGarage(
          id: Random().nextInt(1000),
          garageId: 1,
          userMemberId: 1,
          ratePoint: 4,
          comment: "This is Comment for garage..."),
      RatingGarage(
          id: Random().nextInt(1000),
          garageId: 1,
          userMemberId: 2,
          ratePoint: 5,
          comment: "This is Comment for garage..."),
    ],
    featured: true,
  );
}

const String description =
    "Sản phẩm và dịch vụ của chúng tôi bao gồm bảo dưỡng, sửa chữa, đồng sơn xe ô tô, các dịch vụ chăm sóc xe, cung cấp phụ tùng chính hãng và thay thế, nhận ký gửi, mua bán xe. Chúng tôi luôn tự hào khi được sở hữu mô hình khép kín từ đội ngũ nhân viên tài năng đến hệ thống trang thiết bị tân tiến, hiện đại, với phương châm “trung thực – tận tâm – trách nhiệm – chia sẻ” đây là tài sản vô hình để tạo ra động lực thức đẩy sự phát triển, nâng cao năng lực cạnh tranh vươn tới vị trí hàng đầu tại thành phố Hồ chí Minh.";

//#endregion
