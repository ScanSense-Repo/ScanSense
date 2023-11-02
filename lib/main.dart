import 'package:camera/camera.dart';
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
import 'package:scan_sense/utils/helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        HistoryScreen.routeName: (context) => HistoryScreen(),
        ScanScreen.routeName: (context) => ScanScreen(),
        ResultScreen.routeName: (context) => ResultScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LayoutScreen.routeName: (context) => LayoutScreen(),
        SettingScreen.routeName: (context) => SettingScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        AboutUsScreen.routeName: (context) => AboutUsScreen(),
      },
      navigatorKey: navigatorKey,
    );
  }
}
