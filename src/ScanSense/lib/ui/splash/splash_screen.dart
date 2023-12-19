import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/base/provider/box_provider.dart';
import 'package:scan_sense/base/provider/firebase_auth_provider.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/company/company_home_screen.dart';
import 'package:scan_sense/ui/layout/layout_screen.dart';
import 'package:scan_sense/ui/login/login_screen.dart';
import 'package:scan_sense/ui/onboarding/onboarding_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    final auth = ref.read(firebaseAuthProvider);
    final box = ref.read(boxProvider);
    Future.delayed(const Duration(seconds: 3), () {
      // auth.userChanges().listen((user) {
      //   if (user != null) {
      //     Navigation.replaceNamed(routeName: LayoutScreen.routeName);
      //   } else {
      //     Navigation.replaceNamed(routeName: OnboardingScreen.routeName);
      //   }
      // });
      if (box.read("isLoggedIn") ?? false == true) {
        if (box.read("role") == "user") {
          Navigation.replaceNamed(routeName: LayoutScreen.routeName);
        } else {
          Navigation.replaceNamed(routeName: CompanyHomeScreen.routeName);
        }
      } else if (box.read("isOnboarding") ?? false == true) {
        Navigation.replaceNamed(routeName: LoginScreen.routeName);
      } else {
        Navigation.replaceNamed(routeName: OnboardingScreen.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('assets/illustrations/ellipse.svg'),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/illustrations/logo-ocr-white-rev.png',
                      width: 250, height: 250),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "Politeknik Negeri Malang",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ));
  }
}
