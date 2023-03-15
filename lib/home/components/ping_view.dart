import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';

class PingView extends StatelessWidget {
  final height, width;
  final state;
  const PingView(
      {Key? key,
      required this.height,
      required this.width,
      required this.state});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          newDot(),
          SizedBox(
            width: width * 1,
          ),
          newDot(),
          SizedBox(
            width: width * 1,
          ),
          newDot(),
          SizedBox(
            width: width * 1,
          ),
          newDot(),
          SizedBox(
            width: width * 1,
          ),
          newDot(),
          SizedBox(
            width: width * 1,
          ),
          newDot(),
        ],
      ),
    );
  }

  Widget newDot() {
    return CircleAvatar(
      backgroundColor: state ? Colors.green : Colors.grey,
      radius: height,
    );
  }
}
