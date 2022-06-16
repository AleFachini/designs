import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  PinterestMenu({
    Key? key,
    this.visible = true,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    required this.items,
  }) : super(key: key);

  final bool visible;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final List<PinterestButton> items;
  //  = [
  //   PinterestButton(
  //       icon: Icons.pie_chart,
  //       onPressed: () {
  //         print('Icon pie_chart');
  //       }),
  //   PinterestButton(
  //       icon: Icons.search,
  //       onPressed: () {
  //         print('Icon search');
  //       }),
  //   PinterestButton(
  //       icon: Icons.notifications,
  //       onPressed: () {
  //         print('Icon notifications');
  //       }),
  //   PinterestButton(
  //       icon: Icons.supervised_user_circle,
  //       onPressed: () {
  //         print('Icon supervised_user_circle');
  //       }),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: visible ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            if (backgroundColor != null) {
              Provider.of<_MenuModel>(context).backgroundColor =
                  backgroundColor!;
            }
            if (activeColor != null) {
              Provider.of<_MenuModel>(context).activeColor = activeColor!;
            }
            if (inactiveColor != null) {
              Provider.of<_MenuModel>(context).inactiveColor = inactiveColor!;
            }

            return _PinterestMenuBackground(
              child: _MenuItems(
                menuItems: items,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  _PinterestMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModel>(context);
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: menuModelProvider.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: -4,
          ),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  _MenuItems({
    Key? key,
    this.menuItems,
  }) : super(key: key);

  final List<PinterestButton>? menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          menuItems!.length,
          (index) => _PinterestMenuButton(index, menuItems![index]),
        ));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  _PinterestMenuButton(
    this.index,
    this.item,
  );

  final int? index;
  final PinterestButton? item;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (() {
        Provider.of<_MenuModel>(context, listen: false).setSelectedIndex =
            index!;
        item!.onPressed();
      }),
      child: Container(
        child: Icon(
          item!.icon,
          size: provider.getSelectedIndex == index ? 35 : 25,
          color: provider.getSelectedIndex == index
              ? provider.activeColor
              : provider.inactiveColor,
        ),
      ),
    );
  }
}

class PinterestButton {
  PinterestButton({
    required this.onPressed,
    required this.icon,
  });

  final Function() onPressed;
  final IconData icon;
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color value) {
    this._inactiveColor = value;
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color value) {
    this._activeColor = value;
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color value) {
    this._backgroundColor = value;
  }

  int get getSelectedIndex => this._selectedIndex;

  set setSelectedIndex(int selectedIndex) {
    this._selectedIndex = selectedIndex;
    notifyListeners();
  }
}
