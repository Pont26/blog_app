part of 'theme.dart';

ColorScheme darkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromRGBO(248, 248, 248, 1),
  onPrimary: Color(0xFF000000),
  primaryContainer: Color.fromARGB(255, 255, 255, 255),
  onPrimaryContainer: Color(0xFFFFFFFF),
  primaryFixed: Color(0xFFFFFAE6),
  primaryFixedDim: Color(0xFFFFFFFF),
  onPrimaryFixed: Color(0xFF000000),
  onPrimaryFixedVariant: Color(0xFFFFF3BF),

  ///SECONDARY
  secondary: Color(0xFFF24646),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFB31919),
  onSecondaryContainer: Color(0xFFFFFFFF),
  secondaryFixed: Color(0xFFF24646),
  secondaryFixedDim: Color(0xFFB31919),
  onSecondaryFixed: Color(0xFFFFFFFF),
  onSecondaryFixedVariant: Color(0xFF000000),

  /// TERTIARY
  tertiary: Color(0xFF000000),
  onTertiary: Color.fromARGB(255, 0, 0, 0),
  tertiaryContainer: Color.fromARGB(255, 0, 0, 0),
  onTertiaryContainer: Color(0xFFE2E2E2),
  tertiaryFixed: Color(0xFF000000),
  tertiaryFixedDim: Color(0xFF000000),
  onTertiaryFixed: Color(0xFFFFFFFF),
  onTertiaryFixedVariant: Color(0xFFC0C0C0),

  /// ERROR
  error: Color(0xFFD32F2F),
  onError: Color(0xFFF2F2F2),
  errorContainer: Color(0xFFB31919),
  onErrorContainer: Color(0xFFF2F2F2),

  /// SURFACE
  surface: Color(0xFF000000),
  onSurface: Color(0xFFF0F0F0),
  surfaceDim: Color(0xFF000000),
  surfaceBright: Color.fromARGB(255, 0, 0, 0),
  surfaceContainerLowest: Color(0xFF000000),
  surfaceContainerLow: Color(0xFF000000),
  surfaceContainer: Color(0xFF000000),
  surfaceContainerHigh: Color(0xFF000000),
  surfaceContainerHighest: Color(0xFF000000),

  /// SURFACE VARIANT
  onSurfaceVariant: Color.fromARGB(255, 8, 8, 8),
  outline: Color.fromARGB(255, 0, 0, 0),
  outlineVariant: Color(0xFF000000),

  /// SHADOW
  shadow: Color(0x66000000),
  scrim: Color(0xFF000000),

  /// INVERSE SURFACE
  inverseSurface: Color(0xFFFFFFFF),
  onInverseSurface: Color(0xFF1F1D21),
  inversePrimary: Color(0xFFFFD200),

  surfaceTint: Color(0xFF000000),
);

ColorScheme lightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 255, 255, 255),
  onPrimary: Color(0xFF1F1D21),
  primaryContainer: Color.fromARGB(255, 255, 255, 255),
  onPrimaryContainer: Color(0xFFFFFFFF),
  primaryFixed: Color(0xFFFFFAE6),
  primaryFixedDim: Color(0xFFFFFFFF),
  onPrimaryFixed: Color(0xFF1F1D21),
  onPrimaryFixedVariant: Color(0xFFFFF3BF),

  ///SECONDARY
  secondary: Color(0xFFF24646),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFB31919),
  onSecondaryContainer: Color(0xFFFFFFFF),
  secondaryFixed: Color(0xFFF24646),
  secondaryFixedDim: Color(0xFFB31919),
  onSecondaryFixed: Color(0xFFFFFFFF),
  onSecondaryFixedVariant: Color(0xFF000000),

  /// TERTIARY
  tertiary: Color(0xFFE2E2E2),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFF000000),
  onTertiaryContainer: Color(0xFFFFFFFF),
  tertiaryFixed: Color(0xFF000000),
  tertiaryFixedDim: Color(0xFF000000),
  onTertiaryFixed: Color(0xFFFFFFFF),
  onTertiaryFixedVariant: Color(0xFFC0C0C0),

  /// ERROR
  error: Color(0xFFD32F2F),
  onError: Color(0xFFF2F2F2),
  errorContainer: Color(0xFFB31919),
  onErrorContainer: Color(0xFFF2F2F2),

  /// SURFACE
  surface: Color(0xFFF5F5F5),
  onSurface: Color(0xFF000000),
  surfaceDim: Color(0xFFFFFFFF),
  surfaceBright: Color(0xFFF0F0F0),
  surfaceContainerLowest: Color.fromARGB(255, 7, 6, 6),
  surfaceContainerLow: Color.fromARGB(255, 0, 0, 0),
  surfaceContainer: Color.fromARGB(255, 14, 13, 13),
  surfaceContainerHigh: Color.fromARGB(255, 20, 20, 20),
  surfaceContainerHighest: Color.fromARGB(255, 10, 9, 9),

  /// SURFACE VARIANT
  onSurfaceVariant: Color(0xFFC0C0C0),
  outline: Color(0xFFC0C0C0),
  outlineVariant: Color(0xFFE2E2E2),

  /// SHADOW
  shadow: Color(0x19000000),
  scrim: Color(0xFF000000),

  /// INVERSE SURFACE
  inverseSurface: Color(0xFFFFFFFF),
  onInverseSurface: Color(0xFF000000),
  inversePrimary: Color.fromARGB(255, 243, 243, 241),

  surfaceTint: Color.fromRGBO(7, 4, 4, 0),
);
