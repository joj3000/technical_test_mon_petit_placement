import 'package:test_mpp/core/libs.dart';

class AuthLoginPage extends ConsumerStatefulWidget {
  const AuthLoginPage({super.key});

  static const routeName = 'loginPage';
  static const routePath = '/loginPage';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends ConsumerState<AuthLoginPage> {
  void showAppBottomSheet() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: const Column(
              children: [
                PageTitle('Connexion'),
                LoginFields(),
                LoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
