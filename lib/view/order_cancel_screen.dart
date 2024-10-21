import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/home_screen.dart';
import 'package:vidbuy_app/view/payment_error_screen.dart';

class OrderCancelScreen extends StatelessWidget {
  OrderCancelScreen({super.key});
  TextEditingController _meesageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 146.h,
            ),
            Content(
              data: "Reason For rejection",
              size: 30.h,
              weight: FontWeight.w300,
            ),
            Content(
              data:
                  "Detail to the influencer why you rejected the request,\nthey will be able to read the message",
              size: 16.h,
              weight: FontWeight.w300,
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: 334.w,
              height: 384.h,
              child: TextField(
                controller: _meesageController,
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: 'Description of what is going on..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 29.h,
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
                    navigate(context, HomeScreen());
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Sumbit",
                    style: TextStyle(fontSize: 16.h, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
