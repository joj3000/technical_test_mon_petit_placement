import 'package:test_mpp/core/libs.dart';

final loginFieldsProvider =
    ChangeNotifierProvider((ref) => LoginFieldsNotifier());

class LoginFieldsNotifier extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void setFields({String? newEmail, String? newPassword, bool notify = true}) {
    if (newEmail != null) {
      _email = newEmail;
    }
    if (newPassword != null) {
      _password = newPassword;
    }
    doNotify(notify);
  }

  void doNotify(bool notify) {
    if (notify) {
      notifyListeners();
    }
  }
}
