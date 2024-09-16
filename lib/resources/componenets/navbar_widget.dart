
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
        Stack(clipBehavior: Clip.none, children: [
          Container(
            height: 70.h,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                      offset: Offset(-1.0, -1.0)),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: 
                    Consumer<NavbarProvider>(builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 2,
                          )),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            height: 5.h,
                            width: 37.h,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInToLinear,
                            // margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: value.screen == 0
                                    ? Colors.orange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            // child: Image.asset(
                            //   card,
                            //   height: 29.h,
                            // ),
                          ),
                          GestureDetector(
                            onTap: () {
                              value.changeScreen(0);
                            },
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                              duration: Duration(seconds: 2),
                              child: Image.asset(
                                value.screen == 0 ? "assets/Icon/Home.png" : "assets/Icon/Home.png",
                                height: 29.h,
                                color: value.screen == 0 ? Colors.orange : null,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                              opacity: value.screen == 0 ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: value.screen == 0
                                        ? Colors.orange
                                        : Colors.transparent,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: 5.h,
                          )
                        ],
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 2,
                          )),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            height: 5,
                            width: 37,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: value.screen == 1
                                    ? Colors.orange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            // child: Image.asset(
                            //   card,
                            //   height: 29.h,
                            // ),
                          ),

                          // yahan ayegi gate [a]
                          GestureDetector(
                            onTap: () {
                              // snackBar(
                              //     "Not Subscribed to Gate Pass Service",
                              //     context);
                              // value.changeScreen(1);
                            },
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                              duration: Duration(seconds: 2),
                              child: Image.asset(
                                "assets/Icon/Search.png",
                                height: 29.h,
                                color: value.screen == 1 ? Colors.orange : null,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                              opacity: value.screen == 1 ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                "GatePass",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: value.screen == 1
                                        ? Colors.orange
                                        : Colors.transparent,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: 5.h,
                          )
                        ],
                      ),
                      Expanded(
                          flex: 5,
                          child: SizedBox(
                            width: 1,
                          )),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AnimatedContainer(
                            height: 5,
                            width: 37,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInToLinear,
                            // margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: value.screen == 2
                                    ? Colors.orange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20.r)),
                            // child: Image.asset(
                            //   card,
                            //   height: 29.h,
                            // ),
                          ),
                          GestureDetector(
                            onTap: () {
                              value.changeScreen(2);
                            },
                            child: AnimatedContainer(
                              margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                              duration: Duration(seconds: 2),
                              child: Image.asset(
                                value.screen == 2 ? "assets/Icon/LayoutWidget.png" : "assets/Icon/LayoutWidget.png",
                                // value.screen == 0 ? home : home2,
                                height: 29.h,
                                color: value.screen == 2 ? Colors.orange : null,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                              opacity: value.screen == 2 ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                "Tanker",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: value.screen == 2
                                        ? Colors.orange
                                        : Colors.transparent,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: 5.h,
                          )
                        ],
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 2,
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AnimatedContainer(
                            height: 5,
                            width: 37,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInToLinear,
                            // margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: value.screen == 3
                                    ? Colors.orange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            // child: Image.asset(
                            //   card,
                            //   height: 29.h,
                            // ),
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
                                value.screen == 3 ? "assets/Icon/profile.png" : "assets/Icon/profile.png",
                                height: 29.h,
                                color: value.screen == 3 ? Colors.orange : null,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                              opacity: value.screen == 3 ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                "Billing",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: value.screen == 3
                                        ? Colors.orange
                                        : Colors.transparent,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: 5.h,
                          )
                        ],
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 1,
                          ))
                    ],
                  );
                })),
          Positioned(
            left: 179.w,
            bottom: 35.h,
            child: GestureDetector(
              onTap: () {
                // securityAlert(context);
                snackBar("Not Subscribed", context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: Container(
                  // height: 70,
                  // margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/Icon/Search.png",
                    height: 48.h,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
