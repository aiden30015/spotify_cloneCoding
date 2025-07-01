import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/data/repository/auth_repository.dart';
import 'package:spotify_clone/model/auth_state.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(ref.read(authRepositoryProvider));
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository) : super(const AuthState());

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

  void logout() {
    state = const AuthState();
  }
}
