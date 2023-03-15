import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
          newText(),
          SizedBox(
            width: sBoxWidth,
          ),
          newText(),
          SizedBox(
            width: sBoxWidth,
          ),
          newText(),
          SizedBox(
            width: sBoxWidth,
          ),
          newText(),
          SizedBox(
            width: sBoxWidth,
          )
        ],
      ),
    );
  }

  Widget newText() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        elevation: 5,
      ),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0),
              blurRadius: 4,
              offset: Offset(4, 8), // changes position of shadow
            ),
          ],
        ),
        child: Text("Test",
            style: TextStyle(
              color: Colors.white70,
              fontSize: height * 0.2,
            )),
      ),
    );
  }
}
