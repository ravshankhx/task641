import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task641/pages/home_page.dart';
import 'package:task641/pages/sign_up.dart';

void main()async {
  await Hive.initFlutter();
  await Hive.openBox('task_1');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context)=>HomePage(),
        SignUp.id: (context)=>SignUp(),
      },
    );
  }
}