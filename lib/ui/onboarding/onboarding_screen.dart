import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/home/home_screen.dart';
import 'package:scan_sense/ui/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding-screen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  List<PageViewModel> listPages = [
    PageViewModel(
      title: "Kecepatan dan Akurasi",
      body:
          "Aplikasi ini sebagai solusi andal dan cepat dalam pengenalan KTP dalam waktu nyata",
      image: Center(
        child: Image.asset('assets/illustrations/Other 08.png'),
      ),
    ),
    PageViewModel(
      title: "Kecepatan dan Akurasi",
      body:
          "Aplikasi ini sebagai solusi andal dan cepat dalam pengenalan KTP dalam waktu nyata",
      image: Center(
        child: Image.asset('assets/illustrations/Other 08.png'),
      ),
    ),
    PageViewModel(
      title: "Kecepatan dan Akurasi",
      body:
          "Aplikasi ini sebagai solusi andal dan cepat dalam pengenalan KTP dalam waktu nyata",
      image: Center(
        child: Image.asset('assets/illustrations/Other 08.png'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: IntroductionScreen(
          key: introKey,
          pages: listPages,
          showSkipButton: true,
          skip: Text(
            "Lewati",
            style: GoogleFonts.poppins(fontSize: 16, color: grayColor),
          ),
          next: const CircleAvatar(
            radius: 30,
            foregroundColor: whiteColor,
            backgroundColor: primaryColor,
            child: Icon(
              Icons.arrow_forward,
              size: 24,
            ),
          ),
          done: Text(
            "Mulai",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: primaryColor,
            ),
          ),
          onDone: () {
            Navigation.replaceNamed(routeName: LoginScreen.routeName);
          },
          onSkip: () {
            introKey.currentState?.skipToEnd();
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: primaryColor,
            color: grayColor,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
