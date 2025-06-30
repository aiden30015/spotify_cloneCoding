import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
  final bool signup;
  final Widget? icon;

  const AuthButton({
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
        height: 47,
        decoration: BoxDecoration(
          color: signup ? Colors.green : null,
          borderRadius: BorderRadius.circular(45),
          border: signup ? null : Border.all(color: Colors.white),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (icon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 24,
                    child: icon!,
                  ),
                ),
              ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: signup ? Colors.black : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}