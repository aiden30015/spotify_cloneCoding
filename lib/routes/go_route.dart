import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/app.dart';
import 'package:spotify_clone/presentations/login/screens/login_screen.dart';
import 'package:spotify_clone/presentations/signup/screens/signup_screen.dart';

// 라우트 이름 상수
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String search = '/search';
  static const String library = '/library';
  static const String profile = '/profile';
  static const String playlist = '/playlist';
  static const String artist = '/artist';
  static const String album = '/album';
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
    
    
    // 회원가입 화면
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
  ],
);