import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/shared/ui/widgets/widgets.dart'
    show BooScaffold, BooUIAppBar, BooUIDev;
import 'package:flutter/material.dart' show Center, StatelessWidget, Widget;
import 'package:get/get.dart' show GetPage;

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  static GetPage<dynamic> get page =>
      GetPage<dynamic>(name: AppRoute.dev.go, page: DevPage.new);

  @override
  Widget build(_) => const BooScaffold(
    appBar: BooUIAppBar(),
    body: Center(child: BooUIDev()),
  );
}
