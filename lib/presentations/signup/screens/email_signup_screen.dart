import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../routers.dart';

class EmailSignupScreen extends HookConsumerWidget {
  const EmailSignupScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final errorText = useState<String?>(null);
    final helperText = '나중에 이 이메일 주소를 확인해야 합니다.';
    final focusNode = useFocusNode();
    final isFocused = useState(false);
    final submitted = useState(false);

    useEffect(() {
      void listener() => isFocused.value = focusNode.hasFocus;
      focusNode.addListener(listener);
      return () => focusNode.removeListener(listener);
    }, [focusNode]);

    String? validateEmail(String value) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (value.isEmpty) {
        return '이메일 주소를 반드시 입력하세요.';
      } else if (!emailRegex.hasMatch(value)) {
        return '올바른 이메일 형식이 아닙니다.';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('계정 생성', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.signup);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '이메일 주소가 무엇인가요?',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              TextField(
                focusNode: focusNode,
                controller: emailController,
                cursorColor: Colors.white,
                cursorErrorColor: Colors.white,
                style: TextStyle(
                  color: errorText.value == null ? Colors.white : Colors.red,
                ),
                onChanged: (value) {
                  if (submitted.value) {
                    errorText.value = validateEmail(value);
                  }
                },
                onSubmitted: (value) {
                  submitted.value = true;
                  errorText.value = validateEmail(value);
                },
                decoration: InputDecoration(
                  fillColor: errorText.value == null ? (isFocused.value ? Colors.grey[700] : Colors.grey[800]) : Colors.white,
                  filled: true,
                  helperText: helperText,
                  helperStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  errorText: errorText.value,
                  errorMaxLines: 99,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}