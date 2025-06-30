import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/component/auth_button.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/routes/go_route.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.splash);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset('assets/svg/spotify_logo.svg',
              width: 70,
              height: 70,
              fit: BoxFit.contain,
              ),
              SizedBox(height: 20,),
              Text(
                '가입하고 원하는\n콘텐츠를 감상하세요', 
                style:TextStyle(
                  fontSize: 36, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              AuthButton(
                text: '이메일로 계속하기',
                onTap: () {},
                signup: true,
                icon: SvgPicture.asset('assets/svg/mail.svg',
                ),
              ),
              const SizedBox(height: 10),
              AuthButton(
                text: 'Google로 계속하기',
                onTap: () {},
                signup: false,
                icon: SvgPicture.asset('assets/svg/google_logo.svg'),
              ),
              SizedBox(height: 40,),
              Text(
                "이미 계정이 있나요?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                ),
              TextButton(
                onPressed: () {}, 
                child: Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}