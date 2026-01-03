import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/shared/ui/widgets/widgets.dart' show BooScaffold;
import 'package:flutter/material.dart' show StatelessWidget, Widget;
import 'package:get/get.dart' show GetPage;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static GetPage<dynamic> get page =>
      GetPage<dynamic>(name: AppRoute.main.go, page: MainPage.new);

  @override
  Widget build(_) => const BooScaffold();
}
