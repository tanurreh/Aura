import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Aura/app/app.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  bool view = true;
  late BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  children: [
                    Image.asset("assets/dot.png",
                        width: 318.w, height: 229.h, color: CustomColors.KdotColor),
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/Logo.png",
                          color: CustomColors.KPrimaryColor,
                          height: 169.h,
                        ))
                  ],
                ),
              ),
              Text(
                "Welcome!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Login To Your Account",
                style: TextStyle(fontSize: 20.sp),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                child: CustomTextFeild(
                    hinttext: 'User Email Address',
                    controller: emailController,
                    isObscure: false,
                    showIconPass: false,
                    validator: (value) {
                      if (value!.isNotEmpty &&
                          RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(value.trim())) {
                        return null;
                      } else {
                        return "Please Enter Valid Email";
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                child: CustomTextFeild(
                  hinttext: 'Password',
                  controller: passwordController,
                  isObscure: true,
                  showIconPass: true,
                  validator: (value) {
                    if (value!.isNotEmpty && value.length > 7) {
                      return null;
                    } else {
                      return "Please Enter Password minimum length of 8";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: MaterialButton(
                  minWidth: 150.w,
                  height: 50.h,
                  color: CustomColors.KPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r)),
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 20.r),
                  ),
                  onPressed: ()async  {
                    if (_formkey.currentState!.validate()) {
                        await authController.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50.w,
                      child: Divider(
                        thickness: 2.w,
                        color: CustomColors.KlightBlue,
                      ),
                    ),
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: Divider(
                        thickness: 2.w,
                        color: CustomColors.KlightBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: MaterialButton(
                  minWidth: 328.w,
                  height: 50.h,
                  color: CustomColors.KPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  onPressed: () async {
                    Get.to(() => const SignUpScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
