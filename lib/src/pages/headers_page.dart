import 'package:designs/src/theme/themes.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: HeaderWaves(color: appTheme.currentTheme.colorScheme.secondary),
    );
  }
}
