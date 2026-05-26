import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/data/models/app_user_model.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/data/repositories/auth_repository.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthController({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository() {
    currentUser = _authRepository.currentUser;
  }

  AppUserModel? currentUser;
  bool isLoading = false;
  String? errorMessage;

  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    return _runAuthAction(() async {
      currentUser = await _authRepository.loginWithEmail(
        email: email,
        password: password,
      );
    });
  }

  Future<bool> registerWithEmail({
    required String fullName,
    required String email,
    required String password,
  }) async {
    return _runAuthAction(() async {
      currentUser = await _authRepository.registerWithEmail(
        fullName: fullName,
        email: email,
        password: password,
      );
    });
  }

  Future<bool> loginWithGoogle() async {
    _setLoading(true);
    try {
      currentUser = await _authRepository.loginWithGoogle();
      errorMessage = null;
      return true;
    } on FirebaseAuthException catch (error) {
      errorMessage = _messageFromFirebaseAuth(error);
      return false;
    } catch (error) {
      errorMessage =
          'Không mở được danh sách tài khoản Google. Hãy thêm SHA-1/SHA-256 trong Firebase rồi tải lại google-services.json. Chi tiết: $error';
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> resetPassword(String email) async {
    return _runAuthAction(() async {
      await _authRepository.resetPassword(email);
    });
  }

  Future<void> logout() async {
    await _authRepository.logout();
    currentUser = null;
    notifyListeners();
  }

  Future<bool> _runAuthAction(Future<void> Function() action) async {
    _setLoading(true);
    try {
      await action();
      errorMessage = null;
      return true;
    } on FirebaseAuthException catch (error) {
      errorMessage = _messageFromFirebaseAuth(error);
      return false;
    } catch (_) {
      errorMessage = 'Đã có lỗi xảy ra. Vui lòng thử lại.';
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String _messageFromFirebaseAuth(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'Email không hợp lệ.';
      case 'user-disabled':
        return 'Tài khoản này đã bị vô hiệu hóa.';
      case 'user-not-found':
        return 'Không tìm thấy tài khoản với email này.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Email hoặc mật khẩu không đúng.';
      case 'email-already-in-use':
        return 'Email này đã được đăng ký.';
      case 'weak-password':
        return 'Mật khẩu phải có ít nhất 6 ký tự.';
      case 'network-request-failed':
        return 'Không có kết nối mạng.';
      case 'google-sign-in-not-supported':
        return 'Nền tảng này không hỗ trợ nút đăng nhập Google hiện tại.';
      default:
        return error.message ?? 'Xác thực thất bại. Vui lòng thử lại.';
    }
  }
}
