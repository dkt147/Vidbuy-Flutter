import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/influencer_donations_screen.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';

// ignore: must_be_immutable
class ActiveHistoryScreen extends StatefulWidget {
  String videoTypeId;
  ActiveHistoryScreen({super.key, required this.videoTypeId});

  @override
  State<ActiveHistoryScreen> createState() => _ActiveHistoryScreenState();
}

class _ActiveHistoryScreenState extends State<ActiveHistoryScreen> {
  InfluencerTaskDetailViewModel influencerTaskDetailViewModel =
      InfluencerTaskDetailViewModel();

  @override
  void initState() {
    influencerTaskDetailViewModel
        .fetchInfluencerActiveHistoryData(widget.videoTypeId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChangeNotifierProvider(
            create: (BuildContext context) => influencerTaskDetailViewModel,
            child: Consumer<InfluencerTaskDetailViewModel>(
                builder: (context, value, child) {
              switch (value.influencerActiveHistoryData.status) {
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
                        data: value.influencerActiveHistoryData.message
                            .toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  var data = value
                      .influencerActiveHistoryData.data!.result!.requestVideo;
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
                                      "Price:  €${data!.totalPrice.toString()}",
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
                                      "Expires: ${Utils.dateFormat2(data.expiresAt.toString())}",
                                  size: 14.h,
                                  family: "Nunito",
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Content(
                                  data: "Status: ${data.status.toString()}",
                                  size: 14.h,
                                  family: "Nunito",
                                  weight: FontWeight.w400,
                                ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Content(
                            //       data: "Description",
                            //       size: 14.h,
                            //       family: "Lato",
                            //       weight: FontWeight.w600,
                            //     ),
                            //     SizedBox(
                            //       width: 10.w,
                            //     ),
                            //     Content(
                            //       data:
                            //           "This video you will make for my friend on\nhis 29th birthday ",
                            //       size: 12.h,
                            //       family: "Lato",
                            //       weight: FontWeight.w400,
                            //     ),
                            //   ],
                            // ),
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
                            Row(
                              children: [
                                Icon(
                                  Icons.grade_rounded,
                                  size: 10.h,
                                  color: Colors.green,
                                ),
                                Icon(
                                  Icons.missed_video_call_outlined,
                                  size: 33.h,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Content(
                                      data: data.status.toString(),
                                      size: 13.h,
                                      family: "Nunito",
                                      weight: FontWeight.w600,
                                    ),
                                    // SizedBox(
                                    //   height: 8.h,
                                    // ),
                                    Content(
                                      data:
                                          "${data.from.toString()} ${data.status} video request.",
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: 130.h,
                                // ),
                                // Content(data: "11:00", size:12.h, family: "Nunito",weight: FontWeight.w300, ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     Content(
                                //       data: "History",
                                //       size: 16.h,
                                //       family: "Nunito",
                                //       weight: FontWeight.w700,
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
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
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 21.w),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       // Content(
                      //       //   data: "History",
                      //       //   size: 16.h,
                      //       //   family: "Nunito",
                      //       //   weight: FontWeight.w700,
                      //       // ),
                      //       SizedBox(
                      //         height: 17.h,
                      //       ),
                      //       Row(
                      //         children: [
                      //           Icon(
                      //             Icons.grade_rounded,
                      //             size: 10.h,
                      //             color: Colors.green,
                      //           ),
                      //           Icon(
                      //             Icons.missed_video_call_outlined,
                      //             size: 33.h,
                      //           ),
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Content(
                      //                 data: "Accepted / Rejected",
                      //                 size: 13.h,
                      //                 family: "Nunito",
                      //                 weight: FontWeight.w600,
                      //               ),
                      //               // SizedBox(
                      //               //   height: 8.h,
                      //               // ),
                      //               Content(
                      //                 data:
                      //                     "[influencer_name] accepted / rejected video\nrequest.",
                      //                 size: 12.h,
                      //                 family: "Nunito",
                      //                 weight: FontWeight.w300,
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //       Container(
                      //         margin: EdgeInsets.only(left: 5.w),
                      //         child: Dash(
                      //           direction: Axis.vertical,
                      //           length: 50.w,
                      //           dashLength: 10.w,
                      //           dashGap: 5.w,
                      //           dashColor: Colors.black,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 21.w),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       SizedBox(
                      //         height: 17.h,
                      //       ),
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
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Content(
                      //           data: "Accepted / Rejected",
                      //           size: 13.h,
                      //           family: "Nunito",
                      //           weight: FontWeight.w600,
                      //         ),
                      //         // SizedBox(
                      //         //   height: 8.h,
                      //         // ),
                      //         Content(
                      //           data:
                      //               "[influencer_name] accepted / rejected video\nrequest.",
                      //           size: 12.h,
                      //           family: "Nunito",
                      //           weight: FontWeight.w300,
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      //       Container(
                      //         margin: EdgeInsets.only(left: 5.w),
                      //         child: Dash(
                      //           direction: Axis.vertical,
                      //           length: 50.w,
                      //           dashLength: 10.w,
                      //           dashGap: 5.w,
                      //           dashColor: Colors.black,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
