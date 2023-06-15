import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:Aura/app/app.dart';

class NotificationDetails extends StatefulWidget {
  NotificationDetails();

  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  int index = 1;
  String detail =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50.h,
            color: CustomColors.KPrimaryColor,
            child: Center(
              child: Text(
                "Notifications",
                style: TextStyle(color: Colors.white, fontSize: 30.sp),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.r),
            width: 378.w,
            height: 471.h,
            decoration: BoxDecoration(
              color: CustomColors.KlightBlue,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundImage: const AssetImage("assets/Logo.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Text(
                        'Title',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    detail,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    "<< Previous",
                    style: TextStyle(
                        color: CustomColors.KPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  onPressed: () {
                    // if (index != 0) {
                    //   setState(() {
                    //     index--;
                    //   });
                    // }
                  },
                ),
                TextButton(
                  child: Text(
                    "Next >>",
                    style: TextStyle(
                        color: CustomColors.KPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  onPressed: () {
                    // if (widget.index < widget.data.length - 1) {
                    //   setState(() {
                    //     widget.index++;
                    //   });
                    // }
                  },
                )
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 40.h),
            child: MaterialButton(
              minWidth: 150.w,
              height: 50.h,
              color: CustomColors.KPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
