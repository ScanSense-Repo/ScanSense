import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'box_provider.g.dart';

@riverpod
GetStorage box(Ref ref) {
  return GetStorage();
}
