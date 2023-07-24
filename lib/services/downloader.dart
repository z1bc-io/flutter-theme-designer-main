// import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

abstract class DownloadService {
  Future<void> download({required List<int> bytes});
}
