import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentField extends StatelessWidget {
  String? label;
  String hint;
  TextEditingController controller;
  List<TextInputFormatter> inputFormat;
  int? maxLength;
  TextInputType keyboardType;
  Image? prefixIcon;
  Image? suffixIcon;
  Color colorr;
  String? family;
  double? heightt;
  double? widthh;
  final String? Function(String?)? validate;
  void Function(String)? onChange;
  ContentField(
      {super.key,
      this.label,
      this.maxLength,
      required this.hint,
      required this.controller,
      required this.inputFormat,
      required this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      this.family,
      this.heightt,
      this.widthh,
      this.onChange,
      required this.colorr,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? Container()
            : Container(
                margin: EdgeInsets.only(bottom: 9.h),
                child: Text(
                  label!,
                  style: TextStyle(
                      fontSize: 16.h,
                      color: Colors.black,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500),
                )),
        Container(
          height: 50.h ?? heightt,
          width: 335.w ?? widthh,
          child: TextFormField(
            controller: controller,
            maxLength: maxLength,
            keyboardType: keyboardType,
            style: TextStyle(
                fontSize: 18.h,
                // color: Color.fromARGB(186, 0, 0, 0),
                fontFamily: "Lato" ?? family),
            inputFormatters: inputFormat,
            decoration: new InputDecoration(
              // fillColor: Color(0xff908B8B),
              // fillColor: Color(0xffFFFFFF),
              fillColor: colorr,
              filled: true,
              hintText: hint,
              hintStyle: TextStyle(color: Color(0xff908B8B), fontSize: 16.h),
              counterText: "",
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,

              // Container(
              //     margin: EdgeInsets.symmetric(vertical: 13.h),
              //     child: GestureDetector(
              //         // onTap: () {
              //         //   value.togglePasswordVisibility(index);
              //         // },
              //         child: Icon(Icons.email))),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
              ),
              // errorStyle: InputDecoration.collapsed(hintText: hintText)
            ),
            validator: validate,
            onChanged: onChange,
            //  (value) {
            //   // if (Login_Api_Validation == false) {
            //   //   if (value == null || value.isEmpty)
            //   //     return "Enter Mobile Number";
            //   //   else if (value.length < 11) {
            //   //     return "Enter Correct Number";
            //   //   } else {
            //   //     return null;
            //   //   }
            //   // } else if (Login_Api_Validation == true) {
            //   //   if (Login_Api_Status == "404") {
            //   //     return "Failed";
            //   //   } else if (Login_Api_Status == "200") {
            //   //     return null;
            //   //   }
            //   // }
            // },
          ),
        ),
      ],
    );
  }
}

// Widget textFieldWidget(controller,label,hint){
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//                     margin: EdgeInsets.only(top: 20.h,bottom: 9.h),
//                     child: Text(label,style: TextStyle(fontSize: 19.sp,color: textFieldLabelColor),)),

//              Container(
//                 height: 50.h,
//                child: TextFormField(
//                         controller: controller,
//                         maxLength: 11,
//                         keyboardType: TextInputType.number,

//                         style: TextStyle(
//                             fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
//                         inputFormatters: <TextInputFormatter>[
//                           FilteringTextInputFormatter.digitsOnly
//                         ],
//                         decoration: new InputDecoration(
//                           fillColor: textFieldColor,
//                           filled: true,
//                           hintText: hint,
//                           hintStyle: TextStyle(color: textFieldHintColor,fontSize: 17.sp),
//                           counterText: "",
//                           contentPadding:
//                               EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: primaryColor, width: 2.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide:
//                                 BorderSide(color: textFieldColor, width: 2.0),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(220, 247, 123, 114),
//                                 width: 2.0),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(220, 247, 123, 114),
//                                 width: 2.0),
//                           ),
//                           // errorStyle: InputDecoration.collapsed(hintText: hintText)
//                         ),
//                         validator: (value) {
//                           // if (Login_Api_Validation == false) {
//                           //   if (value == null || value.isEmpty)
//                           //     return "Enter Mobile Number";
//                           //   else if (value.length < 11) {
//                           //     return "Enter Correct Number";
//                           //   } else {
//                           //     return null;
//                           //   }
//                           // } else if (Login_Api_Validation == true) {
//                           //   if (Login_Api_Status == "404") {
//                           //     return "Failed";
//                           //   } else if (Login_Api_Status == "200") {
//                           //     return null;
//                           //   }
//                           // }
//                         },
//                       ),
//              ) ],
//               );

// }
