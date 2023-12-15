import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/login/login_screen.dart';

class KarirScreen extends StatefulWidget {
  static const String routeName = '/onboarding-screen';

  const KarirScreen({super.key});

  @override
  State<KarirScreen> createState() => _KarirScreenState();
}

class _KarirScreenState extends State<KarirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Karir"),
        ),
      ),
    );
  }
}
