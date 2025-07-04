import 'package:dio/dio.dart';
import 'package:spotify_clone/data/models/get_album_response.dart';
import 'package:spotify_clone/domain/entities/my_album.dart';
import 'package:spotify_clone/domain/repositories/my_album_repository.dart';

class MyAlbumRepositoryImpl implements MyAlbumRepository {
  final Dio _dio;

  MyAlbumRepositoryImpl(this._dio);

  @override
  Future<List<MyAlbum>> getMyAlbum() async {
    try {
      // Spotify API 호출
      final response = await _dio.get(
        'https://api.spotify.com/v1/me/albums',
        queryParameters: {
          'limit': 20,
          'offset': 0,
        },
      );

      // JSON 응답을 Data 모델로 파싱
      final albumResponse = GetAlbumResponse.fromJson(response.data);
      
      // Data 모델을 Domain 엔티티로 변환
      return albumResponse.toEntities();
    } catch (e) {
      print('Error fetching albums: $e');
      return [];
    }
  }
} 