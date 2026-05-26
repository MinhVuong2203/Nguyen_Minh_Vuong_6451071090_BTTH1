import 'package:firebase_auth/firebase_auth.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/data/models/app_user_model.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({AuthService? authService})
      : _authService = authService ?? AuthService();

  Stream<AppUserModel?> get authStateChanges {
    return _authService.authStateChanges.map((user) {
      if (user == null) return null;
      return AppUserModel.fromFirebaseUser(user);
    });
  }

  AppUserModel? get currentUser {
    final user = _authService.currentUser;
    if (user == null) return null;
    return AppUserModel.fromFirebaseUser(user);
  }

  Future<AppUserModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await _authService.signInWithEmail(
      email: email,
      password: password,
    );
    return _mapCredentialToUser(credential);
  }

  Future<AppUserModel> registerWithEmail({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final credential = await _authService.registerWithEmail(
      fullName: fullName,
      email: email,
      password: password,
    );
    return _mapCredentialToUser(credential);
  }

  Future<AppUserModel> loginWithGoogle() async {
    final credential = await _authService.signInWithGoogle();
    return _mapCredentialToUser(credential);
  }

  Future<void> resetPassword(String email) {
    return _authService.sendPasswordResetEmail(email);
  }

  Future<void> logout() {
    return _authService.signOut();
  }

  AppUserModel _mapCredentialToUser(UserCredential credential) {
    final user = _authService.currentUser ?? credential.user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'Khong tim thay thong tin nguoi dung.',
      );
    }
    return AppUserModel.fromFirebaseUser(user);
  }
}
