part of 'main.page.dart';

enum _MainMenu { match, search, create, universe, message }

extension _MainMenuString on _MainMenu {
  String get title => switch (this) {
    _MainMenu.match => 'Match',
    _MainMenu.search => 'Search',
    _MainMenu.create => 'Create',
    _MainMenu.universe => 'Universes',
    _MainMenu.message => 'Messages',
  };
}

extension _MainMenuIcon on _MainMenu {
  String get icon => switch (this) {
    _MainMenu.match => 'assets/svg/match.svg',
    _MainMenu.search => 'assets/svg/search.svg',
    _MainMenu.create => 'assets/svg/create.svg',
    _MainMenu.universe => 'assets/svg/universe.svg',
    _MainMenu.message => 'assets/svg/message.svg',
  };
}

extension _MainMenuPage on _MainMenu {
  Widget get page => switch (this) {
    _MainMenu.match => const Center(child: BooUIDev()),
    _MainMenu.search => const SearchPage(),
    _MainMenu.create => const SizedBox.shrink(),
    _MainMenu.universe => const UniversePage(),
    _MainMenu.message => const MessagePage(),
  };
}

extension _MainMenuAction on _MainMenu {
  List<Widget> get leading => switch (this) {
    _MainMenu.match => const <Widget>[],
    _MainMenu.search => SearchPage.leading,
    _MainMenu.create => const <Widget>[],
    _MainMenu.universe => UniversePage.leading,
    _MainMenu.message => MessagePage.leading,
  };

  List<Widget> get trailing => switch (this) {
    _MainMenu.match => const <Widget>[],
    _MainMenu.search => SearchPage.trailing,
    _MainMenu.create => const <Widget>[],
    _MainMenu.universe => UniversePage.trailing,
    _MainMenu.message => MessagePage.trailing,
  };
}
