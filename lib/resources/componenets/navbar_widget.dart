import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: 70.h,
            width: 375.w,
            // color: Colors.amber,
            
            // padding: EdgeInsets.zero,
            // decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //           color: Colors.grey,
            //           blurRadius: 15.0,
            //           spreadRadius: 1.0,
            //           offset: Offset(-1.0, -1.0)),
            //     ],
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20))),
            child: Consumer<NavbarProvider>(builder: (context, value, child) {
              return Container(
                padding: EdgeInsets.only(left: 63.w, right: 63.w),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        value.changeScreen(0);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        child: Image.asset(
                          value.screen == 0
                              ? "assets/Icon/Home.png"
                              : "assets/Icon/Home2.png",
                          height: 30.h,
                          color: value.screen == 0 ? Colors.blue : null,
                        ),
                      ),
                    ),
                    // Expanded(
                    //     flex: 1,
                    //     child: SizedBox(
                    //       width: 2,
                    //     )),
                    GestureDetector(
                      onTap: () {
                        // snackBar(
                        //     "Not Subscribed to Gate Pass Service",
                        //     context);
                        value.changeScreen(1);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        child: Image.asset(
                          value.screen == 1
                           ? "assets/Icon/Search2.png"
                              : "assets/Icon/Search.png",
                          height: 29.h,
                          // color: value.screen == 1 ? Colors.blue : null,
                        ),
                      ),
                    ),
                    // Expanded(
                    //     flex: 5,
                    //     child: SizedBox(
                    //       width: 1,
                    //     )),
                    //  GestureDetector(
                    //   onTap: () {
                    //     value.changeScreen(2);
                    //     // print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$auctionHugagId>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                    //   },
                    //   child: AnimatedContainer(
                    //     margin: EdgeInsets.only(bottom: 40),
                    //     duration: Duration(seconds: 1),
                    //     curve: Curves.fastLinearToSlowEaseIn,
                    //     // margin: EdgeInsets.only(right: 10),
                    //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color:Colors.orange ,
                    //     ),
                    //     child: Image.asset(
                    //       add,
                    //       color:Colors.white,
                    //       height: 22,
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        value.changeScreen(2);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        child: Image.asset(
                          value.screen == 2
                              ? "assets/Icon/LayoutWidget.png"
                              : "assets/Icon/LayoutWidget.png",
                          // value.screen == 0 ? home : home2,
                          height: 29.h,
                          color: value.screen == 2 ? Colors.blue : null,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.changeScreen(3);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        // duration: Duration(seconds: 1),
                        // curve: Curves.fastLinearToSlowEaseIn,
                        // padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                        // decoration: BoxDecoration(
                        //   shape: BoxShape.circle,
                        // ),
                        child: Image.asset(
                          value.screen == 3
                              ? "assets/Icon/profile2.png"
                              : "assets/Icon/profile.png",
                          height: 29.h,
                          // color: value.screen == 3 ? Colors.blue : null,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              );
            })),
      ],
    );
  }
}
