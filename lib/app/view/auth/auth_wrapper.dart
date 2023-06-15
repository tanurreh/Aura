import 'package:Aura/app/app.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return controller.user == null ? LoginScreen() : BottomPages();
      },
    );
  }
}
