import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_influencer_list_view_model.dart';

// ignore: must_be_immutable
class PersonalDetailsScreen extends StatefulWidget {
  String influencerId;

  PersonalDetailsScreen({required this.influencerId, super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  AdminInfluencersViewModel adminInfluencersViewModel =
      AdminInfluencersViewModel();

  @override
  void initState() {
    super.initState();
    // if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
    //   _initializePlayer();
    // }
    adminInfluencersViewModel.fetchInfluencerData(widget.influencerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => adminInfluencersViewModel,
        child: Consumer<AdminInfluencersViewModel>(
            builder: (context, value, child) {
          switch (value.influencerHistoryData.status) {
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
                    data: value.influencerHistoryData.message.toString(),
                    size: 18),
              );
            case Status.COMPLETED:
              var data = value.influencerHistoryData.data!.result!.data;
              final List<String> names = data!.videoTypes!
                  .map((type) => type.videoTypeName as String)
                  .toList(); // Extract video type names

              final List<String> prices =
                  data.videoTypes!.map((type) => type.price as String).toList();
              List<Widget> _buildPriceRows(List<String> prices) {
                List<Widget> rows = [];
                for (int i = 0; i < prices.length; i += 3) {
                  rows.add(
                    Row(
                      children: prices
                          .sublist(
                              i, i + 3 > prices.length ? prices.length : i + 3)
                          .map((price) => Expanded(
                                child: Content(
                                  data: '$price€',
                                  size: 12.h,
                                  family: "Lato",
                                  weight: FontWeight.w400,
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }
                return rows;
              }
              return Column(children: [
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  width: 375.w,
                  height: 31.h,
                  color: Color(0xffD9D9D9).withOpacity(0.7),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
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
                        data: Utils.dateFormat3(data!.createdAt.toString()),
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
                            data: data.name.toString(),
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
                            data: data.email.toString(),
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
                            data: data.countryName.toString(),
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
                            data: data.influencerCategories!.isEmpty
                                ? "Not selected"
                                : data.influencerCategories!.first.name!,
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
                            data: data.username!,
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
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50.h,
                                width: 110.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Content(
                                      data: data.videoTypes!.isEmpty
                                          ? "Not Selected"
                                          : names.join(', '),
                                      size: data.videoTypes!.isEmpty
                                          ? 12.h
                                          : 10.h,
                                      family: "Lato",
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                                width: 93.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Content(
                                      data: data.videoTypes!.isEmpty
                                          ? "Not Selected"
                                          : prices
                                              .map((price) => '$price€')
                                              .join(", "),
                                      size: data.videoTypes!.isEmpty
                                          ? 12.h
                                          : 11.h,
                                      family: "Lato",
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                            data: data.reviewCount.toString(),
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
                            data: data.reviewCount.toString(),
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
                            data: data.reviewCount.toString(),
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
                if (data.status == "Pending")
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 156.w,
                          height: 40.h,
                          child: ElevatedButton(
                            onPressed: () {
                              value.fetchChangeInfluencerStatus(
                                  "Cancelled", widget.influencerId, context,
                                  () {
                                value.fetchInfluencerData(widget.influencerId);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff908B8B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              "Reject",
                              style: TextStyle(
                                  fontSize: 16.h, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.h,
                        ),
                        SizedBox(
                          width: 156.w,
                          height: 40.h,
                          child: ElevatedButton(
                            onPressed: () {
                              value.fetchChangeInfluencerStatus(
                                  "Approved", widget.influencerId, context, () {
                                value.fetchInfluencerData(widget.influencerId);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff5271FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              "Approve",
                              style: TextStyle(
                                  fontSize: 16.h, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ]);
            case null:
          }
          return Container();
        }),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    // SizedBox(
    //   height: 18.h,
    // ),
    // Container(
    //   width: 375.w,
    //   height: 31.h,
    //   color: Color(0xffD9D9D9).withOpacity(0.7),
    //   padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Content(
    //         data: "Personal Detail",
    //         size: 16.h,
    //         family: "Nunito",
    //         weight: FontWeight.w700,
    //       ),
    //       Content(
    //         data: Utils.dateFormat3(widget.createdAt.toString()),
    //         size: 12.h,
    //         family: "Nunito",
    //         weight: FontWeight.w700,
    //       ),
    //     ],
    //   ),
    // ),
    // Container(
    //   margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Name",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.name,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Email",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.email,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Country",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.country,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Influencer Genera",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.genera,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Username",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.username,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
    // SizedBox(
    //   height: 18.h,
    // ),
    // Container(
    //   width: 375.w,
    //   height: 31.h,
    //   color: Color(0xffD9D9D9).withOpacity(0.7),
    //   padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    //   child: Content(
    //     data: "Order Details",
    //     size: 16.h,
    //     family: "Nunito",
    //     weight: FontWeight.w700,
    //   ),
    // ),
    // Container(
    //   margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Videos accepted",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.videoTypes.join(', '),
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Price per video",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.videoPrices
    //                 .map((price) => '$price€')
    //                 .join(", "),
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Total reviews",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.totalReviews,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Total videos made",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.totalVideosMade,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Content(
    //             data: "Total videos rejected",
    //             size: 14.h,
    //             family: "Lato",
    //             weight: FontWeight.w600,
    //           ),
    //           Content(
    //             data: widget.totalVideosRejected,
    //             size: 12.h,
    //             family: "Lato",
    //             weight: FontWeight.w400,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
    // SizedBox(
    //   height: 26.h,
    // ),
    // if (widget.status == "Pending")
    //   Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 12),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Consumer<AdminInfluencersViewModel>(
    //             builder: (context, viewModel, child) {
    //           return SizedBox(
    //             width: 156.w,
    //             height: 40.h,
    //             child: ElevatedButton(
    //               onPressed: () {
    //                 viewModel.fetchChangeInfluencerStatus(
    //                     "Cancelled", widget.influencerId, context);
    //               },
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: Color(0xff908B8B),
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(30.r),
    //                 ),
    //               ),
    //               child: Text(
    //                 "Reject",
    //                 style: TextStyle(fontSize: 16.h, color: Colors.white),
    //               ),
    //             ),
    //           );
    //         }),
    //         SizedBox(
    //           width: 8.h,
    //         ),
    //         Consumer<AdminInfluencersViewModel>(
    //             builder: (context, viewModel, child) {
    //           return SizedBox(
    //             width: 156.w,
    //             height: 40.h,
    //             child: ElevatedButton(
    //               onPressed: () {
    //                 viewModel.fetchChangeInfluencerStatus(
    //                     "Approved", widget.influencerId, context);
    //               },
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: Color(0xff5271FF),
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(30.r),
    //                 ),
    //               ),
    //               child: Text(
    //                 "Approve",
    //                 style: TextStyle(fontSize: 16.h, color: Colors.white),
    //               ),
    //             ),
    //           );
    //         }),
    //       ],
    //     ),
    //   ),
    //     ],
    //   ),
    // );
  }
}
