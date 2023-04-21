import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/view/home_painter.dart';
import 'dart:convert';

class RealTimeMap extends StatelessWidget {
  final height, width;
  final clr;

  const RealTimeMap(
      {Key? key,
      required this.height,
      required this.width,
      this.clr = Colors.grey});

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
      painter: MapPainter(clr: clr),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 7, color: Colors.red.withOpacity(0)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 161, 146, 5),
              blurRadius: 50.0,
              spreadRadius: 0.0,
              offset: Offset(0, 0),
            ),
          ],
          image: DecorationImage(image: img.image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
