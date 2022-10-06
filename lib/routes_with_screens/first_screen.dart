import 'package:flutter/material.dart';
import 'package:my_todo_app/routes_with_screens/const/constanties.dart';
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fist Screen"),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 50,
              color: Colors.black,
              child: TextButton(
                onPressed: (){

                  Navigator.pushNamed(context, second1,);
                },
                child: Text("Second1", style: TextStyle(color: Colors.white),),),
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.black,
              child: TextButton(
                onPressed: (){

                  Navigator.pushNamed(context, second2,);
                },
                child: Text("Second2", style: TextStyle(color: Colors.white),),),
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.black,
              child: TextButton(
                onPressed: (){

                  Navigator.pushNamed(context, second3,);
                },
                child: Text("Second3", style: TextStyle(color: Colors.white),),),
            ),

          ],
        ),
      ),

    );
  }
}
