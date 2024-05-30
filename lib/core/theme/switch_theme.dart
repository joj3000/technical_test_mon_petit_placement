import 'package:test_mpp/core/libs.dart';

class AppSwitchTheme {
  static final light = SwitchThemeData(
    trackColor: MaterialStateProperty.all(const Color(0xffF4F2F2)),
    thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (!states.contains(MaterialState.selected)) {
        return const Color(0xffd9d9d9);
      } else {
        return const Color(0xff4CBF17);
      }
    }),
  );
}
