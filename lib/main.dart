import 'package:cohortly/pages/signin.dart';
import 'package:cohortly/pages/signup.dart';
import 'package:cohortly/pages/chatpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cohortly/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:cohortly/pages/signin.dart';
import 'package:cohortly/pages/signup.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ), //Theme Data
      home: SignUp()
    ); //MaterialApp
  }
}



Future<void> initialization(BuildContext? context) async{
  await Future.delayed(Duration(seconds: 3));
}
