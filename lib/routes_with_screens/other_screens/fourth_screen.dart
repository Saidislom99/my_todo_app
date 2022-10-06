import 'package:flutter/material.dart';
class Fourth extends StatelessWidget {
  const Fourth({Key? key, required this.data}) : super(key: key);
  final int data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fourth screen"),),
      body: Column(
        children: [
      Text(data.toString())
        ],
      ),
    );
  }
}
