import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/datum.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class OrdersDetailsScreen extends StatefulWidget {
  Datum data;
  OrdersDetailsScreen({required this.data, super.key});

  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();
}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
                            "Created at: ${Utils.dateFormat2(widget.data.createdAt)}",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data: "Order ID: SG^&HH",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Expires: ",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data:
                            "Status: ${widget.data.status == "" ? "Not Assigned" : widget.data.status}",
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
                    data: "${widget.data.videoType!.name.toString()} Video",
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
                        data: widget.data.from.toString(),
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
                        data: widget.data.to.toString(),
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
                        data: widget.data.requiredDays.toString() + " Days",
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
                        data: widget.data.description.toString(),
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
                    data: "€ ${widget.data.totalPrice} ",
                    size: 12.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            if (widget.data.status == "")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 250),
                child: Center(
                  child: SizedBox(
                    width: 280.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // viewModel.fetchUploadVideoData(context, file: File(viewModel.videoPath!), requestVideoId: "1");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5271FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontSize: 16.h,
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.data.status == "pending")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 250),
                child: Center(
                  child: SizedBox(
                    width: 280.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // viewModel.fetchUploadVideoData(context, file: File(viewModel.videoPath!), requestVideoId: "1");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5271FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Start Working",
                        style: TextStyle(
                          fontSize: 16.h,
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
