import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentFieldPassword extends StatelessWidget {
  String? label;
  String hint;
  int index;
  TextEditingController controller;
  List<TextInputFormatter> inputFormat;
  final bool obscureText; // Add this line
  // TextInputType textInput;
  ContentFieldPassword({
    super.key,
    this.label,
    required this.hint,
    required this.index,
    required this.controller,
    required this.inputFormat, required TextInputType keyboardType,
    this.obscureText = true,
    // required this.textInput
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? Container()
            : Container(
                // margin: EdgeInsets.only(top: 20.h, bottom: 9.h),
                margin: EdgeInsets.only(bottom: 9.h),
                child: Text(
                  label!,
                  style: TextStyle(
                      fontSize: 16.h,
                      // color: Color(0xff908B8B),
                      color: Colors.black,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500),
                )),
        Container(
          height: 50.h,
          width: 335.w,
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            maxLength: 30,
            keyboardType: TextInputType.text,
            // obscureText: value.getObscure(false, index),
            style: TextStyle(
                fontSize: 16.h, fontFamily: "Lato", fontWeight: FontWeight.w500),
            inputFormatters: inputFormat,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              hintText: hint,
              hintStyle:
                  TextStyle(color: Color(0xff908B8B), fontSize: 17.sp),
              counterText: "",
              prefixIcon: Container(
                  margin: EdgeInsets.symmetric(vertical: 13.h),
                  child: GestureDetector(
                      // onTap: () {
                      //   value.togglePasswordVisibility(index);
                      // },
                      child:
                       Image.asset("assets/Icon/password.png", height: 30.h,))),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                // borderSide: BorderSide(
                //     color: Color.fromARGB(220, 247, 123, 114), width: 2.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                // borderSide: BorderSide(
                //     color: Color.fromARGB(220, 247, 123, 114), width: 2.0),
              ),
              // errorStyle: InputDecoration.collapsed(hintText: hintText)
            ),
            validator: (value) {
              // if (Login_Api_Validation == false) {
              //   if (value == null || value.isEmpty)
              //     return "Enter Mobile Number";
              //   else if (value.length < 11) {
              //     return "Enter Correct Number";
              //   } else {
              //     return null;
              //   }
              // } else if (Login_Api_Validation == true) {
              //   if (Login_Api_Status == "404") {
              //     return "Failed";
              //   } else if (Login_Api_Status == "200") {
              //     return null;
              //   }
              // }
            },
          ),
        )
      ],
    );
  }
}
