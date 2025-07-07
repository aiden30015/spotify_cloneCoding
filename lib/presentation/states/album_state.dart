import 'package:spotify_clone/domain/entities/my_album.dart';

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