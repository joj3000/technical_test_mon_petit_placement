import 'package:test_mpp/core/libs.dart';

class UserPageSettingsBottomSheet extends ConsumerStatefulWidget {
  const UserPageSettingsBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserPageSettingsBottomSheetState();
}

class _UserPageSettingsBottomSheetState
    extends ConsumerState<UserPageSettingsBottomSheet> {
  late bool _active;

  @override
  void initState() {
    super.initState();
    _active = UserPreferences.getBiometry();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(
                Icons.close_rounded,
                weight: 600,
                size: 26,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 16, 0),
            child: Row(
              children: [
                Switch(
                    value: _active,
                    onChanged: (val) async {
                      await UserPreferences.setBiometry(val);
                      setState(() {
                        _active = val;
                      });
                    }),
                Text(
                  'Utiliser la biométrie pour se connecter',
                  style: context.theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: ElevatedButton(
              onPressed: () {
                AuthService.instance.logout(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.colorScheme.error),
              child: const SizedBox(
                height: 40,
                child: Center(child: Text('Déconnexion')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
