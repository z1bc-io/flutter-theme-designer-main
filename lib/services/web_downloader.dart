import 'dart:html';

import './downloader.dart';

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
