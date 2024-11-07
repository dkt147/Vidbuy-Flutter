import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
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
                        data: value.userPendingOrdersList.message
                            .toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return Expanded(
                    child: ListView.builder(
                      itemCount: value.userPendingOrdersList.data!.result!.data!.length,
                      itemBuilder: (context, index) {
                        final influencer =  value.userPendingOrdersList.data!.result!.data![index];

                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: 335.w,
                              height: 81.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      width: 1.w, color: Colors.black)),
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 7.w,
                                  right: 13.w,
                                ),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    Content(
                                      data: "Order: [random]",
                                      size: 16.h,
                                      family: "Lato",
                                      weight: FontWeight.w500,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Content(
                                          data: "Salena Gomez",
                                          size: 14.h,
                                          family: "Lato",
                                          weight: FontWeight.w500,
                                        ),
                                        Content(
                                          data: "Salena Gomez",
                                          size: 14.h,
                                          family: "Lato",
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Content(
                                          data: "MMMed",
                                          size: 14.h,
                                          family: "Lato",
                                          weight: FontWeight.w500,
                                        ),
                                        Content(
                                          data: "[status_order]",
                                          size: 14.h,
                                          family: "Lato",
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
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
