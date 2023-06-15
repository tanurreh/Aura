import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:Aura/app/app.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String type = "All";
  bool state = false;
  List<dynamic> newdata = [];
  String detail =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  NotificationController _nc = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: CustomColors.KPrimaryColor,
            title: Text(
              "Notifications",
              style: TextStyle(color: Colors.white, fontSize: 30.sp),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60.w,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          color: _nc.selectedNotifications == Notifications.All
                              ? CustomColors.KPrimaryColor
                              : null,
                          child: Text("All",
                              style: TextStyle(
                                  color: _nc.selectedNotifications ==
                                          Notifications.All
                                      ? Colors.white
                                      : Colors.black)),
                          onPressed: () {
                            _nc.updateSelectedNotification(Notifications.All );
                          },
                        ),
                      ),
                      MaterialButton(
                        color: _nc.selectedNotifications == Notifications.Error
                            ? CustomColors.KPrimaryColor
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          "Error",
                          style: TextStyle(
                              color: _nc.selectedNotifications ==
                                      Notifications.Error
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        onPressed: () {
                          _nc.updateSelectedNotification(Notifications.Error);
                        },
                      ),
                      MaterialButton(
                        color:
                            _nc.selectedNotifications == Notifications.Warning
                                ? CustomColors.KPrimaryColor
                                : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          "Warning",
                          style: TextStyle(
                              color: _nc.selectedNotifications ==
                                      Notifications.Warning
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        onPressed: () {
                          _nc.updateSelectedNotification(Notifications.Warning);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomColors.KlightBlue,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.to(() => NotificationDetails());
                          },
                          leading: CircleAvatar(
                            radius: 30.r,
                            backgroundImage:
                                const AssetImage("assets/Logo.png"),
                          ),
                          title: Text('Title'),
                          subtitle: Text(
                            detail,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            softWrap: false,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
