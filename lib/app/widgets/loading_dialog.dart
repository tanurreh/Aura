import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      content: SizedBox(
          width: 250,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.black),
              ),
               SizedBox(width: 20.w),
              Text(
                message,
                style: TextStyle(fontSize: 14.sp)
              )
            ],
          )),
    );
  }
}

void showLoadingDialog({required String message}) {
  Get.dialog(
    LoadingDialog(message: message),
    barrierDismissible: false,
    name: message,
  );
}

void hideLoadingDialog() {
  Get.back();
  return;
}
