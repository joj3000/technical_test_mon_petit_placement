import 'package:test_mpp/core/libs.dart';

class LoginFields extends ConsumerStatefulWidget {
  const LoginFields({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends ConsumerState<LoginFields> {
  late final TextEditingController _emailCtrl;
  late final TextEditingController _passwordCtrl;

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController(text: 'admin@monpetitplacement.fr');
    _passwordCtrl = TextEditingController(text: 'mpp#password2024!');
    ref.read(loginFieldsProvider).setFields(
          newEmail: 'admin@monpetitplacement.fr',
          newPassword: 'mpp#password2024!',
          notify: false,
        );
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void onEmailChanged(String val) {
    ref.read(loginFieldsProvider).setFields(newEmail: val);
  }

  void onPassChanged(String val) {
    ref.read(loginFieldsProvider).setFields(newPassword: val);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
        child: Column(
          children: [
            AppTextField('Email', _emailCtrl, onChanged: onEmailChanged),
            AppTextField('Mot de passe', _passwordCtrl,
                onChanged: onPassChanged, isPassword: true),
          ],
        ),
      ),
    );
  }
}
