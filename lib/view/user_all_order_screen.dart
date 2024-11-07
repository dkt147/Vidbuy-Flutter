import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_orders_view_model.dart';

class UserAllOrdersScreen extends StatefulWidget {
  const UserAllOrdersScreen({super.key});

  @override
  State<UserAllOrdersScreen> createState() => _UserAllOrdersScreenState();
}

class _UserAllOrdersScreenState extends State<UserAllOrdersScreen> {
  UserOrdersViewModel userOrdersViewModel = UserOrdersViewModel();

  @override
  void initState() {
    userOrdersViewModel.fetchUserAllOrdersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (BuildContext context) => userOrdersViewModel,
            child: Consumer<UserOrdersViewModel>(
                builder: (context, value, child) {
              switch (value.userAllOrdersList.status) {
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
                        data: value.userAllOrdersList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return Expanded(
                    child: ListView.builder(
                      itemCount: value.userAllOrdersList.data!.result!.data!.length,
                      itemBuilder: (context, index) {
                        final influencer = value.userAllOrdersList.data!.result!.data![index];

                        return GestureDetector(
                            onTap: () {
                              // navigate(
                              //     context,
                              //     InfluencerTaskDetailTabBarWidget(
                              //       data: influencer,
                              //     ));
                            },
                            child: AllTaskTile(
                              category: "Not Found",
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
        ],
      ),
    );
  }
}
