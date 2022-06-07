import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percent;

  RadialProgress({super.key, required this.percent});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${widget.percent}'),
    );
  }
}
