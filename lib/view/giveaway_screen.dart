import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class GivewayScreen extends StatefulWidget {
  const GivewayScreen({super.key});

  @override
  State<GivewayScreen> createState() => _GivewayScreenState();
}

class _GivewayScreenState extends State<GivewayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w
            ),
            child: Row(children: [
              Image.asset("assets/Icon/backarrow.png", height: 25.h,),
              SizedBox(
                width: 5.w
                ,
              ),

              Content(data: "Giveaway", size: 14.h, weight: FontWeight.w600, family: "Nunito",),
            ],),
          ),
          SizedBox(
            height: 10.h,
          ),
          Stack(
            children: [
              Center(
                          child: Container(
                            width: 331.w,
                            height: 165.h,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Image.asset(
                              "assets/UI/giveaway.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        Stack(
                          children: [
                            Container(
                          width: 94.w,
                          height: 94.h,
                          margin: EdgeInsets.only(top: 180.h, left: 110.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/Vector/girl.png"),
                        ),
                            Container(
                              width: 132.w,
                              height: 133.h,
                              margin: EdgeInsets.only(top: 140.h),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset("assets/Vector/girl.png"),
                            ),
                          
                          ],
                        ),
                        
                        
                        
                      ],
                    ),
            ],
          ),

        ],
      ),
    );
  }
}