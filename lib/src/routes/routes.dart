import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:designs/src/labs/circular_progress_page.dart';
import 'package:designs/src/pages/emergency_page.dart';
import 'package:designs/src/pages/headers_page.dart';
import 'package:designs/src/pages/pinterest_page.dart';
import 'package:designs/src/pages/slideshow_page.dart';
import 'package:designs/src/pages/sliver_list_page.dart';
import 'package:designs/src/pages/animaciones_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro Animado', AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress Circular ',
      CircularProgressPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
