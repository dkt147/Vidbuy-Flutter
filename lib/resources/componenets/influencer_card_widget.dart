import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class InfluencerCardWidget extends StatelessWidget {
  String image;
  String influencerName;
  String categoryName;
  InfluencerCardWidget(
      {super.key,
      required this.image,
      required this.influencerName,
      required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 106.w,
          height: 115.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
          child: Stack(children: [
            Image.asset(
              image,
              height: 173.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 80.h,
              // left: 20.w,
              child: Container(
                width: 106.w,
                height: 35.h,
                decoration: BoxDecoration(
                    color: Color(0xff000000).withOpacity(0.8),
                    // color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7.r),
                      bottomRight: Radius.circular(7.r),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Content(
                      data: influencerName,
                      size: 14.h,
                      family: "Nunito",
                      weight: FontWeight.w900,
                      color: Colors.white,
                    ),
                    Content(
                      data: categoryName,
                      size: 10.h,
                      family: "Nunito",
                      weight: FontWeight.w500,
                      color: Colors.white,
                    )
                  ],
                ),
                // child: Content(
                //               data: text,
                //               size: 20.h,
                //               family: "Nunito",
                //               weight: FontWeight.w900,
                //             ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
