import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({required this.title, this.loading = false, this.func});
  final String title;
  VoidCallback? func;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // Color(0xff000000),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r))),
          onPressed: loading ? () {} : func,
          child: Container(
            width: 100.w,
            height: 50.h,
            // padding: EdgeInsets.symmetric(
            //     // horizontal: 20.w,
            //     vertical: 17.h),
            child: loading
                ? Container(
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 30.h,
                          width: 30.h,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 3,
                          )),
                    ],
                  ))
                : Center(
                    child: Text(title,
                        style: TextStyle(
                            // fontFamily: "Rhizome",
                            fontSize: 18.h,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
          )),
    );
  }
}
