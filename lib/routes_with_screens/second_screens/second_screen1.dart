import 'package:flutter/material.dart';

class SecondScreen1 extends StatefulWidget {
  const SecondScreen1({Key? key}) : super(key: key);

  @override
  State<SecondScreen1> createState() => _SecondScreen1State();
}

class _SecondScreen1State extends State<SecondScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second 01"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _header(),
            _body(),
            _footer()
          ],
        ),
      ),
    );
  }
  Column _header(){
    return Column(
      children: [
        Container(
          width: 300,
          height: 100,
          color: Colors.green,
        ),
        Text("TExt--------"),

      ],
    );

  }
  Column _body (){
    return Column(
      children: [
        Container(
          width: 300,
          height: 100,
          color: Colors.red,
        ),
        Text("TExt--------"),
        Container(
          width: 300,
          height: 100,
          color: Colors.pink,
        ),
        Text("TExt--------"),





      ],
    );

  }
  Column _footer(){
    return Column(
      children: [
        Container(
          width: 300,
          height: 100,
          color: Colors.black,
        ),
        Text("TExt--------"),
        Container(
          width: 300,
          height: 100,
          color: Colors.black,
        ),


      ],
    );
  }

}
