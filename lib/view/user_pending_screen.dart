import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/user_order_tile.dart';
import 'package:vidbuy_app/resources/componenets/user_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_orders_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPendingScreen extends StatefulWidget {
  const UserPendingScreen({super.key});

  @override
  State<UserPendingScreen> createState() => _UserPendingScreenState();
}

class _UserPendingScreenState extends State<UserPendingScreen> {
  late UserOrdersViewModel userOrdersViewModel;

  @override
  void initState() {
    super.initState();
    userOrdersViewModel = UserOrdersViewModel();
    userOrdersViewModel.fetchUserPendingOrdersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => userOrdersViewModel,
        child:
            Consumer<UserOrdersViewModel>(builder: (context, viewModel, child) {
          return Column(
            children: [
              if (viewModel.isPendingOrderFetching &&
                  viewModel.pendingOrders.isEmpty)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (!viewModel.isPendingOrderFetching &&
                  viewModel.pendingOrders.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Logo/logo.png',
                          height: 177.h,
                          width: 128.w,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.userNoOrdersCurrently,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent &&
                          !viewModel.isPendingOrderFetching &&
                          viewModel.hasPendingOrdersMoreData) {
                        viewModel.fetchUserPendingOrdersList();
                        return true;
                      }
                      return false;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: ListView.builder(
                          itemCount: viewModel.pendingOrders.length +
                              (viewModel.isPendingOrderFetching ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == viewModel.pendingOrders.length) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            final influencer = viewModel.pendingOrders[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () {
                                  navigate(
                                      context,
                                      UserTaskDetailTabBarWidget(
                                          videoTypeId: influencer.id.toString(),
                                          influencerId: influencer.influencerId
                                              .toString(),
                                          createdAt:
                                              influencer.createdAt.toString(),
                                          orderId:
                                              influencer.orderId.toString(),
                                          expiresAt:
                                              influencer.expiresAt.toString(),
                                          status: influencer.status.toString(),
                                          videoTypeName: influencer
                                              .videoType!.name
                                              .toString(),
                                          from: influencer.from.toString(),
                                          to: influencer.to.toString(),
                                          requiredDays: influencer.requiredDays
                                              .toString(),
                                          description:
                                              influencer.description.toString(),
                                          totalPrice: influencer.totalPrice
                                              .toString()));
                                },
                                child: UserOrderTile(
                                    order: influencer.orderId.toString(),
                                    influencerName:
                                        influencer.influencer!.name.toString(),
                                    expiryDate: influencer.expiresAt.toString(),
                                    price: influencer.totalPrice.toString(),
                                    orderStatus: influencer.status.toString()),
                              ),
                            );
                          }),

                      // AllTaskTile(
                      //   category:
                      //       influencer.videoType!.name.toString(),
                      //   price: influencer.totalPrice.toString(),
                      //   date: influencer.createdAt.toString(),
                      // )),
                    ),
                  ),
                )
            ],
          );

          // switch (value.userPendingOrdersList.status) {
          //   case Status.INIT:
          //     return Container();
          //   case Status.LOADING:
          //     return const Expanded(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         mainAxisSize: MainAxisSize.max,
          //         children: [
          //           Center(
          //             child: CircularProgressIndicator(),
          //           ),
          //         ],
          //       ),
          //     );
          //   case Status.ERROR:
          //     return Center(
          //       child: Content(
          //           data: value.userPendingOrdersList.message.toString(),
          //           size: 18),
          //     );
          //   case Status.COMPLETED:
          //     return value.userPendingOrdersList.data!.result!.data!
          //                 .length ==
          //             0
          //         ? Expanded(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               mainAxisSize: MainAxisSize.max,
          //               children: [
          //                 Center(
          //                   child: Image.asset(
          //                     'assets/Logo/logo.png',
          //                     height: 177.h,
          //                     width: 128.w,
          //                   ),
          //                 ),
          //                 SizedBox(height: 16),
          //                 Center(
          //                   child: Text(
          //                     "No Orders Currently",
          //                     style: TextStyle(
          //                         fontSize: 20,
          //                         fontWeight: FontWeight.bold),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           )
          //         : Expanded(
          //             child: Padding(
          //               padding: const EdgeInsets.only(bottom: 70),
          //               child: ListView.builder(
          //                 itemCount: value.userPendingOrdersList.data!
          //                     .result!.data!.length,
          //                 itemBuilder: (context, index) {
          //                   final influencer = value.userPendingOrdersList
          //                       .data!.result!.data![index];

          //                   return Padding(
          //                     padding:
          //                         const EdgeInsets.symmetric(vertical: 10),
          //                     child: GestureDetector(
          //                         onTap: () {
          //                           navigate(
          //                               context,
          //                               UserTaskDetailTabBarWidget(
          //                                   videoTypeId:
          //                                       influencer.id.toString(),
          //                                   influencerId: influencer
          //                                       .influencerId
          //                                       .toString(),
          //                                   createdAt: influencer.createdAt
          //                                       .toString(),
          //                                   orderId: influencer.orderId
          //                                       .toString(),
          //                                   expiresAt: influencer.expiresAt
          //                                       .toString(),
          //                                   status: influencer.status
          //                                       .toString(),
          //                                   videoTypeName: influencer
          //                                       .videoType!.name
          //                                       .toString(),
          //                                   from:
          //                                       influencer.from.toString(),
          //                                   to: influencer.to.toString(),
          //                                   requiredDays: influencer
          //                                       .requiredDays
          //                                       .toString(),
          //                                   description: influencer
          //                                       .description
          //                                       .toString(),
          //                                   totalPrice: influencer
          //                                       .totalPrice
          //                                       .toString()));
          //                         },
          //                         child: UserOrderTile(
          //                             order: influencer.orderId.toString(),
          //                             influencerName: influencer
          //                                 .influencer!.name
          //                                 .toString(),
          //                             expiryDate:
          //                                 influencer.expiresAt.toString(),
          //                             price:
          //                                 influencer.totalPrice.toString(),
          //                             orderStatus:
          //                                 influencer.status.toString())),
          //                     // AllTaskTile(
          //                     //   category:
          //                     //       influencer.videoType!.name.toString(),
          //                     //   price: influencer.totalPrice.toString(),
          //                     //   date: influencer.createdAt.toString(),
          //                     // )),
          //                   );
          //                 },
          //               ),
          //             ),
          //           );
          //   case null:
          // }
          // return Container();
        }),
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
