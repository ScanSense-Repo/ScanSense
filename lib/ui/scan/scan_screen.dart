import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  static const String routeName = '/scan-screen';

  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Scan Screen"),
      ),
    );
  }
}
