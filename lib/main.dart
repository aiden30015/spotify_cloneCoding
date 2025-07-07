import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/app.dart';
import 'package:spotify_clone/presentation/pages/home_screen.dart';
import 'package:spotify_clone/data/repositories/auth_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  
  // 토큰 유효성 검증
  const storage = FlutterSecureStorage();
  final accessToken = await storage.read(key: 'accessToken');
  
  bool isValid = false;
  if (accessToken != null) {
    // 토큰이 있으면 유효성 검증
    final authRepo = AuthRepositoryImpl();
    isValid = await authRepo.isTokenValid();
    print('Token validation result: $isValid');
  }
  
  runApp(MyApp(initialToken: isValid ? accessToken : null));
}

class MyApp extends StatelessWidget {
  final String? initialToken;
  
  const MyApp({super.key, this.initialToken});

  @override
  Widget build(BuildContext context) {
    // 토큰에 따라 초기 라우트 결정
    final router = GoRouter(
      initialLocation: initialToken != null ? '/home' : '/',
      routes: [
        // 스플래시 화면
        GoRoute(
          path: '/',
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),
        // 홈 화면
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => HomeScreen(),
        ),
      ],
    );

    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Gotham-Bold'
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}