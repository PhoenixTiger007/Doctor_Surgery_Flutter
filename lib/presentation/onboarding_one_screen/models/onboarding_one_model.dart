import 'package:doctorapp/core/app_export.dart';
import 'slidermanageyou_item_model.dart';

/// This class defines the variables used in the [onboarding_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel {
  // Rx<List<SlidermanageyouItemModel>> slidermanageyouItemList =
  //     Rx(List.generate(1, (index) => SlidermanageyouItemModel()));

  static List<SlidermanageyouItemModel> getOnboardingData(){
    return [
      SlidermanageyouItemModel(ImageConstant.imgOnbording1st,"Manage your income from what you do best","We keep accurate records of all services provide by doctor & any income recieved"),
      SlidermanageyouItemModel(ImageConstant.imgOnbording2nd,"Schedule appointments with expert doctors","expert ratings and reviews and book your appointments hassle-free"),
      SlidermanageyouItemModel(ImageConstant.imgOnbording3rd,"Schedule appointments with expert doctors","expert ratings and reviews and book your appointments hassle-free"),
    ];
  }
}
