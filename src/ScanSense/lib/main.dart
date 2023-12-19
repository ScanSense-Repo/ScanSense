import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_file.dart' as file;
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/firebase_options.dart';
import 'package:scan_sense/ui/about%20us/about_us.dart';
import 'package:scan_sense/ui/career/career_screen.dart';
import 'package:scan_sense/ui/career/field_screen.dart';
import 'package:scan_sense/ui/career/karir_screen.dart';
import 'package:scan_sense/ui/company/company_home_screen.dart';
import 'package:scan_sense/ui/company/detail_company_screen.dart';
import 'package:scan_sense/ui/history/history_screen.dart';
import 'package:scan_sense/ui/home/home_screen.dart';
import 'package:scan_sense/ui/layout/layout_screen.dart';
import 'package:scan_sense/ui/login/login_screen.dart';
import 'package:scan_sense/ui/onboarding/onboarding_screen.dart';
import 'package:scan_sense/ui/password/forgot_password.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';
import 'package:scan_sense/ui/register/register_screen.dart';
import 'package:scan_sense/ui/scan/result_screen.dart';
import 'package:scan_sense/ui/scan/scan_screen.dart';
import 'package:scan_sense/ui/setting/setting_screen.dart';
import 'package:scan_sense/ui/splash/splash_screen.dart';
import 'package:scan_sense/ui/test/test_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  initializeDateFormatting('id_ID', null);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    HistoryScreen.routeName: (context) => const HistoryScreen(),
    ScanScreen.routeName: (context) => const ScanScreen(),
    ResultScreen.routeName: (context) => const ResultScreen(),
    OnboardingScreen.routeName: (context) => const OnboardingScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    LayoutScreen.routeName: (context) => const LayoutScreen(),
    SettingScreen.routeName: (context) => const SettingScreen(),
    ProfileScreen.routeName: (context) => const ProfileScreen(),
    KarirScreen.routeName: (context) => const KarirScreen(),
    CareerScreen.routeName: (context) => const CareerScreen(),
    AboutUsScreen.routeName: (context) => const AboutUsScreen(),
    TestScreen.routeName: (context) => const TestScreen(),
    //NotificationScreen.routeName: (context) => const NotificationScreen(),
    ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
    FieldScreen.routeName: (context) => const FieldScreen(),
    CompanyHomeScreen.routeName: (context) => const CompanyHomeScreen(),
    DetailCompanyScreen.routeName: (context) => const DetailCompanyScreen(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan Sense',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      // onGenerateRoute: (settings) {
      //   return CupertinoPageRoute(
      //       builder: (context) => routes[settings.name]!(context));
      // },
      navigatorKey: navigatorKey,
    );
  }
}
