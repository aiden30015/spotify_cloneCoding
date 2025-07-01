import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class AuthRepository {
  final _dio = Dio();
  final clientId = '054ebc7e0be84e8fa2d83d2a3269aaa5';
  final clientSecret = '234bb9ff121e474ebbd0740f7b099236';
  final redirectUri = 'spotify-clone://callback';

  Future<Map<String, dynamic>?> login() async {
    final scopes = [
      'user-read-email',
      'user-read-private',
    ];

    final authUrl =
        'https://accounts.spotify.com/authorize'
        '?response_type=code'
        '&client_id=$clientId'
        '&redirect_uri=$redirectUri'
        '&scope=${scopes.join('%20')}';

    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl,
        callbackUrlScheme: 'spotify-clone',
      );

      final code = Uri.parse(result).queryParameters['code'];

      final response = await _dio.post(
        'https://accounts.spotify.com/api/token',
        options: Options(
          headers: {
            'Authorization': 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'grant_type': 'authorization_code',
          'code': code,
          'redirect_uri': redirectUri,
        },
      );

      return response.data;
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }
}