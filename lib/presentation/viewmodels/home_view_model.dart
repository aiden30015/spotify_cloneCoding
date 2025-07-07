import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/domain/usecases/get_my_albums_usecase.dart';
import 'package:spotify_clone/presentation/states/album_state.dart';

class AlbumViewModel extends StateNotifier<AlbumState> {
  final GetMyAlbumsUseCase _getMyAlbumsUseCase;

  AlbumViewModel(this._getMyAlbumsUseCase) : super(AlbumState());

  Future<void> loadAlbums() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final albums = await _getMyAlbumsUseCase.execute();
      state = state.copyWith(albums: albums, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}