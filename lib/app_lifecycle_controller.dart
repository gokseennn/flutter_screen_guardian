import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class AppLifecycleController extends GetxController
    with WidgetsBindingObserver {
  static const platform =
      MethodChannel('com.example.flutter_hiddin_screen/screen');
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _hideScreen();
    } else if (state == AppLifecycleState.resumed) {
      _showScreen();
    }
  }

  Future<void> _hideScreen() async {
    try {
      await platform.invokeMethod('hideScreen');
    } on PlatformException catch (e) {
      print("Failed to hide screen: '${e.message}'.");
    }
  }

  Future<void> _showScreen() async {
    try {
      await platform.invokeMethod('showScreen');
    } on PlatformException catch (e) {
      print("Failed to show screen: '${e.message}'.");
    }
  }
}
