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
}
