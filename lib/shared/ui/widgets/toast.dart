import 'package:boo/shared/ui/colors/color.dart' show BooColor, BooColorBase;
import 'package:boo/shared/ui/widgets/widgets.dart' show BooUIText;
import 'package:flutter/material.dart'
    show
        AnimatedPositioned,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FontWeight,
        GestureDetector,
        Icon,
        Icons,
        MainAxisSize,
        Material,
        OverlayEntry,
        OverlayState,
        Row,
        StatelessWidget,
        TextOverflow,
        Widget;
import 'package:get/get.dart' show Get, GetNavigation, ObxValue, RxBool;

enum BooToastGravity { top, bottom }

class BooToast {
  static OverlayEntry? _entry;

  static void _show({
    String? title,
    String? message,
    Widget? icon,
    Duration duration = const Duration(seconds: 4),
    BooToastGravity gravity = BooToastGravity.top,
  }) {
    final OverlayState? state = Get.key.currentState?.overlay;
    if (state == null) return;
    final _ToastWidget widget = _ToastWidget(
      title: title == null
          ? null
          : BooUIText(
              title,
              color: BooColor.get.text,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      message: message == null
          ? null
          : BooUIText(
              message,
              color: BooColor.get.text,
              fontSize: 14,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
      prefix: icon,
      suffix: GestureDetector(
        onTap: () {
          if (_entry != null) {
            _entry?.remove();
            _entry = null;
          }
        },
        child: Icon(Icons.close, color: BooColor.get.text.value, size: 16),
      ),
      backgroundColor: BooColor.get.scaffold,
      gravity: gravity,
    );

    if (_entry != null) {
      try {
        _entry!.remove();
      } catch (_) {}
      _entry = null;
    }
    final OverlayEntry overlayEntry = OverlayEntry(builder: (_) => widget);
    _entry = overlayEntry;

    state.insert(overlayEntry);
    widget.show(true);

    Future<void>.delayed(duration, () {
      if (_entry == overlayEntry) {
        widget.show(false);
      }
    });
    Future<void>.delayed(duration + const Duration(milliseconds: 300), () {
      if (_entry == overlayEntry) {
        try {
          overlayEntry.remove();
        } catch (_) {}
        _entry = null;
      }
    });
  }

  static void success({
    String? title,
    String? message,
    Duration duration = const Duration(seconds: 4),
    BooToastGravity gravity = BooToastGravity.top,
  }) {
    _show(
      title: title,
      message: message,
      // icon: Icon(
      //   Icons.check_circle,
      //   size: 16,
      //   color: BooColor.get.turquoise1.value,
      // ),
      duration: duration,
      gravity: gravity,
    );
  }
}

class _ToastWidget extends StatelessWidget {
  _ToastWidget({
    this.title,
    this.message,
    this.prefix,
    this.suffix,
    this.backgroundColor,
    this.gravity = BooToastGravity.bottom,
  });

  final Widget? title;
  final Widget? message;
  final Widget? prefix;
  final Widget? suffix;
  final BooColorBase? backgroundColor;
  final BooToastGravity gravity;

  final RxBool _show = RxBool(false);

  void show(bool value) {
    _show.value = value;
  }

  @override
  Widget build(BuildContext context) => ObxValue<RxBool>(
    (RxBool show) => AnimatedPositioned(
      top: gravity == BooToastGravity.top ? (show.value ? 72 : -100) : null,
      bottom: gravity == BooToastGravity.bottom
          ? (show.value ? 72 : -(100 + Get.mediaQuery.viewInsets.bottom))
          : null,
      left: 16,
      right: 16,
      duration: const Duration(milliseconds: 300),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: backgroundColor?.value ?? BooColor.get.scaffold.value,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: BooColor.get.border.value),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: <Widget>[
              if (prefix != null) prefix!,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 2,
                  children: <Widget>[
                    if (title != null) title!,
                    if (message != null) message!,
                  ],
                ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ),
    ),
    _show,
  );
}
