import 'package:boo/cores/core/core.dart' show BooLogger;
import 'package:get/get.dart' show GetxService;
import 'package:meta/meta.dart' show protected;

@protected
class BooService extends GetxService {
  void logger(dynamic message) {
    BooLogger.i.printForUi(runtimeType: runtimeType, message: message);
  }
}
