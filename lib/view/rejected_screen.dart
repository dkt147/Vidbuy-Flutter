import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/influencer_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencers_orders_view_model.dart';

class RejectedScreen extends StatefulWidget {
  final String? date;
  RejectedScreen({super.key, this.date});

  @override
  State<RejectedScreen> createState() => _RejectedScreenState();
}

class _RejectedScreenState extends State<RejectedScreen> {
  InfluencerOrdersViewModel influencersOrdersViewModel =
      InfluencerOrdersViewModel();

  @override
  void initState() {
    super.initState();
    influencersOrdersViewModel.fetchInfluencerRejectedVideoList(widget.date);
  }

  @override
  void didUpdateWidget(covariant RejectedScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.date != widget.date) {
      influencersOrdersViewModel.resetRejectedVideosPagination();
      influencersOrdersViewModel.fetchInfluencerRejectedVideoList(widget.date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => influencersOrdersViewModel,
        child: Consumer<InfluencerOrdersViewModel>(
          builder: (context, value, child) {
            if (value.isRejectedVideosLoading && value.rejectedVideos.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!value.isRejectedVideosLoading &&
                value.rejectedVideos.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Logo/logo.png',
                      height: 177.h,
                      width: 128.w,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "No Orders Currently",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !value.isFetchingMoreRejectedVideos) {
                  value.fetchInfluencerRejectedVideoList(widget.date,
                      isLoadMore: true);
                }
                return false;
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: ListView.builder(
                  itemCount: value.hasMoreRejectedVideos
                      ? value.rejectedVideos.length + 1
                      : value.rejectedVideos.length,
                  itemBuilder: (context, index) {
                    if (index == value.rejectedVideos.length) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final video = value.rejectedVideos[index];
                    return GestureDetector(
                      onTap: () {
                        navigate(
                          context,
                          InfluencerTaskDetailTabBarWidget(
                            videoTypeId: video.id.toString(),
                          ),
                        );
                      },
                      child: AllTaskTile(
                        category: video.videoType!.name.toString(),
                        price: video.totalPrice.toString(),
                        date: video.createdAt.toString(),
                        status: video.status.toString(),
                        orderId: video.orderId.toString(),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class RejectedScreen extends StatefulWidget {
//   String? date;
//   RejectedScreen({super.key, this.date});

//   @override
//   State<RejectedScreen> createState() => _RejectedScreenState();
// }

// class _RejectedScreenState extends State<RejectedScreen> {
//   InfluencerOrdersViewModel influencersOrdersViewModel =
//       InfluencerOrdersViewModel();

//   @override
//   void initState() {
//     super.initState();
//     // influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
//     // Initial API call
//     influencersOrdersViewModel.fetchInfluencerRejectedVideoList(widget.date);
//   }

//   @override
//   void didUpdateWidget(covariant RejectedScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // Check if the date has changed
//     if (oldWidget.date != widget.date) {
//       influencersOrdersViewModel.fetchInfluencerRejectedVideoList(widget.date);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ChangeNotifierProvider(
//             create: (BuildContext context) => influencersOrdersViewModel,
//             child: Consumer<InfluencerOrdersViewModel>(
//                 builder: (context, value, child) {
//               switch (value.influencerRejectedVideoList.status) {
//                 case Status.INIT:
//                   return Container();
//                 case Status.LOADING:
//                   return const Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       ],
//                     ),
//                   );
//                 case Status.ERROR:
//                   return Center(
//                     child: Content(
//                         data: value.influencerRejectedVideoList.message
//                             .toString(),
//                         size: 18),
//                   );
//                 case Status.COMPLETED:
//                   return value.influencerRejectedVideoList.data!.result!.data!
//                           .isEmpty
//                       ? Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Center(
//                                 child: Image.asset(
//                                   'assets/Logo/logo.png',
//                                   height: 177.h,
//                                   width: 128.w,
//                                 ),
//                               ),
//                               SizedBox(height: 16),
//                               const Center(
//                                 child: Text(
//                                   "No Orders Currently",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       : Expanded(
//                           child: ListView.builder(
//                             itemCount: value.influencerRejectedVideoList.data!
//                                 .result!.data!.length,
//                             itemBuilder: (context, index) {
//                               final influencer = value
//                                   .influencerRejectedVideoList
//                                   .data!
//                                   .result!
//                                   .data![index];

//                               return GestureDetector(
//                                   onTap: () {
//                                     navigate(
//                                         context,
//                                         InfluencerTaskDetailTabBarWidget(
//                                             videoTypeId:
//                                                 influencer.id.toString(),
//                                             influencerId: influencer
//                                                 .influencerId
//                                                 .toString(),
//                                             createdAt:
//                                                 influencer.createdAt.toString(),
//                                             orderId:
//                                                 influencer.orderId.toString(),
//                                             expiresAt:
//                                                 influencer.expiresAt.toString(),
//                                             status:
//                                                 influencer.status.toString(),
//                                             videoTypeName: influencer
//                                                 .videoType!.name
//                                                 .toString(),
//                                             from: influencer.from.toString(),
//                                             to: influencer.to.toString(),
//                                             requiredDays: influencer
//                                                 .requiredDays
//                                                 .toString(),
//                                             description: influencer.description
//                                                 .toString(),
//                                             totalPrice: influencer.totalPrice
//                                                 .toString(),
//                                             // videoUrl: influencer
//                                             //     .influencerRequestVideos!
//                                             //     .first.
//                                             //     .videoUrl
//                                             //     .toString(),
//                                             reason:
//                                                 influencer.reason.toString()));
//                                   },
//                                   child: AllTaskTile(
//                                     category:
//                                         influencer.videoType!.name.toString(),
//                                     price: influencer.totalPrice.toString(),
//                                     date: influencer.createdAt.toString(),
//                                   ));

//                             },
//                           ),
//                         );
//                 case null:
//               }
//               return Container();
//             }),
//           ),
//           SizedBox(
//             height: 70.h,
//           )
//           // SizedBox(
//           //   height: 20.h,
//           // ),
//         ],
//       ),
//     );
//   }
// }

// Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Content(
//           data: "No orders yet",
//           size: 20.h,
//           family: "Nunito",
//           weight: FontWeight.w700,
//         ),
//         Content(
//           data: "Your orders will appear here",
//           size: 18.h,
//           family: "Nunito",
//           weight: FontWeight.w400,
//         )
//       ],
