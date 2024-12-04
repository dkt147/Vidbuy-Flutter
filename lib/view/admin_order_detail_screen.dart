import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';

// ignore: must_be_immutable
class AdminOrdersDetailsScreen extends StatefulWidget {
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
  String buyerName;
  String buyerUsername;
  String buyerEmail;
  String influencerName;
  String influencerUsername;
  String influencerEmail;
  String? reason;

  AdminOrdersDetailsScreen(
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
      required this.buyerName,
      required this.buyerUsername,
      required this.buyerEmail,
      required this.influencerName,
      required this.influencerEmail,
      required this.influencerUsername,
      this.reason,
      super.key});

  @override
  State<AdminOrdersDetailsScreen> createState() =>
      _AdminOrdersDetailsScreenState();
}

class _AdminOrdersDetailsScreenState extends State<AdminOrdersDetailsScreen> {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            "Expires: ${Utils.dateFormat2(widget.expiresAt.toString())}",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data: "Status: ${widget.status}",
                        size: 12.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 47.h,
            // ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Video Details",
                size: 18.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Content(
                      data: "${widget.videoTypeName.toString()} Video",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Content(
                          data: "From: ",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w600,
                        ),
                        Content(
                          data: widget.from.toString(),
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Content(
                          data: "To: ",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w600,
                        ),
                        Content(
                          data: widget.to.toString(),
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Content(
                          data: "Delivery day: ",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w600,
                        ),
                        Content(
                          data: widget.requiredDays.toString() + " Days",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Content(
                          data: "Description: ",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w600,
                        ),
                        Content(
                          data: widget.description.toString(),
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Price Detail",
                size: 18.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),

            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Influencer Details",
                size: 18.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Name",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: widget.influencerName,
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Email",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: widget.influencerEmail,
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Username",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: widget.influencerUsername,
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),

            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Buyer Details",
                size: 18.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Name",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: widget.buyerName,
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Email",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: widget.buyerEmail.toString(),
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Username",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: widget.buyerUsername,
                    size: 14.h,
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
