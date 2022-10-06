 import 'package:flutter/material.dart';
import 'package:my_todo_app/routes_with_screens/const/constanties.dart';
import 'package:my_todo_app/routes_with_screens/other_screens/third_screen.dart';
import '../routes_with_screens/first_screen.dart';
import '../routes_with_screens/other_screens/fourth_screen.dart';
import '../routes_with_screens/second_screens/second_screen1.dart';
import '../routes_with_screens/second_screens/second_screen2.dart';
import '../routes_with_screens/second_screens/second_screen3.dart';

class RouteGenerator{
  static final RouteGenerator _generator =  RouteGenerator._init();
  static RouteGenerator get router => _generator;
  RouteGenerator._init();

  Route? onGenerate(RouteSettings settings){
    switch(settings.name){
      case firstRoute:
        return navigate(const FirstScreen());
      case second1:
        return navigate(const SecondScreen1());
      case second2:
        return navigate( SecondScreen2());
      case second3:
        return navigate(const SecondScreen3());
      case third:
        var data= settings.arguments as String;
        return navigate( Third(text: data,));
      case fourth:
        var dataAge= settings.arguments as int;
        return navigate( Fourth(data: dataAge,));




      default:
        return navigate(Scaffold(body: Center(child: Text("Default Routs Screen"),),));
    }

  }
  navigate(Widget widget){
    return MaterialPageRoute(builder: (context)=> widget);
  }
}



// ------------------2 -------------


// class MyRouts {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => Home());
//       case 'new':
//         return MaterialPageRoute(builder: (_) => NewPage());
//       default:
//         return MaterialPageRoute(builder: (_) =>
//             Scaffold(
//               body: Center(child: Text("Not fount 404"),),
//             ));
//     }
//   }
// }