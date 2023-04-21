import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final zzHeight = size.height / 20;
    final zzWidth = size.width / 20;

    Offset start = Offset(zzWidth * 1, zzHeight * 20);
    Offset end = Offset(zzWidth, zzHeight);

    canvas.drawRRect(
        RRect.fromLTRBXY(0, 0, zzWidth * 20, zzHeight * 20, 30, 30), paint);

    canvas.drawLine(start, end, paint);

    /*
    start = Offset(zzWidth * 1, zzHeight * 20);
    end = Offset(zzWidth, zzHeight);
    canvas.drawLine(
        start,
        end,
        Paint()
          ..blendMode = BlendMode.dstOut
          ..strokeWidth = 1);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MapPainter extends CustomPainter {
  final clr;
  MapPainter({this.clr});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange.withOpacity(1)
      ..strokeWidth = 10;

    var paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange.withOpacity(1)
      ..strokeWidth = 13;

    final zzHeight = size.height / 20;
    final zzWidth = size.width / 20;

    Rect rect = Rect.fromLTWH(0, 0, zzWidth * 20, zzHeight * 20);
    canvas.drawRect(rect, paint);
    //canvas.drawShadow(path, color, elevation, transparentOccluder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class StartButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange
      //background color
      ..color = Colors.green
      ..strokeWidth = 2;

    final zzHeight = size.height / 20;
    final zzWidth = size.width / 20;

    Path path = Path()
      ..addPolygon([
        Offset(0, 0),
        Offset(zzWidth * 3, zzHeight * 20),
        Offset(zzWidth * 17, zzHeight * 20),
        Offset(zzWidth * 20, zzHeight)
      ], true)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
