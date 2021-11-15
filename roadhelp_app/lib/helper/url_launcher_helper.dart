import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Không thể khởi chạy $url';
}
