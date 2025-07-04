import 'package:spotify_clone/domain/entities/my_album.dart';

abstract class MyAlbumRepository {
  Future<List<MyAlbum>> getMyAlbum();
}