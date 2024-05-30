import 'package:test_mpp/core/libs.dart';

class SigninButton extends ConsumerStatefulWidget {
  const SigninButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninButtonState();
}

class _SigninButtonState extends ConsumerState<SigninButton> {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(connectionProvider);

    return Expanded(
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          await AuthService.instance.login(context, ref);
        },
        child: SizedBox(
          height: 40,
          child: Center(
            child: isLoading ? _loadingIndicator : const Text('Connexion'),
          ),
        ),
      ),
    );
  }

  final Widget _loadingIndicator = const SizedBox(
    height: 20,
    width: 20,
    child: FittedBox(
      child: CircularProgressIndicator(color: Colors.white),
    ),
  );
}
