import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/data/repositories/auth_repository.dart';
import 'package:spotify_clone/data/models/auth_state.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(ref.read(authRepositoryProvider));
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository) : super(const AuthState()) {
    _loadSavedTokens();
  }

  Future<void> _loadSavedTokens() async {
    final tokens = await _authRepository.loadSavedTokens();
    if (tokens['accessToken'] != null) {
      state = state.copyWith(
        accessToken: tokens['accessToken'],
        refreshToken: tokens['refreshToken'],
        isLoggedIn: true,
      );
    }
  }

  Future<void> login() async {
    final tokenData = await _authRepository.login();
    if (tokenData != null) {
      state = state.copyWith(
        accessToken: tokenData['access_token'],
        refreshToken: tokenData['refresh_token'],
        isLoggedIn: true,
      );
    }
  }

  void logout() async{
    await _authRepository.clearTokens(); 
    state = const AuthState();
  }
}