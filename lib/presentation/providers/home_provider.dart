import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/data/repositories/my_album_repository_impl.dart';
import 'package:spotify_clone/domain/repositories/my_album_repository.dart';
import 'package:spotify_clone/domain/usecases/get_my_albums_usecase.dart';
import 'package:spotify_clone/presentation/viewmodels/home_view_model.dart';
import 'package:spotify_clone/presentation/states/album_state.dart';

final selectedTopButtonProvider = StateProvider<int>((ref) => 0);

final dioProvider = Provider<Dio>((ref) => Dio());

// Repository Provider
final myAlbumRepositoryProvider = Provider<MyAlbumRepository>(
  (ref) => MyAlbumRepositoryImpl(ref.read(dioProvider)),
);

// UseCase Provider
final getMyAlbumsUseCaseProvider = Provider<GetMyAlbumsUseCase>(
  (ref) => GetMyAlbumsUseCase(ref.read(myAlbumRepositoryProvider)),
);

// Album ViewModel Provider
final albumViewModelProvider = StateNotifierProvider<AlbumViewModel, AlbumState>(
  (ref) => AlbumViewModel(ref.read(getMyAlbumsUseCaseProvider)),
);
