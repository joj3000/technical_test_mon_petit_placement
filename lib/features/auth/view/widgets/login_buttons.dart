import 'package:test_mpp/core/libs.dart';

class LoginButtons extends ConsumerStatefulWidget {
  const LoginButtons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends ConsumerState<LoginButtons> {
  late bool _showBiometricsButton;

  @override
  void initState() {
    super.initState();
    _showBiometricsButton = UserPreferences.getBiometry();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const SigninButton(),
          if (_showBiometricsButton) ...[
            const Gap(5),
            SquarreIconButton(
              Icons.fingerprint_sharp,
              () {
                AppBiometrics.connectThroughBiometrics(context, ref);
              },
            )
          ],
        ],
      ),
    );
  }
}
