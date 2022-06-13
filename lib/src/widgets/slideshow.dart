import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsPosition;
  final double dotActiveSize;
  final double dotInactiveSize;
  final Color colorActive;
  final Color colorInactive;

  Slideshow({
    Key? key,
    required this.slides,
    this.dotsPosition = false,
    this.colorActive = Colors.blue,
    this.colorInactive = Colors.grey,
    this.dotActiveSize = 12,
    this.dotInactiveSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            //El wisget Builder nos permite crear los Dots posterior a setear el provider
            //de esta manera podemos trabajar con setter y getter de provider en el mismo widget tree level
            Provider.of<_SlideshowModel>(context)._colorPrimary =
                this.colorActive;
            Provider.of<_SlideshowModel>(context)._colorSecondary =
                this.colorInactive;
            Provider.of<_SlideshowModel>(context)._dotActiveSize =
                this.dotActiveSize;
            Provider.of<_SlideshowModel>(context)._dotInactiveSize =
                this.dotInactiveSize;

            return Column(
              children: [
                dotsPosition
                    ? _Dots(
                        quantity: slides.length,
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
                      )
                    : SizedBox.shrink()
              ],
            );
          },
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int quantity;

  _Dots({
    required this.quantity,
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
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double dotSize;
    Color dotColor;

    if ((slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5)) {
      dotSize = slideshowModel.dotActiveSize;
      dotColor = slideshowModel.colorPrimary;
    } else {
      dotSize = slideshowModel.dotInactiveSize;
      dotColor = slideshowModel.colorSecondary;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: dotSize,
      height: dotSize,
      margin: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: dotColor,
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;

  Color _colorPrimary = Colors.blue;

  Color _colorSecondary = Colors.grey;

  double _dotActiveSize = 12;

  double _dotInactiveSize = 12;

  double get dotInactiveSize => this._dotInactiveSize;

  set dotInactiveSize(double value) {
    this._dotInactiveSize = value;
    notifyListeners();
  }

  double get dotActiveSize => this._dotActiveSize;

  set dotActiveSize(double value) {
    this._dotActiveSize = value;
    notifyListeners();
  }

  Color get colorPrimary => this._colorPrimary;

  set colorPrimary(Color value) {
    this._colorPrimary = value;
    notifyListeners();
  }

  Color get colorSecondary => this._colorSecondary;

  set colorSecondary(Color value) {
    this._colorSecondary = value;
    notifyListeners();
  }

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
