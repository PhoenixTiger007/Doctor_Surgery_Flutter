import 'package:doctorapp/core/app_export.dart';
import 'package:doctorapp/presentation/verification_screen/models/verification_model.dart';
import 'package:flutter/material.dart';


/// A controller class for the VerificationScreen.
///
/// This class manages the state of the VerificationScreen, including the
/// current verificationModelObj
class VerificationController extends GetxController   {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<VerificationModel> verificationModelObj = VerificationModel().obs;

  void codeUpdated() {
    otpController.value.text =  '';
  }

  @override
  void onInit() {
    super.onInit();

  }
}
