import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 392.w,
            height: 243.h,
            decoration: BoxDecoration(
              color: Color(0xff5271FF),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.r),
                  bottomLeft: Radius.circular(30.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 55.h, left: 21.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                    Navigator.pop(context);
                  },
                        child: Image.asset(
                          "assets/Icon/backarrow.png",
                          height: 25.h,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Content(
                        data: "Balance",
                        size: 14.h,
                        weight: FontWeight.w600,
                        family: "Nunito",
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Content(
                        data: "Total Balance",
                        size: 30.h,
                        weight: FontWeight.w900,
                        family: "Lato",
                        color: Colors.white,
                      ),
                      Content(
                        data: "€25,000",
                        size: 20.h,
                        weight: FontWeight.w900,
                        family: "Lato",
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Content(
                        data: "Total billed with VidBuy",
                        size: 16.h,
                        weight: FontWeight.w400,
                        family: "Lato",
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: 375.w,
            height: 55.h,
            color: Colors.white,
            child: ListTile(
              leading: Image.asset("assets/Icon/euro.png", width: 30.w, height: 39.h,),
              title: Content(data: "Pending balance", size: 20.h, weight: FontWeight.w600,),
              // subtitle: Content(data: "data", size: 15.h),
              trailing: Content(data: "€50.00", size: 20.h, weight: FontWeight.w600, color: Colors.black,),
            
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 34.h, left: 13.w),
            child: Content(data: "Transactions", size: 18.h, weight: FontWeight.w600, color: Color(0xff8E8E8E),)),
          SizedBox(
            height: 24.h,
          ),        
            Center(
              child: Container(
              width: 323.w,
              height: 55.h,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset("assets/Icon/euro.png", width: 30.w, height: 39.h,),
                title: Content(data: "Pending balance", size: 20.h, weight: FontWeight.w600,),
                // subtitle: Content(data: "data", size: 15.h),
                trailing: Content(data: "€50.00", size: 20.h, weight: FontWeight.w600, color: Colors.black,),
              
              ),
                        ),
            ),
        ],
      ),
    );
  }
}
