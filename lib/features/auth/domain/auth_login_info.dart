import 'package:test_mpp/core/libs.dart';

class LoginInfo extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  void setIsLoggedIn(bool val, {bool notify = true}) {
    _isLoggedIn = val;
    if (notify) {
      notifyListeners();
    }
  }
}
