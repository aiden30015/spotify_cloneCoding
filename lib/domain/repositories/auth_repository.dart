abstract class AuthRepository {
  Future<Map<String, dynamic>?> login();

  Future<Map<String, String?>> loadSavedTokens();

  Future<void> clearTokens(); 
}