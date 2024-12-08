import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/user_order_tile.dart';
import 'package:vidbuy_app/resources/componenets/user_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_orders_view_model.dart';

class UserAllOrdersScreen extends StatefulWidget {
  const UserAllOrdersScreen({super.key});

  @override
  State<UserAllOrdersScreen> createState() => _UserAllOrdersScreenState();
}

class _UserAllOrdersScreenState extends State<UserAllOrdersScreen> {
  late UserOrdersViewModel userOrdersViewModel;

  @override
  void initState() {
    super.initState();
    userOrdersViewModel = UserOrdersViewModel();
    userOrdersViewModel.fetchUserAllOrdersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => userOrdersViewModel,
        child: Consumer<UserOrdersViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                if (viewModel.isAllOrderFetching && viewModel.allorders.isEmpty)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (!viewModel.isAllOrderFetching &&
                    viewModel.allorders.isEmpty)
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
                          const Text(
                            "No Orders Currently",
                            style: TextStyle(
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
                            !viewModel.isAllOrderFetching &&
                            viewModel.hasAllOrderMoreData) {
                          viewModel.fetchUserAllOrdersList();
                          return true;
                        }
                        return false;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: ListView.builder(
                          itemCount: viewModel.allorders.length +
                              (viewModel.isAllOrderFetching ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == viewModel.allorders.length) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            final influencer = viewModel.allorders[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () {
                                  navigate(
                                    context,
                                    UserTaskDetailTabBarWidget(
                                      videoTypeId: influencer.id.toString(),
                                      influencerId:
                                          influencer.influencerId.toString(),
                                      createdAt:
                                          influencer.createdAt.toString(),
                                      orderId: influencer.orderId.toString(),
                                      expiresAt:
                                          influencer.expiresAt.toString(),
                                      status: influencer.status.toString(),
                                      videoTypeName:
                                          influencer.videoType!.name.toString(),
                                      from: influencer.from.toString(),
                                      to: influencer.to.toString(),
                                      requiredDays:
                                          influencer.requiredDays.toString(),
                                      description:
                                          influencer.description.toString(),
                                      totalPrice:
                                          influencer.totalPrice.toString(),
                                    ),
                                  );
                                },
                                child: UserOrderTile(
                                  order: influencer.orderId.toString(),
                                  influencerName:
                                      influencer.influencer!.name.toString(),
                                  expiryDate: influencer.expiresAt.toString(),
                                  price: influencer.totalPrice.toString(),
                                  orderStatus: influencer.status.toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
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
