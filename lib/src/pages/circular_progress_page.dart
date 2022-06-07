import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key? key}) : super(key: key);
  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    controller!.addListener(() {
      print('valor controller: ${controller!.value}');
      setState(() {
        porcentaje =
            lerpDouble(porcentaje, nuevoPorcentaje, controller!.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10.0;

            if (nuevoPorcentaje > 100) {
              nuevoPorcentaje = 0;
              porcentaje = 0;
            }
            controller!.forward(from: 0.0);
            setState(() {});
          },
          child: Icon(Icons.refresh),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            // color: Colors.red,
            child: CustomPaint(
              painter: _MyRadialProgress(porcentaje),
            ),
          ),
        ));
  }
}

class _MyRadialProgress extends CustomPainter {
  final porcentaje;

  _MyRadialProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
    //crear el Paint(lapiz) para dibujar
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    //Crear el circulo completo
    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    //Crear Lapiz Arco
    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //Arco Stroke
    double arcAngle = 2 *
        pi *
        (porcentaje / 100); //que porcentaje de una vuelta dibujamos del arco
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
