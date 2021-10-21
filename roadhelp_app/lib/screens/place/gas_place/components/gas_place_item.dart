import 'package:flutter/material.dart';

String GasAvatarUrl = "https://media-cdn.laodong.vn/storage/newsportal/2020/3/30/794419/Cay-Xang-Bao-Het-Xan.jpg";


class GasPlaceItem extends StatelessWidget {
  const GasPlaceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.network(GasAvatarUrl),
      ),
      title: Text("Cây xăng số 10"),
      subtitle: Text("Giải Phóng, Giáp Bát, Hoàng Mai, Hà Nội, Việt Nam"),
      trailing: Text("2km"),
    );
  }
}
