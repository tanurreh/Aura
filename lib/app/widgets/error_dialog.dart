import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class ErrorDialog extends StatelessWidget {
  ErrorDialog({Key? key, required this.message, this.showOkButton = true})
      : super(key: key);
  final String message;
  bool showOkButton;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      elevation: 0,
      title: Center(
          child: Text('Error',
              style: TextStyle(fontSize: 16.sp , color: Colors.red))),
      content: Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp , color: Colors.black)),
      actions: <Widget>[
        showOkButton
            ? TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Ok',
                    style: TextStyle(fontSize: 16.sp , 
                      color: Colors.black,
                    )))
            : const SizedBox()
      ],
    );
  }
}

Future<void> showErrorDialog(String message) {
  return Get.dialog(ErrorDialog(
    message: message,
  ));
}

Future<void> showNoNetworkDialog() {
  return Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: ErrorDialog(
          showOkButton: false,
          message: "No internet connection",
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.75));
}
