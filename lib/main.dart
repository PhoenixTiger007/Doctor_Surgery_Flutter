// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import 'core/utils/logger.dart';
// import 'core/utils/color_constant.dart';
// import 'localization/app_localization.dart';
// import 'core/utils/initial_bindings.dart';
// import 'routes/app_routes.dart';

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.light, // For iOS: (dark icons)
//       statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
//     ),
//   );
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]).then((value) {
//     Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
//     runApp(MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           useMaterial3: true,
//           visualDensity: VisualDensity.standard,
//           elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
//           bottomSheetTheme:
//               BottomSheetThemeData(backgroundColor: ColorConstant.whiteA700),
//           dialogTheme: DialogTheme(
//               backgroundColor: ColorConstant.whiteA700,
//               surfaceTintColor: ColorConstant.whiteA700)),
//       translations: AppLocalization(),
//       locale: Get.deviceLocale, //for setting localization strings
//       fallbackLocale: Locale('en', 'US'),
//       title: 'doctorapp',
//       initialBinding: InitialBindings(),
//       initialRoute: AppRoutes.initialRoute,
//       getPages: AppRoutes.pages,
//     );
//   }
// }
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
