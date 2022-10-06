import 'package:flutter/material.dart';
import 'package:my_todo_app/presentation/splash/splash_screen.dart';
import 'package:my_todo_app/router/router.dart';
import 'package:my_todo_app/routes_with_screens/const/constanties.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
                                         // home: const SplashScreen(),
      initialRoute: firstRoute,
       onGenerateRoute: RouteGenerator.router.onGenerate,
                                          // onGenerateRoute: MyRouts.generateRoute,
    );
  }
}