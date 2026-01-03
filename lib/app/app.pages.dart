import 'package:boo/app/dev.page.dart' show DevPage;
import 'package:boo/app/main/main.page.dart' show MainPage;
import 'package:get/get.dart' show GetPage;

class AppPages {
  static List<GetPage<dynamic>> list = <GetPage<dynamic>>[
    MainPage.page,
    DevPage.page,
  ];
}
