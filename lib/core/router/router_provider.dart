import 'package:test_mpp/core/libs.dart';

/// In charge of the entire app routing (which are natural deeplink system)
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: AuthService.instance.loginInfo.isLoggedIn
        ? UsersPage.routePath
        : AuthLoginPage.routePath,
    redirect: (context, state) async {
      final bool isLoggedIn = AuthService.instance.loginInfo.isLoggedIn;
      final bool goingToLoginPage = state.fullPath == AuthLoginPage.routePath;
      if (!isLoggedIn && !goingToLoginPage || !isLoggedIn && goingToLoginPage) {
        return AuthLoginPage.routePath;
      } else {
        if (isLoggedIn && goingToLoginPage) {
          return UsersPage.routePath;
        } else {
          return null;
        }
      }
    },
    refreshListenable: AuthService.instance.loginInfo,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: AuthLoginPage.routePath,
        name: AuthLoginPage.routeName,
        builder: (context, state) {
          return const AuthLoginPage();
        },
      ),
      GoRoute(
        path: UsersPage.routePath,
        name: UsersPage.routeName,
        builder: (context, state) {
          return const UsersPage();
        },
      ),
    ],
  ),
);
