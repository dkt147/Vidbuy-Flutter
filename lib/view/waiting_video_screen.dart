import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/influencer_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencers_orders_view_model.dart';

import '../resources/componenets/content.dart';

class WaitingVideoScreen extends StatefulWidget {
  final String? date;
  WaitingVideoScreen({super.key, required this.date});

  @override
  State<WaitingVideoScreen> createState() => _WaitingVideoScreenState();
}

class _WaitingVideoScreenState extends State<WaitingVideoScreen> {
  InfluencerOrdersViewModel influencersOrdersViewModel =
      InfluencerOrdersViewModel();

  @override
  void initState() {
    super.initState();
    influencersOrdersViewModel.fetchInfluencerWaitingVideoList(widget.date);
  }

  @override
  void didUpdateWidget(covariant WaitingVideoScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.date != widget.date) {
      influencersOrdersViewModel.resetWaitingVideosPagination();
      influencersOrdersViewModel.fetchInfluencerWaitingVideoList(widget.date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => influencersOrdersViewModel,
      child: Consumer<InfluencerOrdersViewModel>(
        builder: (context, value, child) {
          if (value.isWaitingVideosLoading && value.waitingVideos.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!value.isWaitingVideosLoading && value.waitingVideos.isEmpty) {
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
                    "No Videos Currently",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !value.isFetchingMoreWaitingVideos) {
                value.fetchInfluencerWaitingVideoList(widget.date,
                    isLoadMore: true);
              }
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: ListView.builder(
                itemCount: value.waitingVideos.length +
                    (value.isFetchingMoreWaitingVideos ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == value.waitingVideos.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final video = value.waitingVideos[index];
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
    );
  }
}

// class WaitingVideoScreen extends StatefulWidget {
//   String? date;
//   WaitingVideoScreen({super.key, required this.date});

//   @override
//   State<WaitingVideoScreen> createState() => _WaitingVideoScreenState();
// }

// class _WaitingVideoScreenState extends State<WaitingVideoScreen> {
//   InfluencerOrdersViewModel influencersOrdersViewModel =
//       InfluencerOrdersViewModel();

//   @override
//   void initState() {
//     super.initState();
//     // influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
//     // Initial API call
//     influencersOrdersViewModel.fetchInfluencerWaitingVideoList(widget.date);
//   }

//   @override
//   void didUpdateWidget(covariant WaitingVideoScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // Check if the date has changed
//     if (oldWidget.date != widget.date) {
//       influencersOrdersViewModel.fetchInfluencerWaitingVideoList(widget.date);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ChangeNotifierProvider(
//           create: (BuildContext context) => influencersOrdersViewModel,
//           child: Consumer<InfluencerOrdersViewModel>(
//               builder: (context, value, child) {
//             switch (value.influencerWaitingVideoList.status) {
//               case Status.INIT:
//                 return Container();
//               case Status.LOADING:
//                 return const Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     ],
//                   ),
//                 );
//               case Status.ERROR:
//                 return Center(
//                   child: Content(
//                       data: value.influencerWaitingVideoList.message.toString(),
//                       size: 18),
//                 );
//               case Status.COMPLETED:
//                 return value.influencerWaitingVideoList!.data!.result!
//                             .waitingVideoList!.data!.length ==
//                         0
//                     ? Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Center(
//                               child: Image.asset(
//                                 'assets/Logo/logo.png',
//                                 height: 177.h,
//                                 width: 128.w,
//                               ),
//                             ),
//                             SizedBox(height: 16),
//                             Center(
//                               child: Text(
//                                 "No Orders Currently",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : Expanded(
//                         child: ListView.builder(
//                           itemCount: value.influencerWaitingVideoList.data!
//                               .result!.waitingVideoList!.data!.length,
//                           itemBuilder: (context, index) {
//                             final influencer = value.influencerWaitingVideoList
//                                 .data!.result!.waitingVideoList!.data![index];

//                             return GestureDetector(
//                                 onTap: () {
//                                   navigate(
//                                       context,
//                                       InfluencerTaskDetailTabBarWidget(
//                                           videoTypeId: influencer.id.toString(),
//                                           influencerId: influencer.influencerId
//                                               .toString(),
//                                           createdAt:
//                                               influencer.createdAt.toString(),
//                                           orderId:
//                                               influencer.orderId.toString(),
//                                           expiresAt:
//                                               influencer.expiresAt.toString(),
//                                           status: influencer.status.toString(),
//                                           videoTypeName: influencer
//                                               .videoType!.name
//                                               .toString(),
//                                           from: influencer.from.toString(),
//                                           to: influencer.to.toString(),
//                                           requiredDays: influencer.requiredDays
//                                               .toString(),
//                                           description:
//                                               influencer.description.toString(),
//                                           totalPrice:
//                                               influencer.totalPrice.toString(),
//                                           videoUrl: influencer
//                                               .influencerRequestVideos!
//                                               .first
//                                               .videoUrl
//                                               .toString()));
//                                 },
//                                 child: AllTaskTile(
//                                   category:
//                                       influencer.videoType!.name.toString(),
//                                   price: influencer.totalPrice.toString(),
//                                   date: influencer.createdAt.toString(),
//                                 ));
//                           },
//                         ),
//                       );
//               case null:
//             }
//             return Container();
//           }),
//         ),
//         SizedBox(
//           height: 70.h,
//         )
//       ],
//     );
//   }
// }
