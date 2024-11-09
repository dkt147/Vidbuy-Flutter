import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/user_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_orders_view_model.dart';

class UserPendingScreen extends StatefulWidget {
  const UserPendingScreen({super.key});

  @override
  State<UserPendingScreen> createState() => _UserPendingScreenState();
}

class _UserPendingScreenState extends State<UserPendingScreen> {
  UserOrdersViewModel userOrdersViewModel = UserOrdersViewModel();

  @override
  void initState() {
    userOrdersViewModel.fetchUserPendingOrdersList();
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
              switch (value.userPendingOrdersList.status) {
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
                        data: value.userPendingOrdersList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return value.userPendingOrdersList.data!.result!.data!
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
                          child: ListView.builder(
                            itemCount: value.userPendingOrdersList.data!.result!
                                .data!.length,
                            itemBuilder: (context, index) {
                              final influencer = value.userPendingOrdersList
                                  .data!.result!.data![index];

                              return GestureDetector(
                                  onTap: () {
                                    navigate(
                                        context,
                                        UserTaskDetailTabBarWidget(
                                            videoTypeId:
                                                influencer.id.toString(),
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
