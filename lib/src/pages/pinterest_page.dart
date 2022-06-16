import 'package:designs/src/widgets/pinterest_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModelPage(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocator(),
          ],
        ), //PinterestMenu(), // PinterestGrid(),
      ),
    );
  }
}

class _PinterestMenuLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModelPage>(context);

    return Positioned(
        bottom: 30,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Align(
              child: PinterestMenu(
            visible: menuModelProvider.visible,
            items: [
              PinterestButton(
                  icon: Icons.pie_chart,
                  onPressed: () {
                    print('Icon pie_chart');
                  }),
              PinterestButton(
                  icon: Icons.search,
                  onPressed: () {
                    print('Icon search');
                  }),
              PinterestButton(
                  icon: Icons.notifications,
                  onPressed: () {
                    print('Icon notifications');
                  }),
              PinterestButton(
                  icon: Icons.supervised_user_circle,
                  onPressed: () {
                    print('Icon supervised_user_circle');
                  }),
            ],
          )),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController controller = ScrollController();
  double scrollPositionRef = 0.0; //controller.offset es la posicion actual

  @override
  void initState() {
    controller.addListener(() {
      //print('ScrollListener ${controller.offset}');
      if (controller.offset >= scrollPositionRef && controller.offset > 0.0) {
        //ocultar menu
        Provider.of<_MenuModelPage>(context, listen: false).visible = false;
      } else {
        //mostrar menu
        Provider.of<_MenuModelPage>(context, listen: false).visible = true;
      }
      scrollPositionRef = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MasonryGridView.count(
        controller: controller,
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _PinterestItem(index: index);
        },
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      height: index.isEven ? 200 : 100,
      child: Center(
          child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text('$index'),
      )),
    );
  }
}

class _MenuModelPage with ChangeNotifier {
  bool _visible = true;
  bool get visible => this._visible;

  set visible(bool value) {
    this._visible = value;
    notifyListeners();
  }
}
