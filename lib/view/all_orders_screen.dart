import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 335.w,
              height: 81.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(width: 1.w, color: Colors.black)),
              child: Container(
                margin: EdgeInsets.only(left: 7.w, right: 13.w,),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Content(
                      data: "Order: [random]",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Content(
                          data: "Salena Gomez",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w500,
                        ),
                        Content(
                          data: "Salena Gomez",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Content(
                          data: "MMMed",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w500,
                        ),
                        Content(
                          data: "[status_order]",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
