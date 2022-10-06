import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_todo_app/data/local_data/storage.dart';
import 'package:my_todo_app/presentation/login/login_screen/login_screen.dart';
import 'package:my_todo_app/presentation/on_boarding/page/on_boarding_page_one.dart';
import 'package:my_todo_app/presentation/on_boarding/page/on_boarding_page_three.dart';
import 'package:my_todo_app/presentation/on_boarding/page/on_boarding_page_two.dart';
import 'package:my_todo_app/utils/colors.dart';
import 'package:my_todo_app/utils/styles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPageIndex = 0;
  String buttonText = "Next";
  PageController controller = PageController(initialPage: 0);
  List<Widget> screens = [
    OnBoardingOne(),
    OnBoardingTwo(),
    OnBoardingThree()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0.0,

      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const SizedBox(),
          //     GestureDetector(
          //         onTap: () async {
          //           await StorageRepository.putBool("is_initial", true);
          //           Navigator.pushReplacement(context,
          //               MaterialPageRoute(builder: (BuildContext c) {
          //                 return LoginScreen();
          //               }));
          //         },
          //         child: Text("Skip"))
          //   ],
          // ),
          Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (pageIndex) {
                  print(pageIndex);
                },
                controller: controller,
                children: screens,
              )),
         const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                color: currentPageIndex == 0 ? Colors.blueAccent : Colors.grey,
                width: currentPageIndex == 0 ? 20 : 10,
              ),
              const SizedBox(width: 5),
              Container(
                height: 10,
                color: currentPageIndex == 1 ? Colors.blueAccent : Colors.grey,
                width: currentPageIndex == 1 ? 20 : 10,
              ),
              const SizedBox(width: 5),
              Container(
                height: 10,
                color: currentPageIndex == 2 ? Colors.blueAccent : Colors.grey,
                width: currentPageIndex == 2 ? 20 : 10,
              )
            ],
          ),
         const SizedBox(height: 10,),
          Container(
            height: 50,
            width: 100,
            color: MyColors.C_E5E5E5,
            child: TextButton(
                onPressed: () async {
                  if (currentPageIndex < 2) {
                    setState(() {
                      currentPageIndex++;
                      controller.jumpToPage(currentPageIndex);
                    });
                  } else {
                    await StorageRepository.putBool("is_initial", true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext c) {
                          return LoginScreen();
                        }));
                  }
                  if (currentPageIndex == 2) {
                    setState(() {
                      buttonText = "Let's start";
                    });
                  }
                },
                child: SizedBox(
                  height: 55,
                  child: Center(
                    child: Text(buttonText, style: TextStyle(fontSize: 16)),
                  ),
                )),
          ),
         const SizedBox(height: 10,)
        ],
      ),
    );
  }
}