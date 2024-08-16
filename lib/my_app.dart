import 'package:flutter/material.dart';
import 'package:id_295/main.dart';
import 'package:id_295/providers/providers.dart';
import 'package:id_295/router_controller.dart';
import 'package:id_295/services/services.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.preferencesService,
  });

  final PreferencesService preferencesService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final RouterController routerController;

  @override
  void initState() {
    super.initState();

    final firstInit = widget.preferencesService.getFirstInit();

    routerController = RouterController();
    routerController.onInit(firstInit);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      topPadding = MediaQuery.of(context).padding.top;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: widget.preferencesService),
        ChangeNotifierProvider(
          create: (context) => PreferencesProvider(
            preferencesService: widget.preferencesService,
          )..onInit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: routerController.router,
      ),
    );
  }
}
