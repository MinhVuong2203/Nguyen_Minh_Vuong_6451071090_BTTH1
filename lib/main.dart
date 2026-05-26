import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/app/apps.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  debugPrint('Firebase connected');
  debugPrint('Project ID: ${app.options.projectId}');
  debugPrint('App ID: ${app.options.appId}');
  runApp(MyApp());
}

