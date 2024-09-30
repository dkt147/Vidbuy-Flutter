import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class SuccessPaymentScreen extends StatefulWidget {
  const SuccessPaymentScreen({super.key});

  @override
  State<SuccessPaymentScreen> createState() => _SuccessPaymentScreenState();
}

class _SuccessPaymentScreenState extends State<SuccessPaymentScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 202.h,
          ),
          Center(child: Image.asset("assets/Vector/success.png", height: 110.h, width: 110.w,)),
            SizedBox(
            height: 46.h,
          ),
          Center(child: Content(data: "Payment Confirmed !", size: 30.h, weight: FontWeight.w500, family: "Nunito",)),
          SizedBox(
            height: 13.h,
          ),
          Center(child: Content(data: "Congratulations, your payment has been confirmed.", size: 14.h, weight: FontWeight.w400, family: "Nunito",)),
          SizedBox(
            height: 79.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 45.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/Icon/Hand.png", height: 30.h,),
                Row(
                  children: [
                    Content(data: "Want to say thankyou with a donation?", size: 14.h, weight: FontWeight.w400, family: "Nunito",),
                    SizedBox(
                      width: 21.w,
                    ),
                    Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
              height: 111.h,
            ),
            Center(
              child: Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_emailController.text.isEmpty) {
                    //   snackBar("Enter Valid Email", context);
                    // } else if (_passwordController.text.isEmpty) {
                    //   snackBar(
                    //     "Enter Password",
                    //     context,
                    //   );
                    // } else if (_passwordController.text.length < 8) {
                    //   snackBar(
                    //       "Enter Minium 8 Characters of Password", context);
                    // } else {
                    //   // Navigator.push(
                    //   //     context,
                    //   //     MaterialPageRoute(
                    //   //         builder: (_) => TabBarWidget()));
                    // navigate(context, HomeScreen());
                    
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 16.h, color: Colors.white, fontFamily: "Lato"),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}