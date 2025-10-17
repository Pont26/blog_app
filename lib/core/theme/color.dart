part of 'theme.dart';

ColorScheme darkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromRGBO(248, 248, 248, 1),
  onPrimary: Color.fromRGBO(0, 0, 0, 0),
  primaryContainer: Color.fromARGB(255, 255, 255, 255),
  onPrimaryContainer: Color(0xFFFFFFFF),
  primaryFixed: Color(0xFFFFFAE6),
  primaryFixedDim: Color(0xFFFFFFFF),
  onPrimaryFixed: Color.fromRGBO(0, 0, 0, 0),
  onPrimaryFixedVariant: Color(0xFFFFF3BF),

  ///SECONDARY
  secondary: Color(0xFFF24646),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFB31919),
  onSecondaryContainer: Color(0xFFFFFFFF),
  secondaryFixed: Color(0xFFF24646),
  secondaryFixedDim: Color(0xFFB31919),
  onSecondaryFixed: Color(0xFFFFFFFF),
  onSecondaryFixedVariant: Color.fromRGBO(0, 0, 0, 0),

  /// TERTIARY
  tertiary: Color.fromRGBO(0, 0, 0, 0),
  onTertiary: Color(0xFF989898),
  tertiaryContainer: Color(0xFF989898),
  onTertiaryContainer: Color(0xFFE2E2E2),
  tertiaryFixed: Color.fromRGBO(0, 0, 0, 0),
  tertiaryFixedDim: Color.fromRGBO(0, 0, 0, 0),
  onTertiaryFixed: Color(0xFFFFFFFF),
  onTertiaryFixedVariant: Color(0xFFC0C0C0),

  /// ERROR
  error: Color(0xFFD32F2F),
  onError: Color(0xFFF2F2F2),
  errorContainer: Color(0xFFB31919),
  onErrorContainer: Color(0xFFF2F2F2),

  /// SURFACE
  surface: Color.fromRGBO(0, 0, 0, 0),
  onSurface: Color(0xFFF0F0F0),
  surfaceDim: Color.fromRGBO(0, 0, 0, 0),
  surfaceBright: Color(0xFF989898),
  surfaceContainerLowest: Color.fromRGBO(0, 0, 0, 0),
  surfaceContainerLow: Color.fromRGBO(0, 0, 0, 0),
  surfaceContainer: Color.fromRGBO(0, 0, 0, 0),
  surfaceContainerHigh: Color.fromRGBO(0, 0, 0, 0),
  surfaceContainerHighest: Color.fromRGBO(0, 0, 0, 0),

  /// SURFACE VARIANT
  onSurfaceVariant: Color(0xFFC0C0C0),
  outline: Color(0xFFC0C0C0),
  outlineVariant: Color.fromRGBO(0, 0, 0, 0),

  /// SHADOW
  shadow: Color(0x66000000),
  scrim: Color(0xFF000000),

  /// INVERSE SURFACE
  inverseSurface: Color(0xFFFFFFFF),
  onInverseSurface: Color(0xFF1F1D21),
  inversePrimary: Color(0xFFFFD200),

  surfaceTint: Color.fromRGBO(0, 0, 0, 0),
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
  onSecondaryFixedVariant: Color.fromRGBO(0, 0, 0, 0),

  /// TERTIARY
  tertiary: Color(0xFFE2E2E2),
  onTertiary: Color.fromRGBO(0, 0, 0, 0),
  tertiaryContainer: Color.fromRGBO(0, 0, 0, 0),
  onTertiaryContainer: Color(0xFFFFFFFF),
  tertiaryFixed: Color.fromRGBO(0, 0, 0, 0),
  tertiaryFixedDim: Color.fromRGBO(0, 0, 0, 0),
  onTertiaryFixed: Color(0xFFFFFFFF),
  onTertiaryFixedVariant: Color(0xFFC0C0C0),

  /// ERROR
  error: Color(0xFFD32F2F),
  onError: Color(0xFFF2F2F2),
  errorContainer: Color(0xFFB31919),
  onErrorContainer: Color(0xFFF2F2F2),

  /// SURFACE
  surface: Color(0xFFF5F5F5),
  onSurface: Color.fromRGBO(0, 0, 0, 0),
  surfaceDim: Color(0xFFFFFFFF),
  surfaceBright: Color(0xFFF0F0F0),
  surfaceContainerLowest: Color(0xFFCACACA),
  surfaceContainerLow: Color(0xFFD6D6D6),
  surfaceContainer: Color(0xFFE2E2E2),
  surfaceContainerHigh: Color(0xFFEBEBEB),
  surfaceContainerHighest: Color(0xFFF4F4F4),

  /// SURFACE VARIANT
  onSurfaceVariant: Color(0xFFC0C0C0),
  outline: Color(0xFFC0C0C0),
  outlineVariant: Color(0xFFE2E2E2),

  /// SHADOW
  shadow: Color(0x19000000),
  scrim: Color(0xFF000000),

  /// INVERSE SURFACE
  inverseSurface: Color(0xFFFFFFFF),
  onInverseSurface: Color.fromRGBO(0, 0, 0, 0),
  inversePrimary: Color.fromARGB(255, 243, 243, 241),

  surfaceTint: Color.fromRGBO(0, 0, 0, 0),
);
