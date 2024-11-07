import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/view/influencer_donations_screen.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencers_orders_view_model.dart';

class ActiveHistoryScreen extends StatefulWidget {
  const ActiveHistoryScreen({super.key});

  @override
  State<ActiveHistoryScreen> createState() => _ActiveHistoryScreenState();
}

class _ActiveHistoryScreenState extends State<ActiveHistoryScreen> {
  InfluencerOrdersViewModel influencersOrdersViewModel =
      InfluencerOrdersViewModel();

  @override
  void initState() {
    influencersOrdersViewModel.fetchInfluencerWaitingVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChangeNotifierProvider(
            create: (BuildContext context) => influencersOrdersViewModel,
            child: Consumer<InfluencerOrdersViewModel>(
                builder: (context, value, child) {
              switch (value.influencerWaitingVideoList.status) {
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
                        data:
                            value.influencerWaitingVideoList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
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
                                  data: "Price:  €1234.56",
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
                                  data: "Created at::Wed, 5 Sep",
                                  size: 14.h,
                                  family: "Nunito",
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Content(
                                  data: "Order ID: 5ts638393",
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
                                  data: "Expires::Wed, 12 Sep",
                                  size: 14.h,
                                  family: "Nunito",
                                  weight: FontWeight.w400,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Content(
                                  data: "Status: [Status_order]",
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
                      GestureDetector(
                        onTap: () {
                          navigate(context, InfluencerDonationsScreen());
                        },
                        child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Content(
                                        data: "Accepted / Rejected",
                                        size: 13.h,
                                        family: "Nunito",
                                        weight: FontWeight.w600,
                                      ),
                                      // SizedBox(
                                      //   height: 8.h,
                                      // ),
                                      Content(
                                        data:
                                            "[influencer_name] accepted / rejected video\nrequest.",
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
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 21.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Content(
                            //   data: "History",
                            //   size: 16.h,
                            //   family: "Nunito",
                            //   weight: FontWeight.w700,
                            // ),
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
                                      data: "Accepted / Rejected",
                                      size: 13.h,
                                      family: "Nunito",
                                      weight: FontWeight.w600,
                                    ),
                                    // SizedBox(
                                    //   height: 8.h,
                                    // ),
                                    Content(
                                      data:
                                          "[influencer_name] accepted / rejected video\nrequest.",
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
                      Container(
                        margin: EdgeInsets.only(left: 21.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Content(
                            //   data: "History",
                            //   size: 16.h,
                            //   family: "Nunito",
                            //   weight: FontWeight.w700,
                            // ),
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
                                      data: "Accepted / Rejected",
                                      size: 13.h,
                                      family: "Nunito",
                                      weight: FontWeight.w600,
                                    ),
                                    // SizedBox(
                                    //   height: 8.h,
                                    // ),
                                    Content(
                                      data:
                                          "[influencer_name] accepted / rejected video\nrequest.",
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
                      // ListTile(
                      //   leading: Icon(
                      //           Icons.grade_rounded,
                      //           size: 10.h,
                      //           color: Colors.green,
                      //         ),
                      //       //   title:    Dash(
                      //       //   direction: Axis.horizontal,
                      //       //   length: 50.w,
                      //       //   dashLength: 10.w,
                      //       //   dashGap: 5.w,
                      //       //   dashColor: Colors.black,
                      //       // ),

                      //         title: Icon(
                      //           Icons.missed_video_call_outlined,
                      //           size: 33.h,
                      //         ),

                      //         // subtitle:

                      //       trailing: Content(
                      //               data: "History",
                      //               size: 16.h,
                      //               family: "Nunito",
                      //               weight: FontWeight.w700,
                      //             ),
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
