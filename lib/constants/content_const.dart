class ContentConsts {
  const ContentConsts._();

  static const home = _Home();
  static const builds = _Builds();
  static const about = _About();
}

class _Home {
  const _Home();
}

class _Builds {
  const _Builds();
}

class _About {
  const _About();
  final String bio = '''
I'm a software developer primarily building mobile apps with flutter. and seriously, i love doing this...♥

Right now, I'm working as a Flutter Developer while also preparing for a masters and hoping to get into a good college.
i'm into C programming as well, and been doing some flutter and C interoperability lately, fun stuff.

By the way, have you read "Code : The Hidden Language of Computer Hardware and Software" by Charles Petzold?, it's a great read--i'm on Chapter 11 now.
''';

  final List<String> skillsAndTechs = const [
    'Dart',
    'Flutter',
    'C/C++',
    'Bash',
    'SQL',
    'HTML',
    'CSS',
    'Flutter',
    'Git',
    'MySQL',
    'PostgreSQL',
    'SQLite',
  ];
}
