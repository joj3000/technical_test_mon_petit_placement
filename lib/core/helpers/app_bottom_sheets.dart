import 'package:test_mpp/core/libs.dart';
import 'package:test_mpp/features/users/view/widgets/user_page_settings_bottom_sheet.dart';

class AppBottomSheet {
  /// CRUD bottom sheet for UserPage
  static showUserCRUD(BuildContext context, {UserData? userData}) =>
      _showBottomSheet(context, CRUDUserBottomSheet(userData: userData));

  /// Show UserPageSettingsBottomSheet
  static showUserPageSettings(BuildContext context) =>
      _showBottomSheet(context, const UserPageSettingsBottomSheet());

  /// Not supposed to be used as is, but in another static function of the AppBottomSheet class
  static _showBottomSheet(BuildContext context, Widget child) =>
      showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        context: context,
        builder: (context) {
          return child;
        },
      );
}
