import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/icons.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(MyIcons.splash,),
        SizedBox(height: 70,),
        Text("WERTYU")

      ],
    );
  }
}
