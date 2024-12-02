import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_influencer_list_view_model.dart';

// ignore: must_be_immutable
class PersonalDetailsScreen extends StatefulWidget {
  String influencerId;
  String status;
  String name;
  String email;
  String country;
  String genera;
  String username;
  String videosAccepted;
  String pricePerVideo;
  String totalReviews;
  String totalVideosMade;
  String totalVideosRejected;
  String createdAt;
  List<String> videoTypes;
  List<String> videoPrices;

  PersonalDetailsScreen(
      {required this.influencerId,
      required this.status,
      required this.name,
      required this.email,
      required this.country,
      required this.genera,
      required this.username,
      required this.videosAccepted,
      required this.pricePerVideo,
      required this.totalReviews,
      required this.totalVideosMade,
      required this.totalVideosRejected,
      required this.createdAt,
      required this.videoTypes,
      required this.videoPrices,
      super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AdminInfluencersViewModel>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Container(
            width: 375.w,
            height: 31.h,
            color: Color(0xffD9D9D9).withOpacity(0.7),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Content(
                  data: "Personal Detail",
                  size: 16.h,
                  family: "Nunito",
                  weight: FontWeight.w700,
                ),
                Content(
                  data: Utils.dateFormat3(widget.createdAt.toString()),
                  size: 12.h,
                  family: "Nunito",
                  weight: FontWeight.w700,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Name",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.name,
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Email",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.email,
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Country",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.country,
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Influencer Genera",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.genera,
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Username",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.username,
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
            height: 18.h,
          ),
          Container(
            width: 375.w,
            height: 31.h,
            color: Color(0xffD9D9D9).withOpacity(0.7),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            child: Content(
              data: "Order Details",
              size: 16.h,
              family: "Nunito",
              weight: FontWeight.w700,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Videos accepted",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.videoTypes.join(', '),
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Price per video",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.videoPrices
                          .map((price) => '$price€')
                          .join(", "),
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Total reviews",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.totalReviews,
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Total videos made",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.totalVideosMade,
                      size: 12.h,
                      family: "Lato",
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Total videos rejected",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.totalVideosRejected,
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
            height: 26.h,
          ),
          if (widget.status == "Pending")
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<AdminInfluencersViewModel>(
                      builder: (context, viewModel, child) {
                    return SizedBox(
                      width: 156.w,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.fetchChangeInfluencerStatus(
                              "Cancelled", widget.influencerId, context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff908B8B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: Text(
                          "Reject",
                          style: TextStyle(fontSize: 16.h, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    width: 8.h,
                  ),
                  Consumer<AdminInfluencersViewModel>(
                      builder: (context, viewModel, child) {
                    return SizedBox(
                      width: 156.w,
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.fetchChangeInfluencerStatus(
                              "Approved", widget.influencerId, context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5271FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: Text(
                          "Approve",
                          style: TextStyle(fontSize: 16.h, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
