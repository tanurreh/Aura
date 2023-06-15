import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:Aura/app/app.dart';

class DeviceConfig extends StatefulWidget {
  @override
  _DeviceConfigState createState() => _DeviceConfigState();
}

class _DeviceConfigState extends State<DeviceConfig> {
  String autoOpen = 'Open';

  String container1 = 'TBD1';
  String container2 = 'TBD1';
  String container3 = 'TBD1';
  String container4 = 'TBD1';
  String container5 = 'TBD1';

  String lefttoright = 'Close';
  String righttoleft = 'Close';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          elevation: 0,
          backgroundColor: CustomColors.KPrimaryColor,
          centerTitle: true,
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Device Configuration",
                    style: TextStyle(color: Colors.white, fontSize: 30.sp),
                  ),
                ),
                Center(
                  child: Text(
                    "Set your desired configuration on the device",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                child: Text(
                  "Auto Open",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: autoOpen,
                  items: <String>['Open', 'Close'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      autoOpen = value!;
                    });
                  },
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                child: Text(
                  "Container 1",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: container1,
                  items: <String>['TBD1', 'TBD2'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      container1 = value!;
                    });
                  },
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                child: Text(
                  "Container 2",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: container2,
                  items: <String>['TBD1', 'TBD2'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      container2 = value!;
                    });
                  },
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                child: Text(
                  "Container 3",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: container1,
                  items: <String>['TBD1', 'TBD2'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      container3 = value!;
                    });
                  },
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                child: Text(
                  "Container 4",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: container4,
                  items: <String>['TBD1', 'TBD2'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      container4 = value!;
                    });
                  },
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
                child: Text(
                  "Container 5",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: container5,
                  items: <String>['TBD1', 'TBD2'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      container5 = value!;
                    });
                  },
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                child: Text(
                  "Left to Right Gesture",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: lefttoright,
                  items: <String>['Close', 'Open'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      lefttoright = value!;
                    });
                  },
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
                child: Text(
                  "Right to Left Gesture",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: righttoleft,
                  items: <String>['Close', 'Open'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      righttoleft = value!;
                    });
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: MaterialButton(
                    minWidth: 100.w,
                    height: 50.h,
                    color: CustomColors.KPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: MaterialButton(
                    minWidth: 100.w,
                    height: 50.h,
                    color: CustomColors.KPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }
}
