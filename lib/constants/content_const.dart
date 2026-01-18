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

  final String pennyBoxDesc = '''
A personal finance management tool designed to track and categorize daily financial activity. 
The application enables users to log income and expenses, assign transactions to specific categories, and monitor their net balance. 
It provides a clear breakdown of cash flow through a structured history and data visualization
''';

  final String fairFlightsDesc = '''
A flight reservation system that allows users to search, compare, and pre-book air travel. 
The app enables users to select departure and arrival locations, specify travel dates, and browse available flights. 
It streamlines the booking process by managing passenger details and seat preferences, 
providing a centralized platform to secure tickets before travel.
''';
}

class _About {
  const _About();
  final String bio = '''
I'm a software developer primarily building mobile apps with flutter. and seriously, i love doing this...♥

Right now, I'm working as a Flutter Developer while also preparing for my masters and hoping to get into a good college.
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
