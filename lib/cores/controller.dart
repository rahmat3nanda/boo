import 'package:boo/cores/logger.dart' show BooLogger;
import 'package:get/get.dart' show GetxController;
import 'package:meta/meta.dart' show protected;

@protected
class BooUIController extends GetxController {
  void logger(dynamic message, {bool isWithTrace = false}) {
    BooLogger.i.printForUi(
      runtimeType: runtimeType,
      message: message,
      isWithTrace: isWithTrace,
    );
  }
}
