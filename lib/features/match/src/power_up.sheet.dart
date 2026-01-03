import 'package:boo/shared/ui/colors/color.dart' show BooColor;
import 'package:boo/shared/ui/widgets/widgets.dart' show BooUIDev;
import 'package:flutter/material.dart'
    show
        Border,
        BorderRadius,
        BoxDecoration,
        Colors,
        Column,
        Container,
        EdgeInsets,
        MainAxisSize,
        SafeArea,
        StatelessWidget,
        Widget;
import 'package:get/get.dart' show ExtensionBottomSheet, Get;

class PowerUpSheet extends StatelessWidget {
  const PowerUpSheet({super.key});

  static Future<void> show() => Get.bottomSheet<void>(
    const PowerUpSheet(),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    persistent: false,
  );

  @override
  Widget build(_) => SafeArea(
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        color: BooColor.get.scaffold.value,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: BooColor.get.border.value),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: <Widget>[
          Container(
            width: 64,
            height: 8,
            decoration: BoxDecoration(
              color: BooColor.get.border.value,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const BooUIDev(),
        ],
      ),
    ),
  );
}
