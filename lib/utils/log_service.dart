// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/foundation.dart';

// class LogService {
//   static const int maxLogs = 100; // Maximum number of logs to keep

//   static Future<void> saveAndExit(Object error, StackTrace stack) async {
//     log("Error caught in PlatformDispatcher");
//     await LogService.saveError(error, stack);
//     await Future.delayed(const Duration(seconds: 5));
//     if (kReleaseMode) {
//       exit(1);
//     }
//   }

//   static Future<void> saveLog(FlutterErrorDetails details) async {
//     File logFile = await getLogFile();

//     // Create detailed log entry as a JSON object
//     Map<String, dynamic> logEntry = _formatLogEntry(details);

//     // Read existing logs from file
//     List<Map<String, dynamic>> logs = await _readLogsFromFile(logFile);

//     // Add new log entry
//     logs.add(logEntry);

//     // Limit logs to maxLogs if exceeded
//     if (logs.length > maxLogs) {
//       logs = logs.sublist(logs.length - maxLogs);
//     }

//     // Write logs to file
//     await logFile.writeAsString(json.encode(logs));
//   }

//   static Future<bool> isLogFileEmpty() async {
//     File logFile = await getLogFile();
//     return !(await logFile.exists());
//     // try {} catch (e) {
//     //   // ExceptionHandler.handleException(e);
//     //   log('Error checking if log file is empty: $e');
//     //   return true;
//     // }
//   }

//   static Future<void> saveError(dynamic error, StackTrace stackTrace) async {
//     File logFile = await getLogFile();

//     // Create detailed error log entry as a JSON object
//     Map<String, dynamic> logEntry = _formatError(error, stackTrace);

//     // Read existing logs from file
//     List<Map<String, dynamic>> logs = await _readLogsFromFile(logFile);

//     // Add new error log entry
//     logs.add(logEntry);

//     // Limit logs to maxLogs if exceeded
//     if (logs.length > maxLogs) {
//       logs = logs.sublist(logs.length - maxLogs);
//     }

//     // Write logs to file
//     await logFile.writeAsString(json.encode(logs));
//   }

//   static Map<String, dynamic> _formatLogEntry(FlutterErrorDetails details) {
//     String time = DateTime.now().toString();
//     String summary = details.summary.toStringDeep();
//     String exception = details.exceptionAsString();
//     String stackTrace = details.stack.toString();
//     String library = details.library.toString();
//     String context = details.context?.toDescription() ?? 'No context';
//     String informationCollector = details.informationCollector
//             ?.call()
//             .map((DiagnosticsNode node) => node.toStringDeep())
//             .join('\n') ??
//         'No additional information';

//     // Create a JSON object
//     return {
//       'time': time,
//       'summary': summary,
//       'exception': exception,
//       'stackTrace': stackTrace,
//       'library': library,
//       'context': context,
//       'informationCollector': informationCollector,
//     };
//   }

//   static Map<String, dynamic> _formatError(
//       dynamic error, StackTrace stackTrace) {
//     String time = DateTime.now().toString();
//     String errorString = error.toString();
//     String stackTraceString = stackTrace.toString();

//     // Create a JSON object
//     return {
//       'time': time,
//       'error': errorString,
//       'stackTrace': stackTraceString,
//     };
//   }

//   static Future<List<Map<String, dynamic>>> _readLogsFromFile(
//       File logFile) async {
//     if (await logFile.exists()) {
//       String contents = await logFile.readAsString();
//       List<dynamic> logsJson = json.decode(contents);
//       List<Map<String, dynamic>> logs =
//           logsJson.map((log) => Map<String, dynamic>.from(log)).toList();
//       return logs;
//     } else {
//       return [];
//     }
//   }

//   static Future<File> getLogFile() async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     return File('${appDocDir.path}/app_logs.json');
//   }
// }
