import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' hide Options;
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:spotify_clone/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final _dio = Dio();
  final _storage = FlutterSecureStorage();
  final clientId = dotenv.env['SPOTIFY_CLIENT_ID']!;
  final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET']!;
  final redirectUri = dotenv.env['REDIRECT_URI']!;

  @override
  Future<Map<String, dynamic>?> login() async {
    final scopes = [
      'user-read-email',
      'user-read-private',
      'user-library-read',
      'user-library-modify',
      'user-read-playback-state',
      'user-modify-playback-state',
      'user-read-currently-playing',
      'playlist-read-private',
      'playlist-read-collaborative',
      'playlist-modify-public',
      'playlist-modify-private',
      'user-follow-read',
      'user-follow-modify',
      'streaming',
      'app-remote-control',
      'user-read-recently-played',
      'user-top-read',
      'user-read-playback-position',
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
      final data = response.data;

      await _storage.write(key: 'accessToken', value: data['access_token']);
      await _storage.write(key: 'refreshToken', value: data['refresh_token']);
      
      print(data);
      return data;
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }

  @override
  Future<Map<String, String?>> loadSavedTokens() async {
    final accessToken = await _storage.read(key: 'accessToken');
    final refreshToken = await _storage.read(key: 'refreshToken');
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
  }
}