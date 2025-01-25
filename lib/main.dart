import 'package:daily_tip/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyAacF0rNpR6THyRYWT6eozLx4JuZ-rYFS8",
        authDomain: "daily-tip-cc293.firebaseapp.com",
        projectId: "daily-tip-cc293",
        storageBucket: "daily-tip-cc293.firebasestorage.app",
        messagingSenderId: "572744265593",
        appId: "1:572744265593:web:5c79e95f20f366323d89a8",
        measurementId: "G-R787ZQPZSF"  ));
  }else {
    Firebase.initializeApp();
  }

  runApp(ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Tip App',
      initialRoute: '/', // Define the initial route
      onGenerateRoute: Routes.getRoutes, // Use the `getRoutes` method
    );
  }
}
