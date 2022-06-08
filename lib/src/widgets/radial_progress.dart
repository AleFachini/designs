import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWidth;
  final double secondaryWidth;

  RadialProgress({
    super.key,
    required this.percent,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryWidth = 10,
    this.secondaryWidth = 4,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double? previousPercent;

  @override
  void initState() {
    previousPercent = widget.percent;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(from: 0.0);
    final diffToAnimate = widget.percent - previousPercent;
    previousPercent = widget.percent;
    return AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MyRadialProgress(
                (widget.percent - diffToAnimate) +
                    (diffToAnimate * controller!.value),
                widget.primaryColor,
                widget.secondaryColor,
                widget.primaryWidth,
                widget.secondaryWidth,
              ),
            ),
          );
        });
  }
}

class _MyRadialProgress extends CustomPainter {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWidth;
  final double secondaryWidth;

  _MyRadialProgress(
    this.percent,
    this.primaryColor,
    this.secondaryColor,
    this.primaryWidth,
    this.secondaryWidth,
  );
  @override
  void paint(Canvas canvas, Size size) {
    //crear el Paint(lapiz) para dibujar
    final paint = Paint()
      ..strokeWidth = secondaryWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    //Crear el circulo completo
    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    //Crear Lapiz Arco
    final paintArc = Paint()
      ..strokeWidth = primaryWidth
      ..color = primaryColor
      ..style = PaintingStyle.stroke;

    //Arco Stroke
    double arcAngle = 2 *
        pi *
        (percent / 100); //que porcentaje de una vuelta dibujamos del arco
    canvas.drawArc(
        Rect.fromCircle(
            center: center, radius: radius), //espacio donde se ubica el arco
        -pi /
            2, //90 grados negativos desde el origen que es a la derecha ---> clockwise
        arcAngle, //Que porcentaje desde el origen va a pintar en relacion a 2*pi
        false,
        paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
