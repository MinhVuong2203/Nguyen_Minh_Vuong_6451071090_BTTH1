import 'package:flutter/material.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/screens/check_your_email_screen.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/screens/forgot_password_screen.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/screens/login_screen.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/screens/profile_screen.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/screens/signup_screen.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/screens/splash_screen.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/screens/succesful_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreens());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/check-email':
        return MaterialPageRoute(builder: (_) => const CheckYourEmailScreen());
      case '/successful':
        return MaterialPageRoute(builder: (_) => const SuccesfulScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Khong tim thay trang'),
            ),
          ),
        );
    }
  }
}
