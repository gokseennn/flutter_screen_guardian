import 'package:flutter/material.dart';
import 'package:flutter_hiddin_screen/app_lifecycle_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
      initialBinding: BindingsBuilder(() {
        Get.put(AppLifecycleController());
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX App Lifecycle Demo'),
      ),
      body: const Center(
        child: Text('Your app content here'),
      ),
    );
  }
}
