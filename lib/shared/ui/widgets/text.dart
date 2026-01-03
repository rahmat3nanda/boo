import 'package:boo/shared/ui/colors/color.dart' show BooColor, BooColorBase;
import 'package:boo/shared/ui/themes/theme.dart' show BooTheme;
import 'package:flutter/material.dart'
    show
        FontWeight,
        StatelessWidget,
        Text,
        TextAlign,
        TextOverflow,
        TextStyle,
        Widget;
import 'package:get/get.dart' show GetBuilder;

class BooUIText extends StatelessWidget {
  const BooUIText(
    this.text, {
    this.textAlign,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.maxLines,
    super.key,
  });

  final String text;
  final TextAlign? textAlign;
  final BooColorBase? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(_) => GetBuilder<BooTheme>(
    builder: (_) => Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color?.value ?? BooColor.get.text.value,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    ),
  );
}
