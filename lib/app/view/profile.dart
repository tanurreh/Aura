import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Aura/app/app.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.KPrimaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 30.sp),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(14.h),
              child: CircleAvatar(
                radius: 55.r,
                backgroundColor: CustomColors.KPrimaryColor,
                backgroundImage: const AssetImage("assets/Logo.png"),
              ),
            ),
            Text(
              'Tanzeel',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                'Abc@gmail.com',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Divider(
                thickness: 2.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                'Android',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Divider(
                thickness: 2.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                '1122',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Divider(
                thickness: 2.h,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: MaterialButton(
                minWidth: 150.w,
                height: 50.h,
                color: CustomColors.KlightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.red, fontSize: 20.sp),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Do you want to Sign out'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            print("you choose no");
                            Navigator.of(context).pop(false);
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () async {
                            authController.signOut();
                             Navigator.of(context).pop();
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
