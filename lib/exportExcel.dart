import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> exportHistory(
    BuildContext context, Map<String, List<String>> data) async {
  final excel = Excel.createExcel();
  final sheet = excel['History'];

  sheet.setColAutoFit(0);
  sheet.setColAutoFit(1);
  sheet.setColAutoFit(2);
  sheet.setColAutoFit(3);
  sheet.setColAutoFit(4);
  sheet.appendRow(['No', 'Waktu', 'perhitungan']);
  int index = 1;
  data.forEach((key, value) {
    sheet.appendRow([index++, value[0], value[1]]);
    
  });

  Directory? appDocumentsDirectory = await getExternalStorageDirectory();

  if (appDocumentsDirectory != null) {
    String appDocumentsPath = appDocumentsDirectory.path ?? '';
    DateTime now = DateTime.now();
    final file = File('$appDocumentsPath/laporan-history-$now.xlsx');
    await file.writeAsBytes(excel.encode()!);

    print('Export data berhasil');

    downloadFile(context, file.path);
  } else {
    print('Gagal mendapatkan direktori penyimpanan eksternal');
  }
}

Future<void> downloadFile(BuildContext context, String filePath) async {
  final directory = await getExternalStorageDirectory();

  final File file = File(filePath);

  if (directory != null) {
    final String newPath = '${directory.path}/Laporan.xlsx';
    await file.copy(newPath);

    await OpenFile.open(filePath);
  } else {
    print('Gagal mendapatkan direktori penyimpanan eksternal');
  }
}
