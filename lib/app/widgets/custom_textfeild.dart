
import 'package:Aura/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFeild extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  bool? isObscure;
  final bool? showIconPass;
  TextInputType? textinputty;
  String? Function(String?)? validator;

  CustomTextFeild(
      {super.key,
      required this.hinttext,
      required this.controller,
      this.validator,
      this.isObscure = false,
      this.showIconPass = false,
      this.textinputty = TextInputType.multiline});

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height:  56.h,
      width: 380.w,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(color: Colors.black),
          keyboardType: widget.textinputty!,
          controller: widget.controller,
          obscureText: widget.isObscure!,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            filled: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Colors.black), //<-- SEE HERE
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Colors.black), //<-- SEE HERE
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Colors.black), //<-- SEE HERE
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Colors.black), //<-- SEE HERE
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Colors.black), //<-- SEE HERE
            ),
            hintText: widget.hinttext,
            hintStyle:TextStyle(fontSize: 20.sp, color: Colors.grey),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 15.h, left: 20.w),
            suffixIcon: widget.showIconPass!
                ? widget.isObscure!
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.isObscure = false;
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.eye,
                          color: Colors.grey,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.isObscure = true;
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.grey,
                        ),
                      )
                : const SizedBox.shrink(),
          ),
          validator: widget.validator
          
          // (value) {
          //   if (value!.length < 6) {
          //     return "Password must be at least 6 characters";
          //   }
          // },
          ),
    );
  }
}
