import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/shared/auth_button.dart';
import 'package:spotify_clone/presentation/viewmodels/login_view_model.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authVM = ref.read(authViewModelProvider.notifier);

    // 로그인 성공 시 홈 화면으로 이동
    if (authState.isLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/home');
      });
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[900]!,
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                const Spacer(),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SvgPicture.asset('assets/svg/spotify_logo.svg'),
                ),
                const SizedBox(height: 20),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '수백만 곡을 들을 수 있습니다.\nSpotify에서 무료로 제공합니다.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                AuthButton(text: '로그인', 
                onTap: () async => await authVM.login(),
                signup: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}