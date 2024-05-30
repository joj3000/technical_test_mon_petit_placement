import 'package:test_mpp/core/libs.dart';

class AppTextField extends ConsumerStatefulWidget {
  final TextEditingController ctrl;
  final String title;
  final EdgeInsets? padding;
  final String? hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const AppTextField(
    this.title,
    this.ctrl, {
    this.padding,
    this.isPassword = false,
    this.hint,
    this.validator,
    this.onChanged,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends ConsumerState<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.theme.textTheme.bodySmall,
          ),
          const Gap(5),
          SizedBox(
            height: 70,
            child: TextFormField(
              controller: widget.ctrl,
              autocorrect: false,
              obscureText: widget.isPassword,
              onChanged: widget.onChanged,
              enableInteractiveSelection: false,
              validator: widget.validator,
              style: const TextStyle(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: widget.hint,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
