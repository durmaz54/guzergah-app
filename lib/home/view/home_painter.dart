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
      ..color = clr
      ..strokeWidth = 1;

    var paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..color = Color.fromARGB(255, 161, 146, 5)
      ..strokeWidth = 1;

    final zzHeight = size.height / 20;
    final zzWidth = size.width / 20;

    Offset start = Offset(zzWidth * 5, zzHeight * 20);
    Offset end = Offset(zzWidth * 2, zzHeight * 25);
    canvas.drawLine(start, end, paint);

    start = Offset(zzWidth * 2, zzHeight * 25);
    end = Offset(zzWidth * 2, zzHeight * 35);
    canvas.drawLine(start, end, paint);

    start = Offset(zzWidth * 15, zzHeight * 20);
    end = Offset(zzWidth * 18, zzHeight * 25);
    canvas.drawLine(start, end, paint);

    start = Offset(zzWidth * 18, zzHeight * 25);
    end = Offset(zzWidth * 18, zzHeight * 35);
    canvas.drawLine(start, end, paint);

    //orta yatay çizgi
    start = Offset(zzWidth * 4, zzHeight * 25);
    end = Offset(zzWidth * 16, zzHeight * 25);
    canvas.drawLine(start, end, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
