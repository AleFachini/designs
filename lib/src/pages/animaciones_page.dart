import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? rotacion;
  Animation<double>? opacidad;
  Animation<double>? opacidadOut;
  Animation<double>? moverDerecha;
  Animation<double>? agrandar;

  @override
  void initState() {
    //vsync: this requiere el mixin SingleTickerProviderStateMixin
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    rotacion = Tween(
      begin: 0.0,
      end: 2 * Math.pi,
    ).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOut),
    );
    opacidad = Tween(
      begin: 0.1,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(
          //Agrega porcentualmente en cuanto de la animacion hara el efecto de opacidad
          0.0,
          0.25,
          curve: Curves.easeOut,
        ),
      ),
    );

    opacidadOut = Tween(
      begin: 1.0,
      end: 0.1,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(
          //Agrega porcentualmente en cuanto de la animacion hara el efecto de opacidad
          0.75,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    moverDerecha = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOut),
    );

    agrandar = Tween(
      //entre 0 y N veces su tamaño original
      begin: 0.0,
      end: 2.0,
    ).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOut),
    );

    //agregamos un listener al controller de la siguiente manera
    controller!.addListener(() {
      print('Status: ${controller!.status}');
      if (controller!.status == AnimationStatus.completed) {
        controller!.reverse();
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
      child:
          _Rectangulo(), //Dejamos el widget y luego concatenaremos animaciones
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moverDerecha!.value,
              0), //offset toma valores en ejes XY a parteir de TOPLEFT
          child: Transform.rotate(
            angle: rotacion!.value,
            child: Opacity(
              opacity: opacidad!.value,
              child: Opacity(
                opacity: opacidadOut!.value,
                child: Transform.scale(
                  scale: agrandar!.value,
                  child: child,
                ),
              ), //el rectangulo que esta en animatedBuilder es este "child"
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
