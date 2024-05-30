import 'package:test_mpp/core/libs.dart';

class UserListWidget extends ConsumerStatefulWidget {
  const UserListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends ConsumerState<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    final userListProv = ref.watch(userListProvider);
    return Expanded(
      child: userListProv.when(
        loading: () => const AppProgressIndicator(),
        error: (_, __) =>
            AppProgressIndicator(color: context.theme.colorScheme.error),
        data: (userList) {
          if (userList.isEmpty) {
            return Center(
              child: Text(
                'Aucun utilisateur',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[400],
                ),
              ),
            );
          }
          return GridView.count(
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 80),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            children: [
              for (final user in userList) UserTile(user),
            ],
          );
        },
      ),
    );
  }
}
