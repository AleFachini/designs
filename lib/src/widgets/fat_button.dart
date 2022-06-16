import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorGrad1;
  final Color colorGrad2;
  final Function() onPress;

  FatButton(
      {super.key,
      this.icon = Icons.cancel,
      required this.text,
      this.colorGrad1 = Colors.blue,
      this.colorGrad2 = Colors.lightBlue,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _FatButtonBackground(
            icon: this.icon,
            colorGrad1: this.colorGrad1,
            colorGrad2: this.colorGrad2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                this.icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(this.text,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color colorGrad1;
  final Color colorGrad2;

  _FatButtonBackground(
      {super.key,
      required this.icon,
      required this.colorGrad1,
      required this.colorGrad2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: const BorderRadius.all(const Radius.circular(15)),
        gradient: LinearGradient(
          colors: [this.colorGrad1, this.colorGrad2],
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
