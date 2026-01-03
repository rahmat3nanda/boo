import 'package:boo/shared/ui/widgets/widgets.dart' show BooUIDev;
import 'package:flutter/material.dart' show Center, StatelessWidget, Widget;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static List<Widget> get leading => const <Widget>[];

  static List<Widget> get trailing => const <Widget>[];

  @override
  Widget build(_) => const Center(child: BooUIDev());
}
