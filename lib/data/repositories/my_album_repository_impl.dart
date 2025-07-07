import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spotify_clone/data/models/get_album_response.dart';
import 'package:spotify_clone/domain/entities/my_album.dart';
import 'package:spotify_clone/domain/repositories/my_album_repository.dart';

class MyAlbumRepositoryImpl implements MyAlbumRepository {
  final dio.Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  MyAlbumRepositoryImpl(this._dio);

  @override
  Future<List<MyAlbum>> getMyAlbum() async {
    try {
      print('[Repository] getMyAlbum() API 호출');
      final accessToken = await _storage.read(key: 'accessToken');
      if (accessToken == null) {
        print('[Repository] accessToken이 없습니다.');
        return [];
      }
      final response = await _dio.get(
        'https://api.spotify.com/v1/me/albums',
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
        queryParameters: {
          'limit': 20,
          'offset': 0,
        },
      );
      print('[Repository] API 응답: ${response.data}');
      final albumResponse = GetAlbumResponse.fromJson(response.data);
      final entities = albumResponse.toEntities();
      print('[Repository] 변환된 엔티티 개수: ${entities.length}');
      return entities;
    } catch (e) {
      print('[Repository] getMyAlbum() 에러: $e');
      return [];
    }
  }
} 