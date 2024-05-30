import 'package:test_mpp/core/libs.dart';

class UserTile extends ConsumerStatefulWidget {
  final UserData userData;
  const UserTile(this.userData, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserTileState();
}

class _UserTileState extends ConsumerState<UserTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.theme.colorScheme.background,
        boxShadow: AppShadows.main,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.userData.position.toUpperCase(),
            style: context.theme.textTheme.bodySmall!
                .copyWith(color: const Color(0xff424242)),
          ),
          const Gap(4),
          Text(
            '${widget.userData.firstName.titleCase()} ${widget.userData.lastName.titleCase()}',
            style: context.theme.textTheme.titleSmall,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () => AppBottomSheet.showUserCRUD(
                context,
                userData: widget.userData,
              ),
              style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
              child: const Text(
                'Modifier',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
