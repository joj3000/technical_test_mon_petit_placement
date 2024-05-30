import 'package:test_mpp/core/libs.dart';

extension ThemeGetter on BuildContext {
  // Helps write `context.theme` instead of the boilerplate Theme.of(context)
  ThemeData get theme => Theme.of(this);
}
