import 'package:firebase_auth/firebase_auth.dart';

class AppUserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  const AppUserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  factory AppUserModel.fromFirebaseUser(User user) {
    return AppUserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
}
