import 'package:test_mpp/core/libs.dart';

class AppProgressIndicator extends StatefulWidget {
  final bool centered;
  final EdgeInsets padding;
  final Color? color;
  const AppProgressIndicator(
      {this.centered = true,
      this.padding = const EdgeInsets.all(20),
      this.color,
      super.key});

  @override
  State<AppProgressIndicator> createState() => _AppProgressIndicatorState();
}

class _AppProgressIndicatorState extends State<AppProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: widget.centered
          ? Center(child: _progressIndicator)
          : _progressIndicator,
    );
  }

  Widget get _progressIndicator =>
      CircularProgressIndicator(color: widget.color);
}
