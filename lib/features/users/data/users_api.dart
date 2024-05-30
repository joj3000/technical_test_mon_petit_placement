import 'package:test_mpp/core/libs.dart';

class UsersApi {
  /// Gets the list of User
  static Future<List<UserData>> getUserList() async {
    try {
      await AuthApi.refreshTokenIfNeededBeforeApiCall();
      final token = AuthService.instance.authToken;

      var url = Uri.https(AuthConst.urlAuth, '/users');

      final resp = await get(
        url,
        headers: {
          'content-type': 'application/json',
          'authorization': token.accessToken!,
        },
      ).timeout(TIMEOUT);

      if (resp.statusCode == 200) {
        final data = List<Map<String, dynamic>>.from(json.decode(resp.body));
        final t = data.map(UserData.fromMap).toList();

        return t;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  /// Creates a User
  static Future<bool> createUser(
      BuildContext context, UserData userData) async {
    try {
      await AuthApi.refreshTokenIfNeededBeforeApiCall();
      final token = AuthService.instance.authToken;

      var url = Uri.https(AuthConst.urlAuth, '/users');

      final resp = await post(
        url,
        headers: {
          'content-type': 'application/json',
          'authorization': token.accessToken!,
        },
        body: json.encode(userData.toMap()),
      ).timeout(TIMEOUT);

      if (resp.statusCode == 200) {
        return true;
      } else {
        if (context.mounted) {
          AppSnacks.defaultError(context, json.decode(resp.body)['message']);
        }

        return false;
      }
    } catch (e) {
      if (context.mounted) {
        AppSnacks.defaultError(context);
      }
      return false;
    }
  }

  /// Modifies a User
  static Future<bool> modifyUser(
      BuildContext context, UserData userData) async {
    try {
      await AuthApi.refreshTokenIfNeededBeforeApiCall();
      final token = AuthService.instance.authToken;

      var url = Uri.https(AuthConst.urlAuth, '/users/${userData.id}');

      final resp = await patch(
        url,
        headers: {
          'content-type': 'application/json',
          'authorization': token.accessToken!,
        },
        body: json.encode(userData.toMap()),
      ).timeout(TIMEOUT);

      if (resp.statusCode == 200) {
        return true;
      } else {
        if (context.mounted) {
          AppSnacks.defaultError(context, json.decode(resp.body)['message']);
        }
        return false;
      }
    } catch (e) {
      if (context.mounted) {
        AppSnacks.defaultError(context);
      }
      return false;
    }
  }

  /// Deletes a User
  static Future<bool> deleteUser(
      BuildContext context, UserData userData) async {
    try {
      await AuthApi.refreshTokenIfNeededBeforeApiCall();
      final token = AuthService.instance.authToken;

      var url = Uri.https(AuthConst.urlAuth, '/users/${userData.id}');

      final resp = await delete(
        url,
        headers: {
          'content-type': 'application/json',
          'authorization': token.accessToken!,
        },
        body: json.encode(userData.toMap()),
      );

      if (resp.statusCode == 200) {
        return true;
      } else {
        if (context.mounted) {
          AppSnacks.defaultError(context, json.decode(resp.body)['message']);
        }
        return false;
      }
    } catch (e) {
      if (context.mounted) {
        AppSnacks.defaultError(context);
      }
      return false;
    }
  }
}
