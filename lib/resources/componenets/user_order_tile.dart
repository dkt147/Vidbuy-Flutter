import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

// ignore: must_be_immutable
class UserOrderTile extends StatelessWidget {
  String order;
  String influencerName;
  String expiryDate;
  String price;
  String orderStatus;
  UserOrderTile(
      {required this.order,
      required this.influencerName,
      required this.expiryDate,
      required this.price,
      required this.orderStatus,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 335.w,
        height: 81.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: 1.w, color: Colors.black)),
        child: Container(
          margin: EdgeInsets.only(
            left: 7.w,
            right: 13.w,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Content(
                data: "Order: ${order}",
                size: 16.h,
                family: "Lato",
                weight: FontWeight.w500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: influencerName,
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w500,
                  ),
                  Content(
                    data: "€ ${price}",
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
                    data: Utils.dateFormat1(expiryDate.toString()),
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w500,
                  ),
                  Content(
                    data: orderStatus,
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
    );
  }
}
