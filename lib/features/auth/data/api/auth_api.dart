import 'package:test_mpp/core/libs.dart';

class AuthApi {
  /// Fetches a new refresh token, and securely stores it locally
  static Future<void> refreshToken({bool doStore = true}) async {
    try {
      /// Retrieves previous stored token
      const FlutterSecureStorage secureStorage = FlutterSecureStorage();
      final authToken =
          AuthToken.fromJson(await secureStorage.read(key: AUTH_TOKEN_KEY));

      /// Fetches a new refresh token
      var url = Uri.https(AuthConst.urlAuth, '/refresh');
      final response = await post(url,
              headers: {'content-type': 'application/json'},
              body: json.encode({'refreshToken': authToken.refreshToken}))
          .timeout(TIMEOUT);

      /// Stores the new refresh token
      if (doStore) {
        await AuthService.instance.setAndStoreVariables(response);
      }
    } catch (e) {
      return;
    }
  }

  /// Before an api call, checks the validity of the token, if not valid does a refresh before the api call
  static Future<void> refreshTokenIfNeededBeforeApiCall() async {
    final token = AuthService.instance.authToken;
    if (token.tokenExpirationDate.difference(DateTime.now()).inSeconds <= 30) {
      await refreshToken(doStore: true);
    }
  }

  static Future<bool> logout() async {
    try {
      // TODO : Needs a proper implementation on backend
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response?> login(
      BuildContext context, String email, String password) async {
    try {
      var url = Uri.https(AuthConst.urlAuth, '/signin');

      final response = await post(url,
          headers: {'content-type': 'application/json'},
          body: json.encode({
            'email': email,
            'password': password,
          })).timeout(TIMEOUT);
      if (response.statusCode == 200) {
        return response;
      } else {
        if (context.mounted) {
          AppSnacks.defaultError(
              context, json.decode(response.body)['message']);
        }
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
