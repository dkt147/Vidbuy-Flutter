import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/date_picker_bottomsheet.dart';

class VideoScreenAdmin extends StatefulWidget {
  const VideoScreenAdmin({super.key});

  @override
  State<VideoScreenAdmin> createState() => _VideoScreenAdminState();
}

class _VideoScreenAdminState extends State<VideoScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Image.asset(
              "assets/Vector/boy.png",
              width: 305.w,
              height: 560.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 156.w,
                  height: 40.h,
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
                      // navigate(context, FeedbackScreen());
                      showDatePickerBottomSheet(context);
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff908B8B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      "Ask New video",
                      style: TextStyle(
                          fontSize: 16.h,
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.h,
                ),
                Container(
                  width: 156.w,
                  height: 40.h,
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
                      // navigate(context, OrderCancelScreen());
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text("Complete",
                        style: TextStyle(
                          fontSize: 16.h,
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
