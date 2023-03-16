import 'package:flutter/material.dart';

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
      ..color = Colors.white12
      ..strokeWidth = 1;

    var paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange.withOpacity(1)
      ..strokeWidth = 13;

    final zzHeight = size.height / 20;
    final zzWidth = size.width / 20;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), zzHeight * 10.5, paint2);
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), zzHeight * 12.3, paint);
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), zzHeight * 12.8, paint);

    //canvas.drawShadow(path, color, elevation, transparentOccluder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
