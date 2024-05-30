import 'package:test_mpp/core/libs.dart';

class AppInputDecorationTheme {
  static const light = InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xffCFCFCF),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF4F2F2), width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff4CBF17), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF4F2F2), width: 2),
    ),
  );
}
