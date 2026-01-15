import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polaris/integration/rewardtime_integrate.dart';
import 'package:usage_stats/usage_stats.dart';
import 'package:block_app/block_app.dart';

final RewardTimeService rewardtimeService = RewardTimeService();
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
  await UsageStats.grantUsagePermission();
  await Permission.systemAlertWindow.request();
  if (await Permission.systemAlertWindow.isDenied) {
    await openAppSettings();
  }
}

Future<void> onOpeningInstagram() async {
  if (rewardtimeService.getRewardTimeUser() == 0) {
    if (await Permission.systemAlertWindow.isGranted) {
      await blockApp.blockApp('com.instagram.android');
    } else {
      await openAppSettings();
    }
  }
}
