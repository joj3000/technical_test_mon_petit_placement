import 'package:test_mpp/core/libs.dart';

const String AUTH_TOKEN_KEY = 'auth_token';

class AuthToken {
  final String? accessToken;
  final String? refreshToken;

  const AuthToken({this.accessToken, this.refreshToken});

  DateTime get tokenExpirationDate => accessToken == null
      ? DateTime.now()
      : JwtDecoder.getExpirationDate(accessToken!);

  /// Gives back a instance of AuthToken to simplify the use
  factory AuthToken.fromJson(String? json) {
    if (json == null) return AuthToken.none();
    final Map<String, dynamic> map = jsonDecode(json);
    return AuthToken(
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }

  factory AuthToken.fromResponse(Response? response) {
    if (response == null) return AuthToken.none();
    final Map<String, dynamic> body = jsonDecode(response.body);
    final accessToken = body['accessToken'];
    final refreshToken = body['refreshToken'];

    return AuthToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  String toJson() {
    final map = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
    return jsonEncode(map);
  }

  factory AuthToken.none() {
    return const AuthToken(accessToken: null, refreshToken: null);
  }

  static void storeToken(
      FlutterSecureStorage secureStorage, Response response) {
    final Map<String, dynamic> body = jsonDecode(response.body);
    final accessToken = body['accessToken'];
    final refreshToken = body['refreshToken'];

    final Map<String, dynamic> mapToStore = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };

    secureStorage.write(key: AUTH_TOKEN_KEY, value: jsonEncode(mapToStore));
  }

  @override
  bool operator ==(covariant AuthToken other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;

  @override
  String toString() =>
      'AuthToken\n{\naccessToken: $accessToken,\nrefreshToken: $refreshToken\n}\n';
}
