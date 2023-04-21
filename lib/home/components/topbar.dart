import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final height, width;
  TopBar({super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    final sBoxWidth = width * 0.07;

    return Container(
      height: height,
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: sBoxWidth,
          ),
          Text(
            "Guzergah AGV",
            style: TextStyle(
              color: Colors.white70,
              fontSize: height * 0.3,
            ),
          ),
          Spacer(),
          newText("Anasayfa"),
          newText("Log Kayıtları"),
          newText("Araçlar"),
          newText("Ayarlar"),
        ],
      ),
    );
  }

  Widget newText(String txt) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => print("ssssssss"),
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.home,
              size: 30,
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Text(
              txt,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: width * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
