import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  HeaderWaves({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesPainter(this.color),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  final Color? color;

  _HeaderWavesPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //es el lapiz

    //Propiedades
    paint.color = color!; // Color(0xff615aab);
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

class HeaderWavesGradient extends StatelessWidget {
  HeaderWavesGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(0.0, 55.0), radius: 180);

    final Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6d05e8),
          Color(0xffc012ff),
          Color(0xff6d05fa),
        ],
        stops: [
          0.2,
          0.5,
          1.0,
        ]);

    final paint = Paint()..shader = gradiente.createShader(rect); //es el lapiz

    //Propiedades
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

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTilte;
  final Color colorGrad1;
  final Color colorGrad2;
  IconHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subTilte,
    this.colorGrad1 = const Color(0xff526bf6),
    this.colorGrad2 = const Color(0xff67acf2),
  });

  @override
  Widget build(BuildContext context) {
    final colorWhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(
          colorGrad1: this.colorGrad1,
          colorGrad2: this.colorGrad2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              this.subTilte,
              style: TextStyle(
                fontSize: 20,
                color: colorWhite,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.title,
              style: TextStyle(
                fontSize: 25,
                color: colorWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              this.icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color colorGrad1;
  final Color colorGrad2;

  _IconHeaderBackground(
      {super.key, required this.colorGrad1, required this.colorGrad2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
          gradient: LinearGradient(
            colors: [
              this.colorGrad1,
              this.colorGrad2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
    );
  }
}
