import 'package:roadhelp/config/constants.dart';

class NotificationModel {
  /// NOTE: Phần này chỉ phục vụ xem thông báo, không phải là entity model có thật trong database

  //
  int? id;

  //
  String? title;
  String? content;

  //
  String? image;

  //Xử lý sau khi get API (chuyển từ image -> imageUrl):
  String get imageUrl {
    if (image != null) {
      return baseApiUrl + "data-images/notification/" + image!;
    }

    return baseApiUrl + "data-images/notification/" + "_default.jpg";
  }

  NotificationModel({
    this.id,
    this.title,
    this.content,
    this.image,
  });
}

// Demo data for our cart

List<NotificationModel> demoNotifications = [
  NotificationModel(
    id: 1,
    //image: "",
    title: "Chào mừng bạn sử dụng ứng dụng",
    content:
        "Đội ngũ phát triển RoadHelp gửi lời cảm ơn chân thành tới bạn vì đã chọn ứng dụng là người bạn hỗ trợ trên mọi nẻo đường bạn đi tới.",
  ),
  NotificationModel(
    id: 2,
    //image: "",
    title: "Hãy hoàn tất cài đặt ban đầu",
    content:
        "Chỉ một chút nữa thôi, hãy cung cấp thêm thông tin của bạn để chúng tôi được phục vụ bạn tốt hơn!",
  ),
];
