import 'package:boo/shared/ui/themes/theme.dart' show BooTheme;
import 'package:flutter/material.dart'
    show
        ActionIconThemeData,
        AppBarTheme,
        ColorScheme,
        Icon,
        Icons,
        TabBarThemeData,
        ThemeData;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

ThemeData _themeData(BooTheme theme) => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: theme.color.turquoise1.value),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (_) =>
        Icon(Icons.arrow_back_ios, color: theme.color.text.value, size: 22),
  ),
  scaffoldBackgroundColor: theme.color.scaffold.value,
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.inter(),
    backgroundColor: theme.color.scaffold.value,
    surfaceTintColor: theme.color.scaffold.value,
  ),
  tabBarTheme: TabBarThemeData(
    labelStyle: GoogleFonts.inter(),
    unselectedLabelStyle: GoogleFonts.inter(),
  ),
  textTheme: GoogleFonts.interTextTheme(),
);

ThemeData booThemeData(BooTheme theme) => _themeData(
  theme,
).copyWith(textTheme: GoogleFonts.interTextTheme(_themeData(theme).textTheme));
