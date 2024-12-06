import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/onboarding_one_controller.dart';
import 'models/onboarding_one_model.dart';
import 'models/slidermanageyou_item_model.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  List<SlidermanageyouItemModel> onboarding =  OnboardingOneModel.getOnboardingData();
  PageController pageController = PageController();
  OnboardingOneController controller = Get.put(OnboardingOneController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFFdde6e8),
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
      closeApp();
      return false;
    },
    child: ColorfulSafeArea(
    color: ColorConstant.whiteA700,
    child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: GetBuilder<OnboardingOneController>(
              init: OnboardingOneController(),
              builder:(controller) =>  Stack(
                children: [
                  Container(
                   child: PageView.builder(
              onPageChanged: (value) {
    controller.setCurrentPage(value);
    }
                ,controller: pageController,itemCount: onboarding.length,itemBuilder: (context, index) {
                     SlidermanageyouItemModel data = onboarding[index];
                     return Container(
                       decoration: BoxDecoration(image: DecorationImage(image: AssetImage(data.image!,),fit: BoxFit.fill)),
                       child:Padding(
                         padding: getPadding(top: 491),
                         child: Column(
                           children: [
                             SizedBox(
                               width: getHorizontalSize(
                                 385,
                               ),
                               child: Text(
                                 data.title!,
                                 maxLines: null,
                                 textAlign: TextAlign.center,
                                 style: AppStyle.txtAvenirBlack28,
                               ),
                             ),
                             Container(
                               width: getHorizontalSize(
                                 303,
                               ),
                               margin: getMargin(
                                 top: 13,
                               ),
                               child: Text(
                                data.subtitle!,
                                 maxLines: null,
                                 textAlign: TextAlign.center,
                                 style: AppStyle.txtBody,
                               ),
                             ),
                           ],
                         ),
                       )
                     );
                   },),
                  ),
                  Padding(
                    padding: getPadding(bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(onboarding.length, (index) {
                              return AnimatedContainer(
                                margin: getMargin(left: 4, right: 4),
                                duration: const Duration(milliseconds: 300),
                                height: getSize(8),
                                width: getSize(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (index == controller.currentPage)
                                        ? ColorConstant.cyan800
                                        : ColorConstant.cyan800.withOpacity(0.20)),
                              );
                            })),
                        CustomButton(
                            height: getVerticalSize(54),
                            text: controller.currentPage == onboarding.length - 1
                                ? "Get started"
                                : "lbl_next".tr,
                            margin: getMargin(left: 20, top: 48, right: 20),
                            onTap: controller.currentPage == onboarding.length - 1
                                ?(){
                              PrefUtils.setIsIntro(false);
                              Get.toNamed(
                                AppRoutes.signInScreen,
                              );
                            }
                                : () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn);
                            }),
                        GestureDetector(
                            onTap: () {
                              onTapTxtSkip();
                            },
                            child: Padding(
                                padding: getPadding(top: 22, bottom: 5),
                                child: Text(controller.currentPage == onboarding.length - 1?"":"lbl_skip".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSubheadline)))
                      ],
                    ),
                  )
                ],
              ),
            )
         )));
  }


  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingTwoScreen,
    );
  }


  onTapTxtSkip() {
    PrefUtils.setIsIntro(false);
    Get.toNamed(
      AppRoutes.signInScreen,
    );
  }
}




