import 'package:camera/camera.dart';
import 'package:intl/intl.dart';

List<CameraDescription> cameras = [];

final tanggalFormat = DateFormat('dd MMMM yyyy', 'id_ID');

String? getTanggal(DateTime? date) {
  if (date == null) return null;
  return tanggalFormat.format(date);
}
