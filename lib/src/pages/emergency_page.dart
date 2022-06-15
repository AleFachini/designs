import 'package:designs/src/widgets/fat_button.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FatButton(
          icon: FontAwesomeIcons.carBurst,
          text: 'Motor Accident',
          colorGrad1: Color(0xff6989f5),
          colorGrad2: Color(0xff906ef5),
          onPress: (() {
            print('Click!');
          }),
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subTilte: 'Haz solicitado',
      title: 'Asistencia Médica',
    );
  }
}
