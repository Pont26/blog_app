import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'color.dart';
part 'text.dart';

class AppTheme {
  ThemeData appLightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightScheme,
    primaryColor: lightScheme.primary,
    brightness: lightScheme.brightness,
    fontFamily: fontFamily,
    textTheme: lightTextTheme,
    scaffoldBackgroundColor: lightScheme.surface,
    cardColor: lightScheme.surfaceDim,
    appBarTheme: AppBarTheme(
      color: lightScheme.surface,
      surfaceTintColor: lightScheme.surface,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: lightScheme.surface,
        statusBarColor: lightScheme.surface,
        statusBarIconBrightness: Brightness.dark,
      ),
      shadowColor: lightScheme.shadow,
      elevation: 4,
      scrolledUnderElevation: 4,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: lightScheme.surfaceDim,
      surfaceTintColor: lightScheme.surfaceDim,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: lightScheme.onPrimary,
        backgroundColor: lightScheme.primary,
        disabledForegroundColor: lightScheme.onTertiaryContainer,
        disabledBackgroundColor: lightScheme.tertiaryContainer,
        iconColor: lightScheme.onPrimary,
        disabledIconColor: lightScheme.onTertiaryContainer,
        textStyle: lightTextTheme.headlineSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () => Navigator.pop(context),
      ),
    ),
  );

  ThemeData appDarkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkScheme,
    primaryColor: darkScheme.primary,
    brightness: darkScheme.brightness,
    fontFamily: fontFamily,
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: darkScheme.surface,
    appBarTheme: AppBarTheme(
      color: darkScheme.surface,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: darkScheme.surfaceContainer,
        statusBarColor: darkScheme.surface,
        statusBarIconBrightness: Brightness.light,
      ),
      shadowColor: darkScheme.shadow,
      elevation: 4,
      scrolledUnderElevation: 4,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: darkScheme.surfaceContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: darkScheme.onPrimary,
        backgroundColor: darkScheme.primary,
        disabledForegroundColor: darkScheme.onTertiaryContainer,
        disabledBackgroundColor: darkScheme.tertiaryContainer,
        iconColor: darkScheme.onPrimary,
        disabledIconColor: darkScheme.onTertiaryContainer,
        textStyle: darkTextTheme.headlineSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () => Navigator.pop(context),
      ),
    ),
  );
}
