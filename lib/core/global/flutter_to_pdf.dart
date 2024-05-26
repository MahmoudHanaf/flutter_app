// import 'dart:convert';
// import 'dart:io';
// import 'package:excel/excel.dart' as e;
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../features/orders/data/models/transaction_model.dart';

// Future<void> createExcelFile(
//     List<List<dynamic>> data1, List<List<dynamic>> data2) async {
//   var excel = e.Excel.createExcel();

//   // Add the first sheet for sales
//   excel.rename("Sheet1", "مبيعات");
//   var salesSheet = excel['مبيعات'];
  

//   // Add headers to the sales sheet
//   salesSheet.appendRow([
//     'العملية',
//     'نوع العملية',
//     'التاريخ',
//     'الصنف',
//     'الكمية',
//     'سعر الوحدة',
//     'اجمالي',
//     'الخصم',
//     'ض مبيعات',
//     'القيمة',
//     'متوسط التكلفة',
//     'اجمالي التكلفة',
//     'الربحية'
//     // ... (Other headers)
//   ]);

//   // Add rows to the sales sheet
//   // if (data1 != null || data1.isNotEmpty) {
//   //   data1 = data1.reversed.toList();
//   // }
//   for (var transaction in data1) {
//     salesSheet.appendRow(transaction);
//   }

//   // Add the second sheet for purchases
//   excel.rename("Sheet2", "مشتريات");
//   var purchasesSheet = excel['مشتريات'];

//   // Add headers to the purchases sheet
//   purchasesSheet.appendRow([
//     'العملية',
//     'التاريخ',
//     'الوصف',
//     'الصنف',
//     'الكمية',
//     'سعر الوحدة',
//     'اجمالي',
//     'الخصم',
//     'ض مبيعات',
//     'القيمة',
//     'متوسط التكلفة',
//     'اجمالي التكلفة',
//     'الصادر'
//     // ... (Other headers)
//   ]);

//   // Add rows to the purchases sheet
//   if (data2 != null || data2.isNotEmpty) {
//     data2 = data2.reversed.toList();
//   }
//   for (var transaction in data2) {
//     purchasesSheet.appendRow(transaction);
//   }
//   var regex = RegExp(r'^\s*$');
//   // Apply cell styles
//   for (var sheet in excel.tables.keys) {
//     var table = excel.tables[sheet]!;
//     debugPrint("Sheet : ${table.sheetName}");
    
//     for (var row in table.rows) {
      
//       for (var cell in row) {
//         try {
//           debugPrint("Value : ${row[0]!.value}");
//           cell!.cellStyle = e.CellStyle(
            
//             fontFamily: 'Arial',
//             backgroundColorHex: regex.hasMatch(row[0]!.value.toString()) ? '#ffffff' : '#d5d5d5',
//             topBorder: e.Border(borderStyle: e.BorderStyle.Thin),
//             rightBorder: e.Border(borderStyle: e.BorderStyle.Thin),
//             bottomBorder: e.Border(borderStyle: e.BorderStyle.Thin),
//             // bottomBorder: Border(),
            
//             fontSize: 10,
            
//             bold: true,
//             textWrapping: e.TextWrapping.WrapText,
//             horizontalAlign: e.HorizontalAlign.Center,
//             verticalAlign: e.VerticalAlign.Center,
//           );
//         } catch (e) {
//           debugPrint("Error at Method Flutter _ to pdf  : ${e.toString()} ");
//         }
//       }
//     }
//   }

//   var date = DateFormat('dd_MM_yyyy hh_mm a').format(DateTime.now());
//   var downloadPath = await getDownloadsDirectory();

//   // Get the application documents directory
//   String? result = await FilePicker.platform.saveFile(
//       dialogTitle: 'اختار المكان',
//       initialDirectory: downloadPath!.path,
//       allowedExtensions: ['xlsx'],
//       type: FileType.custom);

//   if (result == null) {
//     return;
//   }
//   debugPrint("Result : ${result}");
//   File file = File(result + '.xlsx');
//   excel.parser;
//   List<int> fileBytes = excel.save()!;

//   if (file.existsSync()) {
//     // Delete the existing file if it already exists
//     file.deleteSync();
//   }

//   file
//     ..createSync(recursive: true)
//     ..writeAsBytesSync(fileBytes, flush: true);
// }

// // Future<void> createExcelFile(List<TransactionModel> salesTransactions, List<TransactionModel> purchaseTransactions) async {
// //   var excel = Excel.createExcel();

// //   // Add the first sheet for sales
// //   excel.rename("Sheet1", "مبيعات");
// //   var salesSheet = excel['مبيعات'];

// //   // Add headers to the sales sheet
// //   salesSheet.appendRow([
// //      'العملية',
// //         'التاريخ',
// //         'الصنف',
// //         'الكمية',
// //         'سعر الوحدة',
// //         'الخصم',
// //         'ض مبيعات',
// //         'اجمالي',
// //         'القيمة',
// //         'متوسط التكلفة',
// //         'اجمالي التكلفة',
// //         'الربحية'
// //     // ... (Other headers)
// //   ]);

// //   // Add rows to the sales sheet
// //   for (var transaction in salesTransactions) {
// //     List<dynamic> row = transaction.toExcel();

// //     salesSheet.appendRow(row);
// //   }

// //   // Add the second sheet for purchases
// //   excel.rename("Sheet2", "مشتريات");
// //   var purchasesSheet = excel['مشتريات'];

// //   // Add headers to the purchases sheet
// //   purchasesSheet.appendRow([
// //         'العملية',
// //         'التاريخ',
// //         'الصنف',
// //         'الكمية',
// //         'سعر الوحدة',
// //         'الخصم',
// //         'ض مبيعات',
// //         'اجمالي',
// //         'القيمة',
// //         'متوسط التكلفة',
// //         'اجمالي التكلفة',
// //         'الربحية'

// //     // ... (Other headers)
// //   ]);

// //   // Add rows to the purchases sheet
// //   for (var transaction in purchaseTransactions) {
// //     List<dynamic> row = 
// //       transaction.toExcel()
// //     ;

// //     purchasesSheet.appendRow(row);
// //   }

// //   // Apply cell styles
// //   for (var sheet in excel.tables.keys) {
// //     var table = excel.tables[sheet]!;
// //     debugPrint("Sheet : ${table.sheetName}");
// //     for (var row in table.rows) {
      
// //       for (var cell in row) {
// //         cell!.cellStyle = CellStyle(
// //           fontFamily: 'Arial',
// //           fontSize: 12,
// //           // bold: true,
// //           textWrapping: TextWrapping.WrapText,
// //           horizontalAlign: HorizontalAlign.Center,
// //           verticalAlign: VerticalAlign.Center,
// //         );
// //       }
// //     }
// //   }

// //   var date = DateFormat('dd_MM_yyyy hh_mm a').format(DateTime.now());
// //   var downloadPath = await getDownloadsDirectory();

// //   // Get the application documents directory
// //   String? result = await FilePicker.platform.saveFile(
// //     dialogTitle: 'اختار المكان',
// //     initialDirectory: downloadPath!.path,
// //     allowedExtensions: ['xlsx'],
// //     type: FileType.custom
// //   );

// //   if (result == null) {
// //     return;
// //   }
// //   debugPrint("Result : ${result}");  
// //   File file = File(result+'.xlsx');
// //   List<int> fileBytes = excel.save()!;
  
// //   if (file.existsSync()) {
// //     // Delete the existing file if it already exists
// //     file.deleteSync();
// //   }

// //   file
// //     ..createSync(recursive: true)
// //     ..writeAsBytesSync(fileBytes, flush: true);
// // }
