part of '../match.page.dart';

enum _MatchMenu {
  souls,
  discovers;

  String get title => switch (this) {
    souls => 'New Souls',
    discovers => 'Discovery',
  };

  BooColorBase get color => switch (this) {
    souls => BooColor.get.turquoise1,
    discovers => BooColor.get.rosePink,
  };
}
