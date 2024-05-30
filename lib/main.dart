import 'package:test_mpp/core/libs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthService.instance.init(autoLogin: false);
  await UserPreferences.init();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
