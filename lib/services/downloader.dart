// import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:universal_html/html.dart';

abstract class DownloadService {
  Future<void> download({required List<int> bytes});
}

class WebDownloadService implements DownloadService {
  @override
  Future<void> download({required List<int> bytes}) async {
    final blob = Blob([bytes]);
    final url = Url.createObjectUrlFromBlob(blob);

    AnchorElement anchor = AnchorElement()
      ..download = "Config.txt"
      ..href = url;
    anchor.click();
  }
}

class MobileDownloadService implements DownloadService {
  @override
  Future<void> download({required List<int> bytes}) async {
    // requests permission for downloading the file

    // gets the directory where we will download the file.

    // You should put the name you want for the file here.
    // Take in account the extension.
    // String fileName = 'config.txt';

    // saving the file

    // await FileSaver.instance.saveFile(
    //   name: fileName,
    //   bytes: bytes,
    //   ext: "txt",
    //   mimeType: MimeType.text,
    // );
  }
}
