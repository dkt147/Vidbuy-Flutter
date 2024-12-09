import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_task_detail_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class UserOrdersDetailsScreen extends StatefulWidget {
  String videoTypeId;

  UserOrdersDetailsScreen({required this.videoTypeId, super.key});

  @override
  State<UserOrdersDetailsScreen> createState() =>
      _UserOrdersDetailsScreenState();
}

class _UserOrdersDetailsScreenState extends State<UserOrdersDetailsScreen> {
  UserTaskDetailViewModel userTaskDetailViewModel = UserTaskDetailViewModel();
  @override
  void initState() {
    super.initState();
    // if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
    //   _initializePlayer();
    // }

    userTaskDetailViewModel.fetchUserOrderData(widget.videoTypeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => userTaskDetailViewModel,
        child:
            Consumer<UserTaskDetailViewModel>(builder: (context, value, child) {
          switch (value.userOrderData.status) {
            case Status.INIT:
              return Container();
            case Status.LOADING:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            case Status.ERROR:
              return Center(
                child: Content(
                    data: value.userOrderData.message.toString(), size: 18),
              );
            case Status.COMPLETED:
              var data = value.userOrderData.data!.result!.first;
              return Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Content(
                              data:
                                  "Created at: ${Utils.dateFormat2(data.createdAt)}",
                              size: 14.h,
                              family: "Nunito",
                              weight: FontWeight.w400,
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
                            Content(
                              data: "Status: ${data.status}",
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
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: Content(
                      data: AppLocalizations.of(context)!.userVideoDetails,
                      size: 18.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Content(
                            data: "${data.videoType!.name.toString()} Video",
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
                                data: AppLocalizations.of(context)!.userFrom +
                                    ": ",
                                size: 14.h,
                                family: "Lato",
                                weight: FontWeight.w600,
                              ),
                              Content(
                                data: data.from.toString(),
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
                                data:
                                    AppLocalizations.of(context)!.userTo + ": ",
                                size: 14.h,
                                family: "Lato",
                                weight: FontWeight.w600,
                              ),
                              Content(
                                data: data.to.toString(),
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
                                data: AppLocalizations.of(context)!
                                    .userDeliveryDay,
                                size: 14.h,
                                family: "Lato",
                                weight: FontWeight.w600,
                              ),
                              Content(
                                data: "${data.requiredDays} Days",
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
                                data: AppLocalizations.of(context)!
                                        .userDescription +
                                    ": ",
                                size: 14.h,
                                family: "Lato",
                                weight: FontWeight.w600,
                              ),
                              Content(
                                data: data.description.toString(),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: Content(
                      data: AppLocalizations.of(context)!.userPriceDetail,
                      size: 18.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Content(
                          data: AppLocalizations.of(context)!
                              .userTotalPriceForthisVideo,
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w600,
                        ),
                        Content(
                          data: "€ ${data.totalPrice} ",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  if (data.reason != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 80
                                  .h, // Define the height for the scrollable area
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Content(
                                  data: "Reason : ${data.reason.toString()}",
                                  // "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj",

                                  // "Reason : ${data.reason.toString()}",
                                  size: 14.h,
                                  family: "Lato",
                                  weight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
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
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //           height: 10.h,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Content(
    //                     data:
    //                         "Created at: ${Utils.dateFormat2(widget.createdAt)}",
    //                     size: 14.h,
    //                     family: "Nunito",
    //                     weight: FontWeight.w400,
    //                   ),
    //                   Content(
    //                     data: "Order ID: ${widget.orderId.toString()}",
    //                     size: 12.h,
    //                     family: "Nunito",
    //                     weight: FontWeight.w400,
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Content(
    //                     data:
    //                         "Expires: ${Utils.dateFormat2(widget.expiresAt.toString())}",
    //                     size: 14.h,
    //                     family: "Nunito",
    //                     weight: FontWeight.w400,
    //                   ),
    //                   Content(
    //                     data: "Status: ${widget.status}",
    //                     size: 12.h,
    //                     family: "Nunito",
    //                     weight: FontWeight.w400,
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         // SizedBox(
    //         //   height: 47.h,
    //         // ),
    //         Container(
    //           width: 375.w,
    //           height: 31.h,
    //           color: Color(0xff5271FF).withOpacity(0.3),
    //           padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    //           child: Content(
    //             data: "Video Details",
    //             size: 18.h,
    //             family: "Nunito",
    //             weight: FontWeight.w700,
    //           ),
    //         ),

    //         Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 5),
    //                 child: Content(
    //                   data: "${widget.videoTypeName.toString()} Video",
    //                   size: 14.h,
    //                   family: "Lato",
    //                   weight: FontWeight.w600,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 5),
    //                 child: Row(
    //                   children: [
    //                     Content(
    //                       data: "From: ",
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w600,
    //                     ),
    //                     Content(
    //                       data: widget.from.toString(),
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w400,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 5),
    //                 child: Row(
    //                   children: [
    //                     Content(
    //                       data: "To: ",
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w600,
    //                     ),
    //                     Content(
    //                       data: widget.to.toString(),
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w400,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 5),
    //                 child: Row(
    //                   children: [
    //                     Content(
    //                       data: "Delivery day: ",
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w600,
    //                     ),
    //                     Content(
    //                       data: widget.requiredDays.toString() + " Days",
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w400,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 5),
    //                 child: Row(
    //                   children: [
    //                     Content(
    //                       data: "Description: ",
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w600,
    //                     ),
    //                     Content(
    //                       data: widget.description.toString(),
    //                       size: 14.h,
    //                       family: "Lato",
    //                       weight: FontWeight.w400,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           width: 375.w,
    //           height: 31.h,
    //           color: Color(0xff5271FF).withOpacity(0.3),
    //           padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
    //           child: Content(
    //             data: "Price Detail",
    //             size: 18.h,
    //             family: "Nunito",
    //             weight: FontWeight.w700,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Content(
    //                 data: "Total price for this video",
    //                 size: 14.h,
    //                 family: "Lato",
    //                 weight: FontWeight.w600,
    //               ),
    //               Content(
    //                 data: "€ ${widget.totalPrice} ",
    //                 size: 14.h,
    //                 family: "Lato",
    //                 weight: FontWeight.w400,
    //               ),
    //             ],
    //           ),
    //         ),
    //         if (widget.reason != "null")
    //           Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Content(
    //                   data: "Reason : ${widget.reason.toString()}",
    //                   size: 14.h,
    //                   family: "Lato",
    //                   weight: FontWeight.w600,
    //                 ),
    //               ],
    //             ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
