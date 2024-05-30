import 'package:test_mpp/core/libs.dart';

/// It's better to use Theme Extensions, to control the name of the themes, as well as their quantity
class AppTextTheme {
  static const light = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
}
