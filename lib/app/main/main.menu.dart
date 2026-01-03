import 'package:boo/shared/ui/widgets/widgets.dart' show BooUIDev;
import 'package:flutter/material.dart' show Center, Widget;

enum MainMenu { match, search, create, universe, message }

extension MainMenuString on MainMenu {
  String get title => switch (this) {
    MainMenu.match => 'Match',
    MainMenu.search => 'Search',
    MainMenu.create => 'Create',
    MainMenu.universe => 'Universes',
    MainMenu.message => 'Messages',
  };
}

extension MainMenuIcon on MainMenu {
  String get icon => switch (this) {
    MainMenu.match => 'assets/svg/match.svg',
    MainMenu.search => 'assets/svg/search.svg',
    MainMenu.create => 'assets/svg/create.svg',
    MainMenu.universe => 'assets/svg/universe.svg',
    MainMenu.message => 'assets/svg/message.svg',
  };
}

extension MainMenuPage on MainMenu {
  Widget get page => switch (this) {
    MainMenu.match => const Center(child: BooUIDev()),
    MainMenu.search => const Center(child: BooUIDev()),
    MainMenu.create => const Center(child: BooUIDev()),
    MainMenu.universe => const Center(child: BooUIDev()),
    MainMenu.message => const Center(child: BooUIDev()),
  };
}
