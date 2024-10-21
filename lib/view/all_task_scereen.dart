import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class AllTaskScereen extends StatefulWidget {
  const AllTaskScereen({super.key});

  @override
  State<AllTaskScereen> createState() => _AllTaskScereenState();
}

class _AllTaskScereenState extends State<AllTaskScereen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
          AllTaskTile(),
        ],
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     // mainAxisAlignment: MainAxisAlignment.end,
    //     // crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Row(
    //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //       Content(data: "€ 1234.56", size: 16.h, weight: FontWeight.w500, family: "Lato",),
    //       Content(data: "[Category]", size: 16.h, weight: FontWeight.w500, family: "Lato",),

    //       // Row(
    //       //   mainAxisAlignment: MainAxisAlignment.end,
    //       //   crossAxisAlignment: CrossAxisAlignment.end,
    //       //   children: [

    //       //   ],
    //       // ),
    //                   ],
    //                 ),
    //                 Row(
    //                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 Content(data: "Expires", size: 16.h, weight: FontWeight.w500, family: "Lato",),
    //                 Content(data: "MMMEd", size: 16.h, weight: FontWeight.w500, family: "Lato",),
    //               ],
    //             ),

    //                               Container(
    //                                 margin: EdgeInsets.only(bottom: 20.h),
    //                           width: 120.w,
    //                           height: 40.h,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(10.r),
    //                             color: Color(0xff5271FF).withOpacity(0.8),
    //                           ),
    //                           child: Center(child: Content(data: "status order", size: 18.h, color: Colors.white,weight: FontWeight.w300,)),
    //                         ),

    //     ],
    //   ),
    // );
  }
}
