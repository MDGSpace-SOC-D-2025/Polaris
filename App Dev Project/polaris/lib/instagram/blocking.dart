import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polaris/integration/rewardtime_integrate.dart';
import 'package:usage_stats/usage_stats.dart';

final RewardTimeService rewardtimeBlockingService = RewardTimeService();

Future<void> takingPermission() async {
  if (await UsageStats.checkUsagePermission() == false) {
    await UsageStats.grantUsagePermission();
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

Future<void> onOpeningInstagram() async {
  try {
    final rt = await rewardtimeBlockingService.getRewardTimeUser();
    print("got reward time");
    if (rt <= 0) {
      if (!await FlutterOverlayWindow.isActive()) {
        await FlutterOverlayWindow.showOverlay(
          height: WindowSize.fullCover,
          width: WindowSize.matchParent,
          overlayTitle: "Blocked",
          overlayContent: "Instagram Blocked",
          visibility: NotificationVisibility.visibilityPublic,
        );
      }
      return;
    }
  } on Exception catch (e) {
    print(e);
  }
}
