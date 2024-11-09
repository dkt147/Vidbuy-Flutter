import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';

// ignore: must_be_immutable
class UserOrdersDetailsScreen extends StatefulWidget {
  String videoTypeId;
  String createdAt;
  String orderId;
  String expiresAt;
  String status;
  String videoTypeName;
  String from;
  String to;
  String requiredDays;
  String description;
  String totalPrice;

  UserOrdersDetailsScreen(
      {required this.videoTypeId,
      required this.createdAt,
      required this.orderId,
      required this.expiresAt,
      required this.status,
      required this.videoTypeName,
      required this.from,
      required this.to,
      required this.requiredDays,
      required this.description,
      required this.totalPrice,
      super.key});

  @override
  State<UserOrdersDetailsScreen> createState() =>
      _UserOrdersDetailsScreenState();
}

class _UserOrdersDetailsScreenState extends State<UserOrdersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<InfluencerTaskDetailViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data:
                            "Created at: ${Utils.dateFormat2(widget.createdAt)}",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data: "Order ID: ${widget.orderId.toString()}",
                        size: 12.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data:
                            "Expires:  ${Utils.dateFormat2(widget.expiresAt.toString())}",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data:
                            "Status: ${widget.status == "not assigned" ? "Not Assigned" : widget.status}",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 47.h,
            ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Video details",
                size: 12.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "${widget.videoTypeName.toString()} Video",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      Content(
                        data: "From : ",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Content(
                        data: widget.from.toString(),
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Content(
                        data: "To : ",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Content(
                        data: widget.to.toString(),
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Content(
                        data: "Delivery day : ",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Content(
                        data: widget.requiredDays.toString() + " Days",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Content(
                        data: "Description",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                        height: 10.h,
                      ),
                      Content(
                        data: widget.description.toString(),
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Price Detail",
                size: 12.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Total price for this video",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: "€ ${widget.totalPrice} ",
                    size: 12.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
