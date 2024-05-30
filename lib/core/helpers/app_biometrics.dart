// ignore_for_file: use_build_context_synchronously

import 'package:test_mpp/core/libs.dart';

class AppBiometrics {
  static Future<void> connectThroughBiometrics(
      BuildContext context, WidgetRef ref) async {
    try {
      final LocalAuthentication auth = LocalAuthentication();
      ref.read(connectionProvider.notifier).update((state) => true);

      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      final availableBiometrics = (await auth.getAvailableBiometrics());
      final isFingerPrintAvailable =
          availableBiometrics.contains(BiometricType.fingerprint) ||
              availableBiometrics.contains(BiometricType.weak) ||
              availableBiometrics.contains(BiometricType.strong);

      /// Show snack if there is any issue
      if ((!canAuthenticateWithBiometrics ||
              !canAuthenticate ||
              !isFingerPrintAvailable) &&
          context.mounted) {
        AppSnacks.showSnack(
          context,
          !canAuthenticateWithBiometrics
              ? 'Vous ne pouvez pas utiliser la biométrie.'
              : !canAuthenticate
                  ? 'Vous ne pouvez pas utiliser la biométrie.'
                  : 'Configurez vos empruntes digitales',
          isError: true,
          behaviour: SnackBarBehavior.floating,
        );
        // return false;
      } else {
        final res = await auth.authenticate(
          localizedReason: 'Authentifiez-vous pour accéder à l\'application',
        );
        if (res) {
          await AuthService.instance.loginWithBiometrics(context);
        } else {
          if (context.mounted) {
            AppSnacks.defaultError(context);
          }
          ref.read(connectionProvider.notifier).update((state) => false);
        }
      }
    } catch (e) {
      ref.read(connectionProvider.notifier).update((state) => false);
      if (context.mounted) {
        AppSnacks.defaultError(context);
      }

      /// returns a PlatformException(NotAvailable, Authentication canceled. ... )
      /// when clicking on the Cancel button
      // return false;
    }
  }
}
