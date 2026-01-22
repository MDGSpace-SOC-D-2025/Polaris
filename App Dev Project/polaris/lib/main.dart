import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:polaris/instagram/blocking.dart';
import 'package:polaris/pages/login.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'dart:async';

import 'package:polaris/pages/signup.dart';

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Text(
          "INSTAGRAM BLOCKED",
          style: TextStyle(
            fontFamily: "AverialLibre",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF292B3A),
          ),
        ),
      ),
    ),
  );
}

String? lastApp;
Timer? debounceTimer;
DateTime? instagramStartTime;

void startMonitoring() {
  FlutterAccessibilityService.accessStream.listen((event) async {
    print("Detected app ${event.packageName}");

    debounceTimer?.cancel();

    debounceTimer = Timer(Duration(milliseconds: 800), () async {
      if (event.packageName != null) {
        await handleAppChange(event.packageName!);
      }
    });
  });
}

Future<void> handleAppChange(String packageName) async {
  if (lastApp == packageName) return;

  print("App changed from $lastApp to $packageName");

  if (packageName == "com.instagram.android" &&
      lastApp != "com.instagram.android") {
    instagramStartTime = DateTime.now();
    print("Instagram session STARTED at $instagramStartTime");
    await onOpeningInstagram();
  }

  if (packageName != "com.instagram.android" &&
      lastApp == "com.instagram.android") {
    if (instagramStartTime != null) {
      int durationMin = DateTime.now()
          .difference(instagramStartTime!)
          .inMinutes;

      print("Instagram session ended. Duration: $durationMin minutes");

      final rt = await rewardtimeBlockingService.getRewardTimeUser();
      int newRt = rt - durationMin;
      await rewardtimeBlockingService.setRewardTimeUser(newRt);

      print("Was: $rt, Now: $newRt");

      if (newRt <= 0) {
        await rewardtimeBlockingService.setRewardTimeUser(0);
        if (!await FlutterOverlayWindow.isActive()) {
          await FlutterOverlayWindow.showOverlay(
            height: WindowSize.fullCover,
            width: WindowSize.matchParent,
            enableDrag: false,
            overlayTitle: "Blocked",
            overlayContent: "Instagram Blocked",
            flag: OverlayFlag.defaultFlag,
            visibility: NotificationVisibility.visibilityPublic,
          );
        }
      }
      instagramStartTime = null;
    }

    if (await FlutterOverlayWindow.isActive()) {
      await FlutterOverlayWindow.closeOverlay();
    }
  }

  lastApp = packageName;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await takingPermission();

  startMonitoring();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "AverialLibre",
        primarySwatch: Colors.blueGrey,
      ),
      home: SignUp(),
    );
  }
}
