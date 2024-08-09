import 'package:flutter/material.dart';
import 'package:id_295/router_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routerController = RouterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerController.router,
    );
  }
}
