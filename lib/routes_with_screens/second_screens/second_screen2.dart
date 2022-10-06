import 'package:flutter/material.dart';
import 'package:my_todo_app/routes_with_screens/const/constanties.dart';

class SecondScreen2 extends StatefulWidget {
   SecondScreen2({Key? key}) : super(key: key);

  @override
  State<SecondScreen2> createState() => _SecondScreen2State();
}

class _SecondScreen2State extends State<SecondScreen2> {
  TextEditingController text= TextEditingController();


  @override
  void dispose() {
    text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second 02"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              controller: text,
              decoration: InputDecoration(
                hintText: "Enter text",
              ),
            ),
          ),

          TextButton(onPressed: (){
           Navigator.pushNamed(context, third, arguments:text.text);
           text.clear();
          },child:const Text("Third screen") ,),
        ],
      ),),
    );
  }
}
