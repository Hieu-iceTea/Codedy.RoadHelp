import 'dart:math';

import 'package:roadhelp/models/garage_rating.dart';

class Garage {
  final int id;

  final int? partner_id;
  final int? district_id;
  final int? province_id;

  final List<GarageRating>? garageRatings;

  final String? name;
  final List<String>? imageUrls;
  final String? phone;
  final double? ratingAvg;
  final String? address;
  final String? commune;
  final double? Longitude;
  final double? Latitude;
  final String? description;
  final bool? active;

  final bool? isFavourite;
  final bool? isPopular;

  Garage({
    required this.id,
    this.partner_id,
    this.district_id,
    this.province_id,
    this.garageRatings,
    this.name,
    this.imageUrls,
    this.phone,
    this.ratingAvg,
    this.address,
    this.commune,
    this.Longitude,
    this.Latitude,
    this.description,
    this.active,
    this.isFavourite,
    this.isPopular,
  });
}

// Our demo Garages

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
      GarageRating(
          id: Random().nextInt(1000),
          garageID: 1,
          userID: 1,
          ratePoint: 4.5,
          comment: "This is Comment for garage..."),
      GarageRating(
          id: Random().nextInt(1000),
          garageID: 1,
          userID: 2,
          ratePoint: 4.5,
          comment: "This is Comment for garage..."),
    ],
    isFavourite: true,
    isPopular: true,
  );
}

const String description =
    "Sản phẩm và dịch vụ của chúng tôi bao gồm bảo dưỡng, sửa chữa, đồng sơn xe ô tô, các dịch vụ chăm sóc xe, cung cấp phụ tùng chính hãng và thay thế, nhận ký gửi, mua bán xe. Chúng tôi luôn tự hào khi được sở hữu mô hình khép kín từ đội ngũ nhân viên tài năng đến hệ thống trang thiết bị tân tiến, hiện đại, với phương châm “trung thực – tận tâm – trách nhiệm – chia sẻ” đây là tài sản vô hình để tạo ra động lực thức đẩy sự phát triển, nâng cao năng lực cạnh tranh vươn tới vị trí hàng đầu tại thành phố Hồ chí Minh.";
