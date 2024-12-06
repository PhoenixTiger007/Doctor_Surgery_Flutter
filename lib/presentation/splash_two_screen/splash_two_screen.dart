import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/splash_two_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:flutter/material.dart';



class SplashTwoScreen extends StatefulWidget {
  const SplashTwoScreen({Key? key}) : super(key: key);

  @override
  State<SplashTwoScreen> createState() => _SplashTwoScreenState();
}

class _SplashTwoScreenState extends State<SplashTwoScreen> {
  SplashTwoController controller = Get.put(SplashTwoController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
         closeApp();
          return false;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                backgroundColor: ColorConstant.whiteA700,
                body: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgGroupCyan800,
                              height: getVerticalSize(125),
                              width: getHorizontalSize(124),
                              margin: getMargin(bottom: 5))
                        ])))));
  }
}



