import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/datum.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/influencer_order_cancel_screen.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';

// ignore: must_be_immutable
class OrdersDetailsScreen extends StatefulWidget {
  String videoTypeId;

  OrdersDetailsScreen({required this.videoTypeId, super.key});

  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();
}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  InfluencerTaskDetailViewModel influencerTaskDetailViewModel =
      InfluencerTaskDetailViewModel();

  @override
  void initState() {
    super.initState();

    influencerTaskDetailViewModel.fetchOrderData(widget.videoTypeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => influencerTaskDetailViewModel,
        child: Consumer<InfluencerTaskDetailViewModel>(
            builder: (context, value, child) {
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
                                  "Expires:  ${Utils.dateFormat2(data.expiresAt.toString())}",
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
                      data: "Video details",
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
                                data: "From: ",
                                size: 14.h,
                                family: "Lato",
                                weight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Content(
                                data: data.from.toString(),
                                size: 12.h,
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
                              SizedBox(
                                width: 10.w,
                              ),
                              Content(
                                data: data.to.toString(),
                                size: 12.h,
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
                              SizedBox(
                                width: 10.w,
                              ),
                              Content(
                                data: data.requiredDays.toString() + " Days",
                                size: 12.h,
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
                              SizedBox(
                                width: 10.w,
                                height: 10.h,
                              ),
                              Content(
                                data: data.description.toString(),
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

                  Container(
                    width: 375.w,
                    height: 31.h,
                    color: Color(0xff5271FF).withOpacity(0.3),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: Content(
                      data: "Price Detail",
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
                          data: "Total price for this video",
                          size: 14.h,
                          family: "Lato",
                          weight: FontWeight.w600,
                        ),
                        Content(
                          data: "€ ${data.totalPrice} ",
                          size: 12.h,
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
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 0, horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Content(
                  //         data:
                  //             "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj",
                  //         // "Reason : ${data.reason.toString()}",
                  //         size: 14.h,
                  //         family: "Lato",
                  //         weight: FontWeight.w600,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  if (data.status == "Order Created")
                    Column(
                      children: [
                        Consumer<InfluencerTaskDetailViewModel>(
                          builder: (context, viewModel, child) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 150, bottom: 20),
                              child: Container(
                                width: 240.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: viewModel.loading
                                      ? null // Disable button if loading
                                      : () {
                                          viewModel.fetchUploadStatusData(
                                              context,
                                              videoTypeId: widget.videoTypeId
                                                  .toString(), func: () {
                                            value.fetchOrderData(
                                                widget.videoTypeId);
                                          });
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff5271FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                  ),
                                  child: viewModel.loading
                                      ? CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        )
                                      : Text(
                                          "Accept",
                                          style: TextStyle(
                                            fontSize: 20.h,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            );
                          },
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(top: 200, bottom: 20),
                        //   child: Center(
                        //     child: SizedBox(
                        //       width: 280.w,
                        //       height: 50.h,
                        //       child: ElevatedButton(
                        //         onPressed: () {
                        //           // viewModel.fetchUploadVideoData(context, file: File(viewModel.videoPath!), requestVideoId: "1");
                        //         },
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: Color(0xff5271FF),
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(30.r),
                        //           ),
                        //         ),
                        //         child: Text(
                        //           "Accept",
                        //           style: TextStyle(
                        //             fontSize: 16.h,
                        //             color: Colors.white,
                        //             fontFamily: "Lato",
                        //             fontWeight: FontWeight.w700,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Center(
                          child: SizedBox(
                            width: 240.w,
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {
                                navigate(
                                    context,
                                    InfluencerOrderCancelScreen(
                                      videoTypeId: widget.videoTypeId,
                                      influencerTaskDetailViewModel: value,
                                    ));
                                // viewModel.fetchUploadVideoData(context, file: File(viewModel.videoPath!), requestVideoId: "1");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff5271FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                              child: Text(
                                "Reject",
                                style: TextStyle(
                                  fontSize: 20.h,
                                  color: Colors.white,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
    //                         "Expires:  ${Utils.dateFormat2(widget.expiresAt.toString())}",
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
    //             data: "Video details",
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
    //                     SizedBox(
    //                       width: 10.w,
    //                     ),
    //                     Content(
    //                       data: widget.from.toString(),
    //                       size: 12.h,
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
    //                     SizedBox(
    //                       width: 10.w,
    //                     ),
    //                     Content(
    //                       data: widget.to.toString(),
    //                       size: 12.h,
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
    //                     SizedBox(
    //                       width: 10.w,
    //                     ),
    //                     Content(
    //                       data: widget.requiredDays.toString() + " Days",
    //                       size: 12.h,
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
    //                     SizedBox(
    //                       width: 10.w,
    //                       height: 10.h,
    //                     ),
    //                     Content(
    //                       data: widget.description.toString(),
    //                       size: 12.h,
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
    //                 size: 12.h,
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
    //         if (widget.status == "Order Created")
    //           Column(
    //             children: [
    //               Consumer<InfluencerTaskDetailViewModel>(
    //                 builder: (context, viewModel, child) {
    //                   return Padding(
    //                     padding: const EdgeInsets.only(top: 200, bottom: 20),
    //                     child: Container(
    //                       width: 280.w,
    //                       height: 50.h,
    //                       child: ElevatedButton(
    //                         onPressed: viewModel.loading
    //                             ? null // Disable button if loading
    //                             : () {
    //                                 viewModel.fetchUploadStatusData(context,
    //                                     videoTypeId:
    //                                         widget.videoTypeId.toString());
    //                               },
    //                         style: ElevatedButton.styleFrom(
    //                           backgroundColor: Color(0xff5271FF),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(30.r),
    //                           ),
    //                         ),
    //                         child: viewModel.loading
    //                             ? CircularProgressIndicator(
    //                                 valueColor: AlwaysStoppedAnimation<Color>(
    //                                     Colors.white),
    //                               )
    //                             : Text(
    //                                 "Accept",
    //                                 style: TextStyle(
    //                                   fontSize: 20.h,
    //                                   fontFamily: "Lato",
    //                                   fontWeight: FontWeight.w700,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),

    //               // Padding(
    //               //   padding: const EdgeInsets.only(top: 200, bottom: 20),
    //               //   child: Center(
    //               //     child: SizedBox(
    //               //       width: 280.w,
    //               //       height: 50.h,
    //               //       child: ElevatedButton(
    //               //         onPressed: () {
    //               //           // viewModel.fetchUploadVideoData(context, file: File(viewModel.videoPath!), requestVideoId: "1");
    //               //         },
    //               //         style: ElevatedButton.styleFrom(
    //               //           backgroundColor: Color(0xff5271FF),
    //               //           shape: RoundedRectangleBorder(
    //               //             borderRadius: BorderRadius.circular(30.r),
    //               //           ),
    //               //         ),
    //               //         child: Text(
    //               //           "Accept",
    //               //           style: TextStyle(
    //               //             fontSize: 16.h,
    //               //             color: Colors.white,
    //               //             fontFamily: "Lato",
    //               //             fontWeight: FontWeight.w700,
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //   ),
    //               // ),
    //               Center(
    //                 child: SizedBox(
    //                   width: 280.w,
    //                   height: 50.h,
    //                   child: ElevatedButton(
    //                     onPressed: () {
    //                       navigate(
    //                           context,
    //                           InfluencerOrderCancelScreen(
    //                               videoTypeId: widget.videoTypeId));
    //                       // viewModel.fetchUploadVideoData(context, file: File(viewModel.videoPath!), requestVideoId: "1");
    //                     },
    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: Color(0xff5271FF),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(30.r),
    //                       ),
    //                     ),
    //                     child: Text(
    //                       "Reject",
    //                       style: TextStyle(
    //                         fontSize: 20.h,
    //                         color: Colors.white,
    //                         fontFamily: "Lato",
    //                         fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
