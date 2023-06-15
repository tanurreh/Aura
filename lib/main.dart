import 'package:Aura/app/app.dart';
import 'package:Aura/bindings/initial_binding.dart';
import 'package:Aura/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 
   runApp(ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MyApp();
      }));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aura',
      theme: AppThemes.lightTheme,
      defaultTransition: Transition.downToUp,
      initialBinding: InitialBinding(),
      home: SplashScreen(),
    );
  }
}
