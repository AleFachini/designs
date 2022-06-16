import 'package:animate_do/animate_do.dart';
import 'package:designs/src/widgets/fat_button.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//clase auxiliar para botones custom
class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Lista con distintos items para crear botones
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> buttonList = items
        .map(
          (item) => FadeInLeft(
            duration: Duration(milliseconds: 300),
            child: FatButton(
              icon: item.icon,
              text: item.texto,
              colorGrad1: item.color1,
              colorGrad2: item.color2,
              onPress: () => print('${item.texto}'),
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 280),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ...buttonList,
              ],
            ),
          ),
          _HeaderFull(),
        ],
      ),
    );
  }
}

class _HeaderFull extends StatelessWidget {
  const _HeaderFull({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          title: 'Asistencia Médica',
          subTilte: 'Haz solicitado',
          icon: FontAwesomeIcons.plus,
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(12),
            child: FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
