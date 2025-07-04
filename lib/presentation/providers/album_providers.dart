import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/data/repositories/my_album_repository_impl.dart';
import 'package:spotify_clone/domain/entities/my_album.dart';
import 'package:spotify_clone/domain/repositories/my_album_repository.dart';
import 'package:spotify_clone/domain/usecases/get_my_albums_usecase.dart';

// Dio Provider
final dioProvider = Provider<Dio>((ref) => Dio());

// Repository Provider
final myAlbumRepositoryProvider = Provider<MyAlbumRepository>(
  (ref) => MyAlbumRepositoryImpl(ref.read(dioProvider)),
);

// UseCase Provider
final getMyAlbumsUseCaseProvider = Provider<GetMyAlbumsUseCase>(
  (ref) => GetMyAlbumsUseCase(ref.read(myAlbumRepositoryProvider)),
);

// Album State
class AlbumState {
  final List<MyAlbum> albums;
  final bool isLoading;
  final String? error;

  AlbumState({
    this.albums = const [],
    this.isLoading = false,
    this.error,
  });

  AlbumState copyWith({
    List<MyAlbum>? albums,
    bool? isLoading,
    String? error,
  }) {
    return AlbumState(
      albums: albums ?? this.albums,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Album ViewModel
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

// Album ViewModel Provider
final albumViewModelProvider = StateNotifierProvider<AlbumViewModel, AlbumState>(
  (ref) => AlbumViewModel(ref.read(getMyAlbumsUseCaseProvider)),
); 