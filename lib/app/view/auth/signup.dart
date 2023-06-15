import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Aura/app/app.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final cityController = Get.put(ApiController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Stack(
                    children: [
                      Image.asset("assets/dot.png",
                          width: 318.w, height: 229.h, color: CustomColors.KdotColor),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "assets/Logo.png",
                            color: CustomColors.KPrimaryColor,
                            width: 169.w,
                            height: 169.h,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: CustomColors.KPrimaryColor,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "Create Your Account",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                  child: CustomTextFeild(
                      hinttext: 'User Name',
                      controller: usernameController,
                      isObscure: false,
                      showIconPass: false,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "Please Enter Username";
                        }
                      }),
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
                    controller: confirmpasswordController,
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
                  padding: EdgeInsets.only(top: 30.h),
                  child: MaterialButton(
                   minWidth: 150.w,
                  height: 50.h,
                    color: CustomColors.KPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r)),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        if (confirmpasswordController.text ==
                            passwordController.text) {
                          await authController.signUpWithEmailAndPassword(
                              username: usernameController.text,
                              emailAddress: emailController.text.trim(),
                              password: passwordController.text.trim());
                          Get.back();
                        } else {
                           Fluttertoast.showToast(msg: "The password isn't match", gravity: ToastGravity.BOTTOM);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
