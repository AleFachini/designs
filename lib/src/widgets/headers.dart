import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderCuadrado extends StatelessWidget {
  HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615aab),
    );
  }
}

class HeaderBordesRendondeados extends StatelessWidget {
  HeaderBordesRendondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: const Color(0xff615aab),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //es el lapiz

    //Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // or .fill
    paint.strokeWidth = 10;

    final path = new Path(); //es el camino que debe hacer el lapiz

    //Dibujar con el paint y el path
    //moveTO mueve el lapiz sin apollarlo entonces no traza
    //lineTo mueve el lapiz trazando el recorrido
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //ahora le indico al canvas que dibuje
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //es el lapiz

    //Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // .stroke or .fill
    paint.strokeWidth = 10;

    final path = new Path(); //es el camino que debe hacer el lapiz

    //Dibujar con el paint y el path
    //moveTO mueve el lapiz sin apollarlo entonces no traza
    //lineTo mueve el lapiz trazando el recorrido
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0); //Triangulo superior
    //path.lineTo(0, size.height); //Triangulo inferior
    path.lineTo(0, 0);

    //ahora le indico al canvas que dibuje
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //es el lapiz

    //Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // .stroke or .fill
    paint.strokeWidth = 10;

    final path = new Path(); //es el camino que debe hacer el lapiz

    //Dibujar con el paint y el path
    //moveTO mueve el lapiz sin apollarlo entonces no traza
    //lineTo mueve el lapiz trazando el recorrido
    path.moveTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //ahora le indico al canvas que dibuje
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //es el lapiz

    //Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // .stroke or .fill
    paint.strokeWidth = 10;

    final path = new Path(); //es el camino que debe hacer el lapiz

    //Dibujar con el paint y el path
    //moveTO mueve el lapiz sin apollarlo entonces no traza
    //lineTo mueve el lapiz trazando el recorrido
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    //ahora le indico al canvas que dibuje
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  HeaderWaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //es el lapiz

    //Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill; // .stroke or .fill
    paint.strokeWidth = 10;

    final path = new Path(); //es el camino que debe hacer el lapiz

    //Dibujar con el paint y el path
    //moveTO mueve el lapiz sin apollarlo entonces no traza
    //lineTo mueve el lapiz trazando el recorrido
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    //ahora le indico al canvas que dibuje
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
