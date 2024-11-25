import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencers_orders_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/setting_view_model.dart';

// ignore: must_be_immutable
class AllOrdersScreen extends StatefulWidget {
  String? date;
  AllOrdersScreen({super.key, this.date});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  // InfluencerOrdersViewModel influencersOrdersViewModel =
  //     InfluencerOrdersViewModel();

  InfluencerOrdersViewModel influencersOrdersViewModel =
      InfluencerOrdersViewModel();

  @override
  void initState() {
    super.initState();
    // influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
    // Initial API call
    influencersOrdersViewModel.fetchInfluencerAllOrdersList(widget.date);
  }

  @override
  void didUpdateWidget(covariant AllOrdersScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the date has changed
    if (oldWidget.date != widget.date) {
      influencersOrdersViewModel.fetchInfluencerAllOrdersList(widget.date);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
    // influencersOrdersViewModel.fetchInfluencerAllOrdersList(widget.date);
    return Scaffold(
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (BuildContext context) => influencersOrdersViewModel,
            child: Consumer<InfluencerOrdersViewModel>(
                builder: (context, value, child) {
              switch (value.influencerAllOrdersList.status) {
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
                        data: value.influencerAllOrdersList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return value.influencerAllOrdersList!.data!.result!.orders!
                              .data!.length ==
                          0
                      ? Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/Logo/logo.png',
                                  height: 177.h,
                                  width: 128.w,
                                ),
                              ),
                              SizedBox(height: 16),
                              Center(
                                child: Text(
                                  "No Orders Currently",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: value.influencerAllOrdersList.data!
                                .result!.orders!.data!.length,
                            itemBuilder: (context, index) {
                              final influencer = value.influencerAllOrdersList
                                  .data!.result!.orders!.data![index];

                              return GestureDetector(
                                  onTap: () {
                                    navigate(
                                        context,
                                        InfluencerTaskDetailTabBarWidget(
                                            videoTypeId:
                                                influencer.id.toString(),
                                            influencerId: influencer
                                                .influencerId
                                                .toString(),
                                            createdAt:
                                                influencer.createdAt.toString(),
                                            orderId:
                                                influencer.orderId.toString(),
                                            expiresAt:
                                                influencer.expiresAt.toString(),
                                            status:
                                                influencer.status.toString(),
                                            videoTypeName: influencer
                                                .videoType!.name
                                                .toString(),
                                            from: influencer.from.toString(),
                                            to: influencer.to.toString(),
                                            requiredDays: influencer
                                                .requiredDays
                                                .toString(),
                                            description: influencer.description
                                                .toString(),
                                            totalPrice: influencer.totalPrice
                                                .toString()));
                                  },
                                  child: AllTaskTile(
                                    category:
                                        influencer.videoType!.name.toString(),
                                    price: influencer.totalPrice.toString(),
                                    date: influencer.createdAt.toString(),
                                  ));
                            },
                          ),
                        );
                case null:
              }
              return Container();
            }),
          ),
                    SizedBox(height: 70.h,)
        ],
      ),
    );
  }
}
// SizedBox(
//   height: 20.h,
// ),
// Center(
//   child: Container(
//     width: 335.w,
//     height: 81.h,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         border: Border.all(width: 1.w, color: Colors.black)),
//     child: Container(
//       margin: EdgeInsets.only(
//         left: 7.w,
//         right: 13.w,
//       ),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // SizedBox(
//           //   height: 7.h,
//           // ),
//           // Content(
//           //   data: "Order: [random]",
//           //   size: 16.h,
//           //   family: "Lato",
//           //   weight: FontWeight.w500,
//           // ),
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     Content(
//           //       data: "Salena Gomez",
//           //       size: 14.h,
//           //       family: "Lato",
//           //       weight: FontWeight.w500,
//           //     ),
//           //     Content(
//           //       data: "Salena Gomez",
//           //       size: 14.h,
//           //       family: "Lato",
//           //       weight: FontWeight.w500,
//           //     ),
//           //   ],
//           // ),
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     Content(
//           //       data: "MMMed",
//           //       size: 14.h,
//           //       family: "Lato",
//           //       weight: FontWeight.w500,
//           //     ),
//           //     Content(
//           //       data: "[status_order]",
//           //       size: 14.h,
//           //       family: "Lato",
//           //       weight: FontWeight.w500,
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     ),
//   ),
// )
