import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/sign_up_controller.dart';
import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/core/utils/validation_functions.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/domain/googleauth/google_auth_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return false;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                body: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 16, top: 42, right: 16, bottom: 42),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(top: 1),
                                  child: Text("lbl_sign_up".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProDisplayBold34)),
                              Padding(
                                  padding: getPadding(top: 13),
                                  child: Text("msg_join_the_community".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtSFProDisplayRegular16)),


                              CustomFloatingEditText(
                                  controller: controller.nameController,
                                  labelText: "lbl_name".tr,
                                  hintText: "lbl_name".tr,
                                  variant:
                                  FloatingEditTextVariant.OutlineRed700,
                                  shape: FloatingEditTextShape.RoundedBorder8,
                                  padding: FloatingEditTextPadding.PaddingTB15,
                                  margin: getMargin(top: 35),
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid text";
                                    }
                                    return null;
                                  }),

                              CustomFloatingEditText(
                                  controller: controller.emailController,
                                  labelText: "lbl_email_address".tr,
                                  hintText: "msg_ronaldrichards_gmail_com".tr,
                                  variant:
                                  FloatingEditTextVariant.OutlineRed700,
                                  shape: FloatingEditTextShape.RoundedBorder8,
                                  padding: FloatingEditTextPadding.PaddingTB15,
                                  margin: getMargin(top: 14),
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),


                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              phone_number_field(
                                  controller.phoneNumberController, (p0) {
                                if (p0 == null || p0.number.isEmpty) {
                                  return "Enter valid number";
                                }
                                return null;
                              }),
                              Obx(
                                    () => CustomFloatingEditText(
                                    controller: controller.passwordController,
                                    labelText: "lbl_password".tr,
                                    hintText: "lbl_password".tr,
                                    variant:
                                    FloatingEditTextVariant.OutlineRed700,
                                    shape: FloatingEditTextShape.RoundedBorder8,
                                    padding:
                                    FloatingEditTextPadding.PaddingTB15,
                                    margin: getMargin(top: 14),
                                    textInputType: TextInputType.emailAddress,
                                    isObscureText:
                                    controller.isShowPassword.value,
                                    suffix: InkWell(
                                        onTap: () {
                                          controller.isShowPassword.value =
                                          !controller.isShowPassword.value;
                                        },
                                        child: Container(
                                            margin:
                                            getMargin(left: 16, right: 16),
                                            child: CustomImageView(
                                                svgPath: controller
                                                    .isShowPassword.value
                                                    ? ImageConstant
                                                    .imgIcPasswordStoke
                                                    : ImageConstant
                                                    .imgIcPasswordStoke))),
                                    suffixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(63)),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter valid password";
                                      }
                                      else if(value.length <8){
                                        return "Please enter 8 digit password";

                                      }
                                      return null;
                                    }),
                              ),
                              CustomButton(
                                  height: getVerticalSize(54),
                                  text: "lbl_sign_up2".tr,
                                  margin: getMargin(top: 51),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                     Get.back();
                                    }
                                  }),
                              Padding(
                                  padding: getPadding(top: 16),
                                  child: Text("lbl_or".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBody)),
                              CustomButton(
                                  height: getVerticalSize(56),
                                  width: getHorizontalSize(258),
                                  text: "msg_continue_with_google".tr,
                                  margin: getMargin(top: 19),
                                  variant: ButtonVariant.FillGray50,
                                  shape: ButtonShape.RoundedBorder16,
                                  padding: ButtonPadding.PaddingT16,
                                  fontStyle: ButtonFontStyle.AvenirMedium17,
                                  prefixWidget: Container(
                                      margin: getMargin(right: 16),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgGoogle)),
                                  onTap: () {
                                    onTapContinuewith();
                                  }),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtDonthaveanaccount3();
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.fromHex(
                                                    "#000000"),
                                                fontSize: getFontSize(16),
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: "lbl_sign_in2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.fromHex(
                                                    "#1d718b"),
                                                fontSize: getFontSize(16),
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w900))
                                      ]),
                                      textAlign: TextAlign.left))
                            ]))))));
  }

  onTapSignup() {
    Get.toNamed(
      AppRoutes.homePageScreen,
    );
  }

  onTapContinuewith() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapTxtDonthaveanaccount3() {
    Get.back();
  }
}
