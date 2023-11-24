import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/ui/about%20us/about_us.dart';
import 'package:scan_sense/ui/history/history_screen.dart';
import 'package:scan_sense/ui/home/home_screen.dart';
import 'package:scan_sense/ui/layout/layout_screen.dart';
import 'package:scan_sense/ui/login/login_screen.dart';
import 'package:scan_sense/ui/onboarding/onboarding_screen.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';
import 'package:scan_sense/ui/register/register_screen.dart';
import 'package:scan_sense/ui/scan/result_screen.dart';
import 'package:scan_sense/ui/scan/scan_screen.dart';
import 'package:scan_sense/ui/setting/setting_screen.dart';
import 'package:scan_sense/ui/splash/splash_screen.dart';
import 'package:scan_sense/ui/test/test_screen.dart';
import 'package:scan_sense/utils/helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var routes = {
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
    AboutUsScreen.routeName: (context) => const AboutUsScreen(),
    TestScreen.routeName: (context) => const TestScreen(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
            builder: (context) => routes[settings.name]!(context));
      },
      navigatorKey: navigatorKey,
    );
  }
}
