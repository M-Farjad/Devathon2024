// import 'dart:developer';

// import '../headers.dart';

// class ShareUtil {
//   ShareUtil._();
//   static Future<void> shareLogFile() async {
//     bool isFileEmpty = await LogService.isLogFileEmpty();
//     if (isFileEmpty == false) {
//       // String logContent = logs.join('\n');
//       // Share.share(logContent, subject: 'Application logs for debugging');
//       Share.shareXFiles([XFile((await LogService.getLogFile()).path)],
//           text: Strings.appLogsForAppDebug);
//     } else {
//       log(Strings.notLogsFound);
//       MyDialog.getInfo(Strings.notLogsFound);
//     }
//   }
// }
