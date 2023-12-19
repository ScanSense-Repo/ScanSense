import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:scan_sense/base/provider/box_provider.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/login/login_screen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  static const String routeName = '/onboarding-screen';

  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  List<PageViewModel> listPages = [
    PageViewModel(
      titleWidget: Text(
        "Kecepatan dan Akurasi",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bodyWidget: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Text(
          "Aplikasi ini sebagai solusi andal dan cepat dalam pengenalan KTP dalam waktu nyata",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
      image: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Image.asset('assets/illustrations/Other 15.png'),
        ),
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        "Penggunaan Mudah",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bodyWidget: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Text(
          "Sebagai solusi yang mudah digunakan dan cocok untuk semua pengguna, bahkan yang tidak berpengalaman sekalipun.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
      image: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Image.asset('assets/illustrations/Other 08.png'),
        ),
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        "Keamanan Data",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bodyWidget: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Text(
          "Menonjolkan komitmen aplikasi untuk menjaga data pengguna tetap aman dan terlindungi.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
      image: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Image.asset('assets/illustrations/Other 18.png'),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final box = ref.read(boxProvider);
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
            box.write("isOnboarding", true);
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
