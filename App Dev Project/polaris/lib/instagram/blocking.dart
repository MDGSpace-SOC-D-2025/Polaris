import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polaris/integration/rewardtime_integrate.dart';
import 'package:usage_stats/usage_stats.dart';

final RewardTimeService rewardtimeBlockingService = RewardTimeService();

DateTime? instagramStartTime;

Future<void> takingPermission() async {
  if (await UsageStats.checkUsagePermission() == false) {
    await openAppSettings();
    return;
  }

  if (await Permission.systemAlertWindow.isDenied) {
    await openAppSettings();
    return;
  }

  if (await Permission.ignoreBatteryOptimizations.isDenied) {
    await Permission.ignoreBatteryOptimizations.request();
    return;
  }

  bool isEnabled =
      await FlutterAccessibilityService.isAccessibilityPermissionEnabled();
  if (!isEnabled) {
    await FlutterAccessibilityService.requestAccessibilityPermission();
    return;
  }

  if (await FlutterOverlayWindow.isPermissionGranted() == false) {
    await openAppSettings();
    return;
  }
}

// Future<void> onOpeningInstagram() async {
//   try {
//     final rt = await rewardtimeBlockingService.getRewardTimeUser();
//     print("Current reward time: $rt");

//     if (rt <= 0) {
//       // No time left - show overlay
//       if (!await FlutterOverlayWindow.isActive()) {
//         await FlutterOverlayWindow.showOverlay(
//           height: WindowSize.matchParent,
//           width: WindowSize.matchParent,
//           enableDrag: false,
//           overlayTitle: "Blocked",
//           overlayContent: "Instagram Blocked",
//           flag: OverlayFlag.defaultFlag,
//           visibility: NotificationVisibility.visibilityPublic,
//         );
//       }
//       return;
//     }
//     print("onOpeningInstagram function call end - in blocking.dart");
//   } on Exception catch (e) {
//     print("Error in onOpeningInstagram: $e");
//   }
// }

Future<void> onOpeningInstagram() async {
  try {
    final rt = await rewardtimeBlockingService.getRewardTimeUser();
    print("got reward time");
    if (rt <= 0) {
      if (!await FlutterOverlayWindow.isActive()) {
        await FlutterOverlayWindow.showOverlay(
          height: WindowSize.matchParent,
          width: WindowSize.matchParent,
          enableDrag: false,
          overlayTitle: "Blocked",
          overlayContent: "Instagram Blocked",
          flag: OverlayFlag.defaultFlag,
          visibility: NotificationVisibility.visibilityPublic,
        );
      }
      return;
    }
  } on Exception catch (e) {
    print("Error in onOpeningInstagram: $e");
  }
}
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
//         await rewardtimeBlockingService.setRewardTimeUser(0);
//         if (!await FlutterOverlayWindow.isActive()) {
//           await FlutterOverlayWindow.showOverlay(
//             height: WindowSize.matchParent,
//             width: WindowSize.matchParent,
//             enableDrag: false,
//             overlayTitle: "Blocked",
//             overlayContent: "Instagram Blocked",
//             flag: OverlayFlag.defaultFlag,
//             visibility: NotificationVisibility.visibilityPublic,
//           );
//         } else {
//           print("instagram is not block, setting is opened");
//         }
//       } else {
//         await rewardtimeBlockingService.setRewardTimeUser(rtUpdated);
//       }
//     }
//   } on Exception catch (e) {
//     print(e);
//   }
// }
