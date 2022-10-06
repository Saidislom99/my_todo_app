import 'package:flutter/material.dart';
import 'package:my_todo_app/data/local_data/storage.dart';
import 'package:my_todo_app/utils/colors.dart';
import 'package:my_todo_app/utils/utility_functions.dart';

import '../../tabs/tab_box/tab_box.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String savedUsername = '';
  String savedPassword = '';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode focusNode1=FocusNode();
  final FocusNode focusNode2=FocusNode();

  @override
  void initState() {
    getInitials();
    super.initState();
  }

  void getInitials() {
    savedPassword = StorageRepository.getString("password");
    print("savedPasword:$savedPassword");
    savedUsername = StorageRepository.getString("username");
    print("savedUsername:$savedUsername");
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(padding: EdgeInsets.symmetric(horizontal: 20),
           child:  TextField(
            onSubmitted: (value){
             UtilityFunctions.fieldFocusChange(context, focusNode1, focusNode2);
            },
             decoration: InputDecoration(
                 hintText: "Username",
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(16)
                 )
             ),
             controller: usernameController,
             focusNode: focusNode1,
           ),),
           const SizedBox(height: 18,),
           Padding(padding: EdgeInsets.symmetric(horizontal: 20),
           child:  TextField(
             onSubmitted: (value){
               focusNode2.unfocus();
             },
             obscureText: true,
             decoration: InputDecoration(
                 hintText: "Password",
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(16)
                 )
             ),
             controller: passwordController,
           ),),
            const SizedBox(height: 10,),
            Container(
              width: 100,
              height: 50,
              color: MyColors.C_E5E5E5,
              child: TextButton(
                onPressed: () async {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  if (username.length > 3 && password.length > 6) {
                    if (username == savedUsername && password == savedPassword) {
                      await StorageRepository.putBool("is_logged", true);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return TabBox();
                          }));
                    } else {
                      UtilityFunctions.getMyToast(
                        message: "Login password wrong\nRegister first",
                      );
                    }
                  } else {
                    UtilityFunctions.getMyToast(
                        message: "Login va parol xato kiritilgan");
                  }
                },
                child: Text("Login", style: TextStyle(fontSize: 16),),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: 120,
              height: 50,
              color: MyColors.C_E5E5E5,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const RegisterScreen();
                        }));
                  },
                  child: Text("Create account", style: TextStyle(fontSize: 16),)),
            )
          ],
        ),
      ),
    );
  }
}