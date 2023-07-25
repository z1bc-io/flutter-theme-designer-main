import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'downloader.dart';

class MobileDownloadService implements DownloadService {
  @override
  Future<void> download({required List<int> bytes, String? content}) async {
    // requests permission for downloading the file
    try {
      bool hasPermission = await _requestWritePermission();
      if (!hasPermission) return;
      // gets the directory where we will download the file.
      var dir = await getApplicationDocumentsDirectory();

      if (Platform.isAndroid) {
        dir = Directory("/storage/emulated/0/Download");
      }
      var savedFolder = "Download";
      if (Platform.isIOS) {
        savedFolder = "Documents";
      }

      // You should put the name you want for the file here.
      // Take in account the extension.
      String fileName = 'config-customly.txt';

      // saving the file
      File file = File('${dir.path}/$fileName');
      await file.writeAsString(content as String);
      Fluttertoast.showToast(
          msg: "Successfully saved the file in: " + savedFolder + " folder",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          fontSize: 16.0);
    } catch (error) {
      Fluttertoast.showToast(
          msg: "Error occured while downloading file",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          fontSize: 16.0);
    }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }
}
