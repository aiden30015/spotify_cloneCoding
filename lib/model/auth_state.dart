class AuthState {
  final String? accessToken;
  final String? refreshToken;
  final bool isLoggedIn;

  const AuthState({
    this.accessToken,
    this.refreshToken,
    this.isLoggedIn = false,
  });

  AuthState copyWith({
    String? accessToken,
    String? refreshToken,
    bool? isLoggedIn,
  }) {
    return AuthState(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}