import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/view/home_painter.dart';
import 'dart:convert';

class RealTimeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: CustomPaint(
          foregroundPainter: LinePainter(),
          child: StreamBuilder(
              stream: Client.readData(),
              builder: (context, snapshot) {
                if (snapshot.data?.image != null) {
                  try {
                    var decode = base64.decode(snapshot.data!.image
                        .toString()
                        .replaceAll(RegExp(r'\s+'), ''));
                    return Image.memory(decode, gaplessPlayback: true);
                  } catch (e) {
                    return Image.asset("assets/images/guzergah.png");
                  }
                } else {
                  return Image.asset("assets/images/guzergah.png");
                }
              }),
        ));
  }
}
