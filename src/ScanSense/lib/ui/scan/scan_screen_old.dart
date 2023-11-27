// import 'dart:typed_data';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scan_sense/common/styles.dart';

// class ScanScreen extends StatefulWidget {
//   static const String routeName = '/scan-screen';

//   const ScanScreen({super.key});

//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   CameraController? controller;
//   List<CameraDescription>? cameras;

//   void capture() {
//     controller!.takePicture().then((XFile? file) {
//       if (file != null) {
//         print(file.path);
//         setState(() {
//           // _image = File(file.path);
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     availableCameras().then((availableCameras) {
//       cameras = availableCameras;
//       if (cameras!.isNotEmpty) {
//         controller = CameraController(cameras![0], ResolutionPreset.max);
//         controller!.initialize().then((_) {
//           if (!mounted) {
//             return;
//           }
//           setState(() {});
//         }).catchError((Object e) {
//           if (e is CameraException) {
//             switch (e.code) {
//               case 'CameraAccessDenied':
//                 // Handle access errors here.
//                 break;
//               default:
//                 // Handle other errors here.
//                 break;
//             }
//           }
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (controller == null || !controller!.value.isInitialized) {
//       return const Scaffold(
//         backgroundColor: backgroundColor,
//         body: Center(
//             child: CircularProgressIndicator(
//           color: primaryColor,
//         )),
//       );
//     }

//     final size = MediaQuery.of(context).size;
//     var scale = size.aspectRatio * controller!.value.aspectRatio;
//     if (scale < 1) scale = 1 / scale;

//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             floating: true,
//             title: Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "Verifikasi KTP",
//                 style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: blackColor),
//               ),
//             ),
//             primary: true,
//             backgroundColor: backgroundColor,
//             surfaceTintColor: backgroundColor,
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate([
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Arahkan kamera ke KTP yang ingin di verifikasi. Usahakan gambar terlihat jelas !!",
//                       style: GoogleFonts.poppins(
//                         fontSize: 13,
//                         color: grayColor,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: AspectRatio(
//                         aspectRatio:
//                             3 / 4.5, // Set the desired aspect ratio, e.g., 16/9
//                         child: Transform.scale(
//                           scale: controller!.value.aspectRatio,
//                           child: Center(
//                             child: CameraPreview(
//                               controller!,
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 24),
//                                 child: Center(
//                                   child: Container(
//                                     height: 120,
//                                     width: 180,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.white70, width: 1),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     ElevatedButton(
//                       onPressed: () => capture(),
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         backgroundColor: primaryColor,
//                         fixedSize:
//                             Size.fromWidth(MediaQuery.of(context).size.width),
//                       ),
//                       child: Text(
//                         "Verifikasi",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: whiteColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     ElevatedButton(
//                       onPressed: () => capture(),
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           side: const BorderSide(color: primaryColor, width: 1),
//                         ),
//                         backgroundColor: backgroundColor,
//                         elevation: 0,
//                         fixedSize:
//                             Size.fromWidth(MediaQuery.of(context).size.width),
//                       ),
//                       child: Text(
//                         "Unggah Gambar",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: primaryColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyImageView extends StatelessWidget {
//   const MyImageView({Key? key, required this.imageBytes}) : super(key: key);
//   final Uint8List imageBytes;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(4.0),
//       child: SizedBox(
//         width: double.infinity,
//         child: Image.memory(imageBytes),
//       ),
//     );
//   }
// }
