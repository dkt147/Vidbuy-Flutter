import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/all_task_tile.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_orders_view_model.dart';

import '../resources/componenets/content.dart';

class UserWaitingVideoScreen extends StatefulWidget {
  const UserWaitingVideoScreen({super.key});

  @override
  State<UserWaitingVideoScreen> createState() => _UserWaitingVideoScreenState();
}

class _UserWaitingVideoScreenState extends State<UserWaitingVideoScreen> {
    UserOrdersViewModel userOrdersViewModel = UserOrdersViewModel();

  @override
  void initState() {
    userOrdersViewModel..fetchInfluencerWaitingVideoList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChangeNotifierProvider(
          create: (BuildContext context) => userOrdersViewModel,
          child: Consumer<UserOrdersViewModel>(
              builder: (context, value, child) {
            switch (value.userWaitingVideoList.status) {
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
                      data: value.userWaitingVideoList.message.toString(),
                      size: 18),
                );
              case Status.COMPLETED:
                return Expanded(
                  child: ListView.builder(
                    itemCount: value.userWaitingVideoList.data!.result!.data!.length,
                    itemBuilder: (context, index) {
                      final influencer = value.userWaitingVideoList.data!
                          .result!.data![index];

                      return GestureDetector(
                          onTap: () {
                            // navigate(
                            //     context,
                            //     InfluencerTaskDetailTabBarWidget(
                            //       data: influencer,
                            //     ));
                          },
                          child: AllTaskTile(
                            category: "influencer.videoType!.name.toString()",
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
      ],
    );
  }
}
