import 'package:designs/src/models/slider_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsPosition;
  final Color colorActive;
  final Color colorInactive;

  Slideshow({
    Key? key,
    required this.slides,
    this.dotsPosition = false,
    this.colorActive = Colors.blue,
    this.colorInactive = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              dotsPosition
                  ? _Dots(
                      quantity: slides.length,
                      colorActive: colorActive,
                      colorInactive: colorInactive,
                    )
                  : SizedBox.shrink(),
              Expanded(
                child: _Slides(
                  slides: slides,
                ),
              ),
              !dotsPosition
                  ? _Dots(
                      quantity: slides.length,
                      colorActive: colorActive,
                      colorInactive: colorInactive,
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int quantity;
  final Color colorActive;
  final Color colorInactive;
  _Dots({
    required this.quantity,
    required this.colorActive,
    required this.colorInactive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            quantity,
            (index) => _Dot(
                  index: index,
                  colorActive: colorActive,
                  colorInactive: colorInactive,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorActive;
  final Color colorInactive;

  _Dot({
    Key? key,
    required this.index,
    required this.colorActive,
    required this.colorInactive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? colorActive
            : colorInactive,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides({
    Key? key,
    required this.slides,
  }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      //print('Pagina actual: ${pageViewController.page}');
      //Actualizar el provider, sliderModel:
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide({
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
