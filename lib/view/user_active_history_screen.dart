import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_task_detail_view_model.dart';

// ignore: must_be_immutable
class UserActiveHistoryScreen extends StatefulWidget {
  String videoTypeId;
  String status;
  UserActiveHistoryScreen(
      {super.key, required this.videoTypeId, required this.status});

  @override
  State<UserActiveHistoryScreen> createState() =>
      _UserActiveHistoryScreenState();
}

class _UserActiveHistoryScreenState extends State<UserActiveHistoryScreen> {
  UserTaskDetailViewModel userTaskDetailViewModel = UserTaskDetailViewModel();

  @override
  void initState() {
    userTaskDetailViewModel
        .fetchUserActiveHistoryData(widget.videoTypeId.toString());
    super.initState();
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text; // If the string is empty, return as is
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (BuildContext context) => userTaskDetailViewModel,
            child: Consumer<UserTaskDetailViewModel>(
                builder: (context, value, child) {
              switch (value.userActiveHistoryData.status) {
                case Status.INIT:
                  return Container();
                case Status.LOADING:
                  return const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  );
                case Status.ERROR:
                  return Center(
                    child: Content(
                        data: value.userActiveHistoryData.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  var data = value.userActiveHistoryData.data!.data!.first;
                  return Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 20.h, right: 22.w, top: 17.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Content(
                                  data: "Track Order",
                                  size: 22.h,
                                  family: "Nunito",
                                  weight: FontWeight.w700,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Content(
                                  data:
                                      "Price:  €${data.totalPrice.toString()}",
                                  size: 14.h,
                                  family: "Nunito",
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Content(
                                  data:
                                      "Created at: ${Utils.dateFormat2(data.createdAt.toString())}",
                                  size: 14.h,
                                  family: "Nunito",
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Content(
                                  data: "Order ID: ${data.orderId.toString()}",
                                  size: 11.h,
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
                                      "Expires: ${Utils.dateFormat2(data.expiryAt.toString())}",
                                  size: 14.h,
                                  family: "Nunito",
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Content(
                                  data: "Status: ${widget.status.toString()}",
                                  size: 11.h,
                                  family: "Nunito",
                                  weight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 21.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Content(
                              data: "History",
                              size: 16.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                            SizedBox(
                              height: 17.h,
                            ),

                            SizedBox(
                              height: 500.h,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: value
                                    .userActiveHistoryData
                                    .data!
                                    .data!
                                    .length, // Replace with your data list length
                                itemBuilder: (context, index) {
                                  final statusData = value
                                          .userActiveHistoryData.data!.data![
                                      index]; // Replace with your data model
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.grade_rounded,
                                                  size: 10.h,
                                                  color: Colors.green,
                                                ),
                                                Icon(
                                                  Icons
                                                      .missed_video_call_outlined,
                                                  size: 33.h,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Content(
                                                      data:
                                                          _capitalizeFirstLetter(
                                                              statusData
                                                                  .currentStaus
                                                                  .toString()),
                                                      size: 13.h,
                                                      family: "Nunito",
                                                      weight: FontWeight.w600,
                                                    ),
                                                    if (statusData.status ==
                                                        "Order Created")
                                                      Content(
                                                        data:
                                                            "Order ID:${statusData.orderId}",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                    if (statusData.status ==
                                                        "Rejected by influencer")
                                                      Content(
                                                        data:
                                                            "${statusData.requestVideo!.influencer!.name.toString()} rejected the video request.",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                    if (statusData.status ==
                                                        "Rejected by user")
                                                      Content(
                                                        data:
                                                            "${statusData.requestVideo!.user!.name.toString()} rejected the video request.",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                    if (statusData.status ==
                                                        "Rejected")
                                                      Content(
                                                        data:
                                                            "${statusData.requestVideo!.user!.name.toString()} rejected the video request.",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                    if (statusData.status ==
                                                        "waiting video")
                                                      Content(
                                                        data:
                                                            "Waiting for ${statusData.requestVideo!.user!.name.toString()} to accept video.",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                    if (statusData.status ==
                                                        "Accepted by influencer")
                                                      Content(
                                                        data:
                                                            "${statusData.requestVideo!.influencer!.name.toString()} accepted the video request.",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                    if (statusData.status ==
                                                        "Completed")
                                                      Content(
                                                        data:
                                                            "Order ID:${statusData.orderId} Completed",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                    if (statusData.status ==
                                                        "Ask new video")
                                                      Content(
                                                        data:
                                                            "Admin has requested to make new video.",
                                                        size: 12.h,
                                                        family: "Nunito",
                                                        weight: FontWeight.w300,
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30),
                                            child: Content(
                                              data: Utils.formatToTimeOnly(
                                                  statusData.updatedAt
                                                      .toString()),
                                              size: 12.h,
                                              family: "Nunito",
                                              color:
                                                  Colors.grey.withOpacity(0.8),
                                              weight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (index !=
                                          value.userActiveHistoryData.data!
                                                  .data!.length -
                                              1)
                                        Container(
                                          margin: EdgeInsets.only(left: 5.w),
                                          child: Dash(
                                            direction: Axis.vertical,
                                            length: 50.w,
                                            dashLength: 10.w,
                                            dashGap: 5.w,
                                            dashColor: Colors.black,
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),

                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.grade_rounded,
                            //       size: 10.h,
                            //       color: Colors.green,
                            //     ),
                            //     Icon(
                            //       Icons.missed_video_call_outlined,
                            //       size: 33.h,
                            //     ),
                            //     Column(
                            //       // mainAxisAlignment: MainAxisAlignment.start,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Content(
                            //           data: data.status.toString(),
                            //           size: 13.h,
                            //           family: "Nunito",
                            //           weight: FontWeight.w600,
                            //         ),
                            //         Content(
                            //           data:
                            //               "${data.orderId.toString()} ${data.status} video request.",
                            //           size: 12.h,
                            //           family: "Nunito",
                            //           weight: FontWeight.w300,
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(left: 5.w),
                            //   child: Dash(
                            //     direction: Axis.vertical,
                            //     length: 50.w,
                            //     dashLength: 10.w,
                            //     dashGap: 5.w,
                            //     dashColor: Colors.black,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  );
                case null:
              }
              return Container();
            }),
          ),
        ],
      ),
    );
  }
}
