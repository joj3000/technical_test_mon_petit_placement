import 'package:test_mpp/core/libs.dart';

class AppShadows {
  static final main = [
    BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 1,
        spreadRadius: 1,
        offset: const Offset(0, 1))
  ];
}
