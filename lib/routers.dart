import 'package:go_router/go_router.dart';
import 'package:spotify_clone/app.dart';
import 'package:spotify_clone/presentation/pages/home_screen.dart';

// 라우트 이름 상수
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
}

// 메인 라우터 설정
final router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    // 스플래시 화면
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    // 홈 화ㄴ
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);