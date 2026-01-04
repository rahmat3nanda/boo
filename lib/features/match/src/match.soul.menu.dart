part of 'match.soul.page.dart';

enum _MatchSoulMenu {
  profile,
  post,
  comment;

  String get title => switch (this) {
    profile => 'Profile',
    post => 'Posts',
    comment => 'Comments',
  };
}
