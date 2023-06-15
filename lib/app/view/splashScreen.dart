import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Aura/app/app.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  void delay() async {
    await Future.delayed(
      const Duration(
        milliseconds: 2500,
      ),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (_) => AuthWrapper(),
          ),
          (route) => false,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.KPrimaryColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Image.asset(
                  "assets/dot.png",
                  width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.white
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                    
                  image: AssetImage("assets/Logo.png",
                  
                  ),
                )),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  "assets/dot.png",
                  width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.white
                ),
              ),
              // RotatedBox(
              //   quarterTurns: 2,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height * 0.3,
              //     decoration: BoxDecoration(
              //         image:
              //             DecorationImage(image: AssetImage("assets/dot.png"))),
              //   ),
              // ),
            ]));
  }
}
