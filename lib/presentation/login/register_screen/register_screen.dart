import 'package:flutter/material.dart';
import 'package:my_todo_app/data/local_data/storage.dart';
import 'package:my_todo_app/presentation/login/login_screen/login_screen.dart';
import 'package:my_todo_app/utils/colors.dart';
import 'package:my_todo_app/utils/utility_functions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();

    usernameController.dispose();
    passwordController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0.0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_sharp, color: MyColors.black,size: 26,),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return LoginScreen();
                }));
          },
        ),

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
              onSubmitted: (v) {
                UtilityFunctions.fieldFocusChange(
                    context, focusNode1, focusNode2);
              },
              focusNode: focusNode1,
              controller: usernameController,
            ),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
              onSubmitted: (v) {
                UtilityFunctions.fieldFocusChange(
                    context, focusNode2, focusNode3);
              },
              focusNode: focusNode2,
              controller: passwordController,
            ),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
              onSubmitted: (v) {
                focusNode3.unfocus();
              },
              focusNode: focusNode3,
              controller: ageController,
            ),),
            const SizedBox(height: 15,),
            Container(
              width: 120,
              height: 50,
              color: MyColors.C_E5E5E5,
              child: TextButton(
                  onPressed: () async {
                    if (usernameController.text.trim().length > 3 &&
                        passwordController.text.trim().length > 6 &&
                        ageController.text.isNotEmpty) {
                      await StorageRepository.putString(
                          key: "username", value: usernameController.text);
                      await StorageRepository.putString(
                          key: "password", value: passwordController.text);
                      await StorageRepository.putString(
                          key: "age", value: ageController.text);
                    }
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return LoginScreen();
                        }));
                  },
                  child:const Text("Register User", style: TextStyle(fontSize: 16),)),
            )
          ],
        ),
      ),
    );
  }
}