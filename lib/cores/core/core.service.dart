import 'package:boo/cores/core/logger.dart' show BooLogger;
import 'package:boo/cores/core/service.dart' show BooService;
import 'package:get/get.dart' show Get, Inst;
import 'package:meta/meta.dart' show protected;

@protected
class BooCore extends BooService {
  static BooCore get i => Get.find<BooCore>();

  static Future<void> initialize() async {
    try {
      if (Get.isRegistered<BooCore>()) {
        return;
      }
      BooLogger.initialize();
      Get.put<BooCore>(BooCore());
    } catch (e) {
      rethrow;
    }
  }
}
