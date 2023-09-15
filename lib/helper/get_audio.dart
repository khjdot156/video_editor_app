import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class GetAudios {
  List<FileSystemEntity> results = [];
  List<String> extentions = ['mp3', 'wav'];

  Future filterFile(FileSystemEntity dir) async {
    if (dir is Directory) {
      try {
        final enties = await dir.list().toList();
        for (var i = 0; i < enties.length; i++) {
          await filterFile(enties.elementAt(i));
        }
      } catch (e) {
        debugPrint('exp: $e');
      }
    } else if (dir is File) {
      final ext = FileManager.getFileExtension(dir).toLowerCase();
      if (extentions.contains(ext)) {
        results.add(dir);
      }
    }
  }

  Future<List<FileSystemEntity>> loadData() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      final FileManagerController controller = FileManagerController();
      var currentDir;
      results.clear();
      if (controller.getCurrentPath.isNotEmpty) {
        currentDir = await Future.value([controller.getCurrentDirectory]);
        debugPrint('currentDir: $currentDir');
      } else {
        currentDir = await FileManager.getStorageList();
        debugPrint('currentDir2: $currentDir');
      }

      for (Directory element in currentDir) {
        debugPrint('currentDir: ${element.path}');
        await filterFile(element);
      }
      debugPrint('results: $results');

      return results;
    }
    return [];
  }
}
