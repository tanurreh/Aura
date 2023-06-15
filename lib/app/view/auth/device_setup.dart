import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Aura/app/app.dart';

class DeviceSetup extends StatefulWidget {
  const DeviceSetup({Key? key}) : super(key: key);

  @override
  _DeviceSetupState createState() => _DeviceSetupState();
}

class _DeviceSetupState extends State<DeviceSetup> {
  
  TextEditingController devicename = TextEditingController();
  TextEditingController serialNo = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: state,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
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
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: CustomColors.KdotColor),
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Text(
                                "Device Setup",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Connect to the Device",
                                style:
                                    TextStyle(fontSize: 20.sp, color: CustomColors.KPrimaryColor),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin:  EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                    child: Text(
                      "DeviceName",
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                  ),
                ),
                Container(
                    margin:  EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: devicename,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "Please Enter  Device name";
                        }
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          disabledBorder: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const  BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          hintText: "eg_Device"),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin:EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                    child: Text(
                      "Device Serial No",
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                  ),
                ),
                Container(
                    margin:EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      controller: serialNo,
                      maxLength: 6,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "Please Enter Device Serial NO";
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColors.KWhiteColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius:  BorderRadius.all(Radius.circular(10.r)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        disabledBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const  BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        hintText: "eg.35035",
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: MaterialButton(
                    minWidth: 150.w,
                    height: 50.h,
                    color:CustomColors.KPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Connect",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                     
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
