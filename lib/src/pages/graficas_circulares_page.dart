import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          '$porcentaje %',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
