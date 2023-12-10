import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_provider.g.dart';

@riverpod
FirebaseStorage storage(Ref ref) {
  return FirebaseStorage.instance;
}
