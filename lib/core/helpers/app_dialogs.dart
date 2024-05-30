import 'package:test_mpp/core/libs.dart';

class AppDialogs {
  static Future<bool?> alert(
    BuildContext context,
    String title,
    String? text,
    String okText,
    String cancelText, {
    void Function()? onOkPressed,
    void Function()? onCancelPressed,
    Color? okColor,
    Color? cancelColor,
  }) async {
    final kColor = okColor ?? context.theme.colorScheme.primary;
    return await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(title, style: context.theme.textTheme.titleSmall),
        content: text != null ? Text(text) : null,
        actionsPadding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
        titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 25),
        actions: [
          TextButton(
              onPressed: onCancelPressed ??
                  () {
                    Navigator.of(context).pop(false);
                  },
              child: Text(
                cancelText,
                style: const TextStyle(color: Colors.black),
              )),
          ElevatedButton(
            onPressed: onOkPressed ??
                () {
                  Navigator.of(context).pop(true);
                },
            style: ElevatedButton.styleFrom(backgroundColor: kColor),
            child: Text(
              okText,
              style: context.theme.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
