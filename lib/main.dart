// ignore_for_file: inference_failure_on_instance_creation

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/cart/controllers/cart_controller.dart';
import 'package:get_flutter_fire/app/modules/products/controllers/products_controller.dart';
//import 'package:get_flutter_fire/app/modules/settings/controllers/settings_controller.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp.router(
      debugShowCheckedModeBanner:
          false, //the debug banner will automatically disappear in prod build
      title: 'Application',
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
          Get.put(ProductsController());
          Get.put(CartController());
        },
      ),
      getPages: AppPages.routes,
      // routeInformationParser: GetInformationParser(
      //     // initialRoute: Routes.HOME,
      //     ),
      // routerDelegate: GetDelegate(
      //   backButtonPopMode: PopMode.History,
      //   preventDuplicateHandlingMode:
      //       PreventDuplicateHandlingMode.ReorderRoutes,
      // ),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pinkAccent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          primary: Colors.pinkAccent,
          secondary: Colors.purpleAccent,
        ),
        scaffoldBackgroundColor: Colors.pink.shade50, // Updated from backgroundColor
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pinkAccent,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.pink.shade900), // Updated from bodyText1
          bodyMedium: TextStyle(color: Colors.pink.shade600), // Updated from bodyText2
          titleMedium: TextStyle(color: Colors.white, fontSize: 20), // Updated from headline6
        ),
        appBarTheme: AppBarTheme(
          color: Colors.pink,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // Updated textTheme
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.pink.shade100,
        ),
        cardColor: Colors.pink.shade50,
      ),
    ),
  );
}
