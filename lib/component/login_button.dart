import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
  final bool signup;
  final SvgPicture? icon;

  const LoginButton({
    super.key, 
    required this.text, 
    required this.onTap, 
    required this.signup,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 337),
        height: 49,
        decoration: BoxDecoration(
          color: signup ? Colors.green : null,
          borderRadius: BorderRadius.circular(45),
          border: signup ? null : Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) 
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 24,
                  child: icon!,
                ),
              ),
            Text(
              text,
              style: TextStyle(
                color: signup ? Colors.black : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}