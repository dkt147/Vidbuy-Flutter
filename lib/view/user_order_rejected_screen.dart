import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/user_order_tile.dart';
import 'package:vidbuy_app/resources/componenets/user_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_orders_view_model.dart';

class UserRejectedScreen extends StatefulWidget {
  const UserRejectedScreen({super.key});

  @override
  State<UserRejectedScreen> createState() => _UserRejectedScreenState();
}

class _UserRejectedScreenState extends State<UserRejectedScreen> {
  UserOrdersViewModel userOrdersViewModel = UserOrdersViewModel();

  @override
  void initState() {
    userOrdersViewModel.fetchInfluencerRejectedOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (BuildContext context) => userOrdersViewModel,
            child:
                Consumer<UserOrdersViewModel>(builder: (context, value, child) {
              switch (value.userRejectedOrderList.status) {
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
                        data: value.userRejectedOrderList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return value.userRejectedOrderList.data!.result!.data!
                              .length ==
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
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 70),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: value.userRejectedOrderList.data!
                                  .result!.data!.length,
                              itemBuilder: (context, index) {
                                final influencer = value.userRejectedOrderList
                                    .data!.result!.data![index];

                                return GestureDetector(
                                    onTap: () {
                                      navigate(
                                          context,
                                          UserTaskDetailTabBarWidget(
                                              videoTypeId:
                                                  influencer.id.toString(),
                                              influencerId: influencer
                                                  .influencerId
                                                  .toString(),
                                              createdAt: influencer.createdAt
                                                  .toString(),
                                              orderId:
                                                  influencer.orderId.toString(),
                                              expiresAt: influencer.expiresAt
                                                  .toString(),
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
                                                  .toString(),
                                              videoUrl: (influencer
                                                          .influencerRequestVideos
                                                          ?.isNotEmpty ??
                                                      false)
                                                  ? influencer
                                                          .influencerRequestVideos!
                                                          .first
                                                          .videoUrl ??
                                                      ""
                                                  : "",
                                              reason: influencer.reason
                                                  .toString()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: UserOrderTile(
                                          order: influencer.orderId.toString(),
                                          influencerName: influencer
                                              .influencer!.name
                                              .toString(),
                                          expiryDate:
                                              influencer.expiresAt.toString(),
                                          price:
                                              influencer.totalPrice.toString(),
                                          orderStatus:
                                              influencer.status.toString()),
                                    ));

                                // AllTaskTile(
                                //   category:
                                //       influencer.videoType!.name.toString(),
                                //   price: influencer.totalPrice.toString(),
                                //   date: influencer.expiresAt.toString(),
                                // ));
                              },
                            ),
                          ),
                        );
                case null:
              }
              return Container();
            }),
          )
          // SizedBox(
          //   height: 20.h,
          // ),
        ],
      ),
    );
  }
}

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
