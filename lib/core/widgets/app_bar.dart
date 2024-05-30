import 'package:test_mpp/core/libs.dart';

/// Page title, with icon
class PageTitle extends ConsumerStatefulWidget {
  final String title;
  final IconData? icon;
  final Function()? onIconPressed;
  const PageTitle(this.title, {this.icon, this.onIconPressed, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageTitleState();
}

class _PageTitleState extends ConsumerState<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: context.theme.textTheme.headlineLarge,
                  ),
                ),
                if (widget.icon != null)
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.all(0),
                    icon: Icon(widget.icon, size: 24),
                    onPressed: widget.onIconPressed,
                  ),
              ],
            ),
          ),
        ),
        Divider(
          color: context.theme.dividerColor,
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
