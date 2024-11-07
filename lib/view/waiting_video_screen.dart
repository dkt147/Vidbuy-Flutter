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
  const WaitingVideoScreen({super.key});

  @override
  State<WaitingVideoScreen> createState() => _WaitingVideoScreenState();
}

class _WaitingVideoScreenState extends State<WaitingVideoScreen> {
  InfluencerOrdersViewModel influencersOrdersViewModel =
      InfluencerOrdersViewModel();

  @override
  void initState() {
    influencersOrdersViewModel.fetchInfluencerWaitingVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChangeNotifierProvider(
          create: (BuildContext context) => influencersOrdersViewModel,
          child: Consumer<InfluencerOrdersViewModel>(
              builder: (context, value, child) {
            switch (value.influencerWaitingVideoList.status) {
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
                      data: value.influencerWaitingVideoList.message.toString(),
                      size: 18),
                );
              case Status.COMPLETED:
                return Expanded(
                  child: ListView.builder(
                    itemCount: value.influencerWaitingVideoList.data!.result!
                        .orders!.data!.length,
                    itemBuilder: (context, index) {
                      final influencer = value.influencerWaitingVideoList.data!
                          .result!.orders!.data![index];

                      return GestureDetector(
                          onTap: () {
                            navigate(
                                context,
                                InfluencerTaskDetailTabBarWidget(
                                  data: influencer,
                                ));
                          },
                          child: AllTaskTile(
                            category: influencer.videoType!.name.toString(),
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
