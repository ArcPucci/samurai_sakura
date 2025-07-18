import 'package:go_router/go_router.dart';
import 'package:id_295/screens/game_screen.dart';
import 'package:id_295/screens/xia_screen.dart';
import 'screens/screens.dart';


class RouterController {
  late final GoRouter router;

  void onInit(bool firstInit) {
    final path = firstInit ? '/continue' : '/';

    router = GoRouter(
      initialLocation: path,
      routes: [
        GoRoute(
          path: '/continue',
          builder: (context, state) => const ContinueScreen(),
        ),
        GoRoute(
            path: '/',
            builder: (context, state) => const MainScreen(),
            routes: [
              GoRoute(
                path: 'game',
                builder: (context, state) => const GameScreen(),
              ),
              GoRoute(
                path: 'setting',
                builder: (context, state) => const SettingScreen(),
              ),
              GoRoute(
                path: 'xia',
                builder: (context, state) => const XiaScreen(),
              ),
            ]
        ),
      ],
    );
  }
}
