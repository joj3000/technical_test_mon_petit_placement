import 'package:test_mpp/core/libs.dart';

class AppElevatedButtonTheme {
  static final light = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xff4CBF17)),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
