import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

import 'downloader.dart';

class MobileDownloadService implements DownloadService {
  @override
  Future<void> download({required List<int> bytes}) async {
    // requests permission for downloading the file

    // gets the directory where we will download the file.

    // You should put the name you want for the file here.
    // Take in account the extension.
    String fileName = 'config.txt';

    // saving the file

    await FileSaver.instance.saveFile(
      name: fileName,
      bytes: Uint8List.fromList(bytes),
      ext: "txt",
      mimeType: MimeType.text,
    );
  }
}
