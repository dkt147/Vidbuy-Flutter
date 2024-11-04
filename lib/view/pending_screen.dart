import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Content(
          data: "No orders yet",
          size: 20.h,
          family: "Nunito",
          weight: FontWeight.w700,
        ),
        Content(
          data: "Your orders will appear here",
          size: 18.h,
          family: "Nunito",
          weight: FontWeight.w400,
        )
      ],
    );
  }
}
