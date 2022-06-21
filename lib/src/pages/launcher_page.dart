import 'package:designs/src/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:designs/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Designs with Flutter'),
      ),
      drawer: _MainMenu(),
      body: _OptionList(),
    );
  }
}

class _OptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) =>
          Divider(color: appTheme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text('${pageRoutes[i].title}'),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  _MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 200,
                width: double.infinity,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                  child: Text(
                    'AF',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _OptionList(),
            ),
            ListTile(
              //Switch Dark Mode en Drawer
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme.currentTheme.colorScheme.secondary,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.colorScheme.secondary,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
