import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: -10,
            child: _FloatinCustomButtonTheme(),
          ),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  _MainScroll({Key? key}) : super(key: key);

  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Title(),
            ),
          ),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(
              height: 100,
            )
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => minHeight > maxHeight ? minHeight : maxHeight;

  @override
  double get minExtent => minHeight < maxHeight ? minHeight : maxHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              color: Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xfff7cdd5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _FloatinCustomButtonTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      //Como cambio raised por Elevated entonces ButtonTheme por SizedBox
      width: size.width * 0.9,
      height: 100,
      child: ElevatedButton(
        //Cambio el Raised Button por este ElevatedButton
        style: ElevatedButton.styleFrom(
          primary: Color(0xffed6762),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          ),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem(this.title, this.color); //argumentos posicionales

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
