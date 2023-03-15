import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/view/home_painter.dart';
import 'dart:convert';

class RealTimeMap extends StatelessWidget {
  final height, width;
  const RealTimeMap({Key? key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: StreamBuilder(
            stream: Client.readData(),
            builder: (context, snapshot) {
              if (snapshot.data?.image != null) {
                try {
                  var decode = base64.decode(snapshot.data!.image
                      .toString()
                      .replaceAll(RegExp(r'\s+'), ''));
                  return Container(
                      child: errorWidget(Image.memory(decode,
                          gaplessPlayback:
                              true))); //Image.memory(decode, gaplessPlayback: true)
                } catch (e) {
                  return errorWidget(Image.asset("assets/images/gz.jpg"));
                }
              } else {
                return errorWidget(Image.asset("assets/images/gz.jpg"));
              }
            }));
  }

  Widget errorWidget(Image img) {
    return CustomPaint(
      painter: MapPainter(clr: Colors.green),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.green),
            boxShadow: [
              BoxShadow(
                color: Colors.green
                    .withAlpha(100), // Color.fromARGB(255, 161, 146, 5)
                blurRadius: 30.0,
                spreadRadius: 10.0,
                offset: Offset(8, 8),
              ),
            ],
            image: DecorationImage(image: img.image, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
