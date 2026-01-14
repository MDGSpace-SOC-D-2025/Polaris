import 'package:block_app/block_app.dart';
import 'package:flutter/material.dart';

final blockApp = BlockApp();

// Or with custom configuration
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