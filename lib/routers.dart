import 'package:go_router/go_router.dart';
import 'package:spotify_clone/app.dart';

// 라우트 이름 상수
class AppRoutes {
  static const String splash = '/';
  static const String signup = '/signup';
  static const String emailSignup = '/emailSignup';
  static const String login = '/login';
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
  
  ],
);