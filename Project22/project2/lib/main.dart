import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/binding/initialBinding.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/localization/changelanguage.dart';
import 'package:project2/Base/localization/languages.dart';
import 'package:project2/Base/services/myservices.dart';
import 'package:project2/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Changelanguage c = Get.put(Changelanguage());
    return GetMaterialApp(
      initialBinding: Initialbinding(),
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      locale: c.languge,
      translations: Languages(),
      theme: ThemeData(
          fontFamily: "Inter",
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                color: Appcolors.black,
                fontSize: 27,
                fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
              color: Appcolors.black,
              fontSize: 19,
            ),
            headlineSmall: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Appcolors.black),
          )),
    );
  }
}
