import 'package:flutter/material.dart';
import 'package:my_todo_app/routes_with_screens/const/constanties.dart';
class Third extends StatelessWidget {
   Third({Key? key, required this.text}) : super(key: key);
   final String text;
   TextEditingController textController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Third Screen"),
      ),
      body: Column(
        children: [
          Text(text.toString(), style: TextStyle(fontSize: 25, color: Colors.pink), ),

         const SizedBox(height: 100,),
          Center(
            child: Column(
              children: [
                TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Enter age",
                  ),
                ),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, fourth, arguments: int.parse(textController.text));
                },
                  child: const Text("Enter age"),),

              ],
            ),
          )
        ],
      ),
    );
  }
}









