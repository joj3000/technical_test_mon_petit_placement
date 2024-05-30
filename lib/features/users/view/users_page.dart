import 'package:test_mpp/core/libs.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  static const routeName = 'usersPage';
  static const routePath = '/usersPage';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: SquarreIconButton(
            Icons.add_rounded,
            () => AppBottomSheet.showUserCRUD(context),
            backgroundColor: context.theme.colorScheme.primary,
            iconColor: Colors.white,
          ),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: Column(
            children: [
              PageTitle(
                'Utilisateurs',
                icon: Icons.settings_outlined,
                onIconPressed: () =>
                    AppBottomSheet.showUserPageSettings(context),
              ),
              const UserListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
