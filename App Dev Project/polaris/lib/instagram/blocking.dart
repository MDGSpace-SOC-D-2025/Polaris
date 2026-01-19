import 'package:flutter/material.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polaris/integration/rewardtime_integrate.dart';
import 'package:usage_stats/usage_stats.dart';
import 'package:block_app/block_app.dart';

final RewardTimeService rewardtimeBlockingService = RewardTimeService();
final blockApp = BlockApp();

Future<void> initializeBlockApp() async {
  await blockApp.initialize(
    config: const AppBlockConfig(
      defaultMessage: 'This app is blocked',
      overlayBackgroundColor: Colors.black87,
      overlayTextColor: Colors.white,
      actionButtonText: 'Close',
      autoStartService: true,
    ),
  );
}

Future<void> takingPermission() async {
  // await UsageStats.grantUsagePermission();
  if (await UsageStats.checkUsagePermission() == false) {
    await openAppSettings();
  }

  // await Permission.systemAlertWindow.request();
  if (await Permission.systemAlertWindow.isDenied) {
    await openAppSettings();
  }

  if (await Permission.ignoreBatteryOptimizations.isDenied) {
    await Permission.ignoreBatteryOptimizations.request();
  }

  bool isEnabled =
      await FlutterAccessibilityService.isAccessibilityPermissionEnabled(); ////
  if (!isEnabled) {
    await FlutterAccessibilityService.requestAccessibilityPermission();
    return;
  }
}

Future<void> onOpeningInstagram() async {
  print("onOpeningInstagram is called");
  await blockApp.blockApp('com.instagram.android');
  print("instagram is blocked");
}

// Future<void> onOpeningInstagram() async {
//   try {
//     final rt = await rewardtimeBlockingService.getRewardTimeUser();
//     print("got reward time");
//     if (rt <= 0) {
//       if (await Permission.systemAlertWindow.isGranted) {
//         await blockApp.blockApp('com.instagram.android');
//         print("instagram is blocked");
//       } else {
//         await openAppSettings();
//         print("instagram is not block, setting is opened");
//       }
//     } else {
//       DateTime endDate = DateTime.now();
//       DateTime startDate = DateTime(
//         endDate.year,
//         endDate.month,
//         endDate.day,
//         0,
//         0,
//         0,
//       );

//       int durationInMilisec = 0;
//       List<UsageInfo> usageStats = await UsageStats.queryUsageStats(
//         startDate,
//         endDate,
//       );
//       for (var i in usageStats) {
//         if (i.packageName == 'com.instagram.android') {
//           durationInMilisec = int.parse(i.totalTimeInForeground ?? '0');
//         }
//       }

//       int durationInMin = durationInMilisec ~/ 60000;
//       int currentRewardTime = await rewardtimeBlockingService
//           .getRewardTimeUser();
//       final rtUpdated = currentRewardTime - durationInMin;

//       if (rtUpdated <= 0) {
//         if (await Permission.systemAlertWindow.isGranted) {
//           await blockApp.blockApp('com.instagram.android');
//         } else {
//           await openAppSettings();
//         }
//       } else {
//         await rewardtimeBlockingService.setRewardTimeUser(
//           currentRewardTime - durationInMin,
//         );
//       }
//     }
//   } on Exception catch (e) {
//     print(e);
//   }
// }
