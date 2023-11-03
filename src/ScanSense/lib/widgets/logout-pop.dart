import 'package:flutter/material.dart';
import 'package:scan_sense/common/styles.dart';

class LogoutPopup extends StatelessWidget {
  final VoidCallback onYes;
  final VoidCallback onNo;

  const LogoutPopup({
    Key? key,
    required this.onYes,
    required this.onNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Apakah Anda yakin ingin logout?',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100, // Lebar box
                    height: 40, // Tinggi box
                    child: TextButton(
                      onPressed: onYes,
                      child: Text('Ya'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: primaryColor,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 100, // Lebar box
                    height: 40, // Tinggi box
                    child: TextButton(
                      onPressed: onNo,
                      child: Text('Tidak'),
                      style: TextButton.styleFrom(
                        foregroundColor: primaryColor,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
