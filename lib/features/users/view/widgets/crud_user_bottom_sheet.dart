// ignore_for_file: use_build_context_synchronously

import 'package:test_mpp/core/libs.dart';

final _formKey = GlobalKey<FormState>();

class CRUDUserBottomSheet extends ConsumerStatefulWidget {
  final UserData? userData;
  const CRUDUserBottomSheet({this.userData, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CRUDUserBottomSheetState();
}

class _CRUDUserBottomSheetState extends ConsumerState<CRUDUserBottomSheet> {
  late final TextEditingController _firstNameCtrl;
  late final TextEditingController _lastNameCtrl;
  late final TextEditingController _positionCtrl;

  @override
  void initState() {
    super.initState();
    _firstNameCtrl =
        TextEditingController(text: widget.userData?.firstName ?? '');
    _lastNameCtrl =
        TextEditingController(text: widget.userData?.lastName ?? '');
    _positionCtrl =
        TextEditingController(text: widget.userData?.position ?? '');
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _positionCtrl.dispose();
    super.dispose();
  }

  Future<void> createModifyUser() async {
    if (_formKey.currentState!.validate()) {
      final newUser = UserData(
        id: widget.userData?.id,
        firstName: _firstNameCtrl.text,
        lastName: _lastNameCtrl.text,
        position: _positionCtrl.text,
      );
      bool result = false;
      if (widget.userData == null) {
        result = await UsersApi.createUser(context, newUser);
      } else {
        result = await UsersApi.modifyUser(context, newUser);
      }
      if (result) {
        if (context.mounted) {
          Navigator.of(context).pop();
          ref.invalidate(userListProvider);
        }
      }
    }
  }

  Future<void> deleteUser() async {
    final tmp = await AppDialogs.alert(
      context,
      'Es-tu sûr.e de vouloir supprimer ce compte ?',
      null,
      'Je confirme',
      'Annuler',
      okColor: context.theme.colorScheme.error,
    );
    if (tmp != null && tmp) {
      bool result = false;
      result = await UsersApi.deleteUser(context, widget.userData!);
      if (result) {
        if (context.mounted) {
          Navigator.of(context).pop();
          ref.invalidate(userListProvider);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 405,
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
                  AppTextField(
                    'Prénom',
                    _firstNameCtrl,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
                    hint: 'Jean',
                    validator: AppFormFieldValidator.basic,
                  ),
                  AppTextField(
                    'Nom',
                    _lastNameCtrl,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
                    hint: 'Durand',
                    validator: AppFormFieldValidator.basic,
                  ),
                  AppTextField(
                    'Poste',
                    _positionCtrl,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
                    hint: 'Fleuriste, Customer Care, Developer',
                    validator: AppFormFieldValidator.basic,
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                    child: Row(
                      children: [
                        if (widget.userData != null) ...[
                          SquarreIconButton(
                            Icons.delete,
                            deleteUser,
                            backgroundColor: context.theme.colorScheme.error,
                            iconSize: 24,
                          ),
                          const Gap(8),
                        ],
                        Expanded(
                          child: ElevatedButton(
                            onPressed: createModifyUser,
                            child: const SizedBox(
                              height: 40,
                              child: Center(child: Text('Valider')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
