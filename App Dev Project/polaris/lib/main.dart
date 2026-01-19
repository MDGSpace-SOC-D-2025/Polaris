import 'package:flutter/material.dart';
import 'package:polaris/instagram/blocking.dart';
import 'package:polaris/pages/login.dart';
import 'package:polaris/pages/signup.dart';
import 'package:polaris/pages/task_home.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';

void startMonitoring() {
  FlutterAccessibilityService.accessStream.listen((event) async {
    print("Detected app ${event.packageName}");
    // Check if the foreground app is Instagram
    if (event.packageName == "com.instagram.android") {
      print("Detected INSTAGRAM app ${event.packageName}");
      print("onOpeningInstagram is called start");
      await onOpeningInstagram();
      print("onOpeningInstagram was called.");
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeBlockApp();

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

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "AverialLibre",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF141C2F)),
      ),
      home: Login(),
    );
  }
}
