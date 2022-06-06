import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  CuadradoAnimadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? moverDerecha;
  Animation<double>? moverArriba;
  Animation<double>? moverIzquierda;
  Animation<double>? moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    moverDerecha = Tween(
      begin: 0.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moverArriba = Tween(
      begin: 0.0,
      end: -150.0, //mover arriba es negativo ya que Y positivo es para abajo
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moverIzquierda = Tween(
      begin: 0.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(
          0.50,
          0.75,
          curve: Curves.bounceOut,
        ),
      ),
    );

    moverAbajo = Tween(
      begin: 0.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(
          0.75,
          1.0,
          curve: Curves.bounceOut,
        ),
      ),
    );

    //agregamos un listener al controller de la siguiente manera
    controller!.addListener(() {
      print('Status: ${controller!.status}');
      if (controller!.status == AnimationStatus.completed) {
        controller!.reset();
      }
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
    controller!.forward();
    return AnimatedBuilder(
        animation: controller!,
        child: _Rectangulo(),
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(
                  moverDerecha!.value - moverIzquierda!.value,
                  //moverAbajo le suma a mover Arriba que es negativo
                  moverArriba!.value + moverAbajo!.value),
              child: child!);
        });
  }
}

class _Rectangulo extends StatelessWidget {
  _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
