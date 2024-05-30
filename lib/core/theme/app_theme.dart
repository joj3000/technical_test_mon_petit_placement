import 'package:test_mpp/core/libs.dart';

class AppTheme {
  static final light = ThemeData(
    useMaterial3: false,
    fontFamily: 'Inter',
    colorScheme: AppColorTheme.light,
    textTheme: AppTextTheme.light,
    inputDecorationTheme: AppInputDecorationTheme.light,
    dividerColor: const Color(0xffF4F2F2),
    disabledColor: const Color(0xffF4F2F2),
    elevatedButtonTheme: AppElevatedButtonTheme.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    switchTheme: AppSwitchTheme.light,
  );
}
