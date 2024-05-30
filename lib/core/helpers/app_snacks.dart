import 'package:test_mpp/core/libs.dart';

class AppSnacks {
  /// Show a Material Snack Bar at bottom of page
  static showSnack(
    BuildContext? context,
    String text, {
    bool isError = false,
    Color? color,
    Duration? duration,
    SnackBarBehavior? behaviour,
  }) {
    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              text,
              textAlign: TextAlign.center,
            ),
            backgroundColor: isError ? context.theme.colorScheme.error : color,
            duration: duration ?? const Duration(seconds: 4),
            behavior: behaviour,
          ),
        );
    }
  }

  static defaultError(BuildContext context, [String? text]) {
    showSnack(context, text ?? 'Une erreur s\'est produite', isError: true);
  }
}
