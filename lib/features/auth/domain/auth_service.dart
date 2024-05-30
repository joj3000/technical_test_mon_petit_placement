// ignore_for_file: use_build_context_synchronously

import 'package:test_mpp/core/libs.dart';

/// In charge of the entire connection flow
class AuthService extends ChangeNotifier {
  static final AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }

  AuthService._internal();

  AuthToken authToken = AuthToken.none();
  final LoginInfo _loginInfo = LoginInfo();
  LoginInfo get loginInfo => _loginInfo;

  final secureStorage = const FlutterSecureStorage();

  /// Init the AuthService for the entire app, and auto login if needed
  Future<void> init({bool autoLogin = true}) async {
    try {
      final securedRefreshToken = await secureStorage.read(key: AUTH_TOKEN_KEY);

      if (autoLogin && securedRefreshToken != null) {
        await AuthApi.refreshToken();
      }
    } catch (e) {
      return;
    }
  }

  /// Logs the user in
  Future<void> login(BuildContext context, WidgetRef ref) async {
    try {
      /// Toggle CircularProgressIndicator
      ref.read(connectionProvider.notifier).update((state) => true);

      final loginFields = ref.read(loginFieldsProvider);

      /// Fake long time response (to see appear the CircularProgressIndicator)
      await Future.delayed(const Duration(seconds: 2));
      final response =
          await AuthApi.login(context, loginFields.email, loginFields.password);
      await setAndStoreVariables(response);
      await secureStorage.write(
          key: EMAIL_PASSWORD,
          value: json.encode(
              {'email': loginFields.email, 'password': loginFields.password}));
      ref.read(connectionProvider.notifier).update((state) => false);
    } catch (e) {
      ref.read(connectionProvider.notifier).update((state) => false);

      if (context.mounted) {
        AppSnacks.defaultError(context);
      }
    }
  }

  /// Login through biometrics
  Future<void> loginWithBiometrics(BuildContext context) async {
    try {
      /// Fake long time response (to see appear the CircularProgressIndicator)
      await Future.delayed(const Duration(seconds: 2));
      final emailPasswordJson = await secureStorage.read(key: EMAIL_PASSWORD);
      if (emailPasswordJson != null) {
        final emailPasswordMap = json.decode(emailPasswordJson);

        final response = await AuthApi.login(
            context, emailPasswordMap['email'], emailPasswordMap['password']);
        setAndStoreVariables(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Logs the user out
  Future<void> logout(BuildContext context) async {
    try {
      final resp = await AuthApi.logout();
      if (resp) {
        authToken = AuthToken.none();

        /// Do things right after loging out (reset providers, ...)
        await secureStorage.delete(key: AUTH_TOKEN_KEY);
        await secureStorage.delete(key: EMAIL_PASSWORD);

        /// Login out resets to false the option "connects with biometry"
        await UserPreferences.setBiometry(false);

        /// Loging out
        _loginInfo.isLoggedIn = false;
      }
    } catch (e) {
      if (context.mounted) {
        AppSnacks.defaultError(context);
      }
    }
  }

  /// Stores the auth token
  Future<void> setAndStoreVariables(Response? response,
      {bool notify = true}) async {
    final token = AuthToken.fromResponse(response);

    if (token.accessToken != null) {
      await secureStorage.write(key: AUTH_TOKEN_KEY, value: token.toJson());
      authToken = token;
      _loginInfo.setIsLoggedIn(true, notify: notify);
    }
  }
}
