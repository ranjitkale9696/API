import 'package:api/HomeScreen.dart';
import 'package:api/example_five.dart';
import 'package:api/example_four.dart';
import 'package:api/example_three.dart';
import 'package:api/example_two.dart';
import 'package:api/signup.dart';
import 'package:api/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UploadImageScreen(),
      // home: const SignUpScreen(),
      // home: const ExampleFive(),
      // home: const ExampleFour(),
      // home: const ExampleThree(),
      // home: const ExampleTwo(),
      // home: const Homescreen(),
    );
  }
}

