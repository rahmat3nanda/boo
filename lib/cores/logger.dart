import 'package:get/get.dart' show Get, GetxService, Inst;
import 'package:logger/logger.dart'
    show AnsiColor, Level, Logger, PrettyPrinter;

class BooLogger extends GetxService {
  final List<String> _logs = <String>[];

  List<String> get logs => _logs;

  final Logger _uiLogger = create(
    color: const AnsiColor.fg(110),
    noBoxingByDefault: true,
  );
  final Logger _uiTraceLogger = create(
    color: const AnsiColor.fg(110),
    methodCount: 8,
  );
  final Logger _serviceLogger = create(
    color: const AnsiColor.fg(250),
    noBoxingByDefault: true,
  );
  final Logger _log = create();
  final Logger _forMiddleware = BooLogger.create(
    color: const AnsiColor.fg(255),
    noBoxingByDefault: true,
  );
  final Logger _forToast = create(
    color: const AnsiColor.fg(5),
    methodCount: 6,
    noBoxingByDefault: true,
  );

  final PrettyPrinter pp = PrettyPrinter();

  static void initialize() => Get.put<BooLogger>(BooLogger());

  static BooLogger get i => Get.find<BooLogger>();

  static Logger create({
    AnsiColor? color,
    int methodCount = 0,
    bool noBoxingByDefault = false,
  }) => Logger(
    printer: PrettyPrinter(
      levelColors: color != null
          ? <Level, AnsiColor>{
              Level.debug: color,
              Level.info: color,
              Level.warning: color,
              Level.error: color,
            }
          : null,
      methodCount: methodCount,
      noBoxingByDefault: noBoxingByDefault,
      printEmojis: false,
    ),
  );

  String jsonify(dynamic message) =>
      message == null ? 'null' : pp.stringifyMessage(message);

  void add(String log) => _logs.add('[${DateTime.now()}] $log');

  void info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    add(
      '[INFO] $message${error == null ? '' : '\n$error'}${stackTrace == null ? '' : '\n$stackTrace'}',
    );
    _log.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  void warning(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    add(
      '[WARNING] $message${error == null ? '' : '\n$error'}${stackTrace == null ? '' : '\n$stackTrace'}',
    );
    _log.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  void debug(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    add(
      '[DEBUG] $message${error == null ? '' : '\n$error'}${stackTrace == null ? '' : '\n$stackTrace'}',
    );
    _log.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  void verbose(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    add(
      '[VERBOSE] $message${error == null ? '' : '\n$error'}${stackTrace == null ? '' : '\n$stackTrace'}',
    );
    _log.t(message, time: time, error: error, stackTrace: stackTrace);
  }

  void fatal(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    add(
      '[FATAL] $message${error == null ? '' : '\n$error'}${stackTrace == null ? '' : '\n$stackTrace'}',
    );
    _log.f(message, time: time, error: error, stackTrace: stackTrace);
  }

  void forToast(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    add(
      '[TOAST] $message${error == null ? '' : '\n$error'}${stackTrace == null ? '' : '\n$stackTrace'}',
    );
    _forToast.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  void printForUi({
    Type? runtimeType,
    dynamic message,
    String? prefix,
    bool isWithTrace = false,
  }) {
    final Logger logger = isWithTrace ? _uiTraceLogger : _uiLogger;
    final String s =
        '||${runtimeType.toString().toUpperCase()}||:${prefix != null ? ' [$prefix]' : ''} ${pp.stringifyMessage(message)}';
    logger.i(s);
    add('[UI] $s');
  }

  void printForService({Type? runtimeType, dynamic message, String? prefix}) {
    final String s =
        '||${runtimeType.toString().toUpperCase()}||:${prefix != null ? ' [$prefix]' : ''} ${pp.stringifyMessage(message)}';
    _serviceLogger.i(s);
    add('[Service] $s');
  }

  void printForMiddleware({
    required int priority,
    Type? runtimeType,
    dynamic message,
    String? prefix,
  }) {
    final String s =
        '||${runtimeType.toString().toUpperCase()}||[priority: $priority]: ${pp.stringifyMessage(message)}';
    _forMiddleware.i(s);
    add('[Middleware] $s');
  }

  void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    add(
      '[ERROR] $message${error == null ? '' : '\n$error'}${stackTrace == null ? '' : '\n$stackTrace'}',
    );
    _log.e(message, time: time, error: error, stackTrace: stackTrace);
  }
}
