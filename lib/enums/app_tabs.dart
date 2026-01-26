import 'package:flutter/material.dart';

enum AppTab {
  home,
  builds,
  about
  ;

  String get label => switch (this) {
    home => 'Home',
    builds => 'Builds',
    about => 'About',
  };

  IconData get icon => switch (this) {
    home => Icons.home_outlined,
    builds => Icons.construction,
    about => Icons.person_3_outlined,
  };
}
