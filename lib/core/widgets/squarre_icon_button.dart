import 'package:test_mpp/core/libs.dart';

class SquarreIconButton extends ConsumerStatefulWidget {
  final IconData icon;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;

  const SquarreIconButton(
    this.icon,
    this.onPressed, {
    this.backgroundColor = const Color(0xffF4F2F2),
    this.iconColor = Colors.black,
    this.iconSize = 24,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SquarreIconButtonState();
}

class _SquarreIconButtonState extends ConsumerState<SquarreIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: widget.backgroundColor,
        ),
        child: Icon(
          widget.icon,
          size: widget.iconSize,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
