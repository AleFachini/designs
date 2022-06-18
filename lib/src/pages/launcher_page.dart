import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(color: Colors.blue),
      itemCount: 20,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.blue,
        ),
        title: Text('ListTile $i'),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Colors.blue,
        ),
        onTap: () {},
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  _MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 200,
                width: double.infinity,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
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
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.blue,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
