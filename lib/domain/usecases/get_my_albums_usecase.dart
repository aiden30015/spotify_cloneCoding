import 'package:spotify_clone/domain/entities/my_album.dart';
import 'package:spotify_clone/domain/repositories/my_album_repository.dart';

class GetMyAlbumsUseCase {
  final MyAlbumRepository _repository;

  GetMyAlbumsUseCase(this._repository);

  Future<List<MyAlbum>> execute() async {
    return await _repository.getMyAlbum();
  }
} 