import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/admin_task_detail_tab_bar.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/order_tile.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_rejected_orders_view_model.dart';

// ignore: must_be_immutable
class CancelRequestScreen extends StatefulWidget {
  String? search;
  CancelRequestScreen({super.key, this.search});

  @override
  State<CancelRequestScreen> createState() => _CancelRequestScreenState();
}

class _CancelRequestScreenState extends State<CancelRequestScreen> {
  AdminRejectedOrdersViewModel adminRejectedOrdersViewModel =
      AdminRejectedOrdersViewModel();

  @override
  void initState() {
    super.initState();
    // influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
    // Initial API call
    adminRejectedOrdersViewModel.fetchAdminRejectedOrdersList(widget.search);
  }

  @override
  void didUpdateWidget(covariant CancelRequestScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the date has changed
    if (oldWidget.search != widget.search) {
      adminRejectedOrdersViewModel.resetAdminRejectedOrdersPagination();
      adminRejectedOrdersViewModel.fetchAdminRejectedOrdersList(widget.search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => adminRejectedOrdersViewModel,
        child: Consumer<AdminRejectedOrdersViewModel>(
            builder: (context, value, child) {
          switch (value.adminRejectedOrdersList.status) {
            case Status.INIT:
              return Container();
            case Status.LOADING:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            case Status.ERROR:
              return Center(
                child: Content(
                    data: value.adminRejectedOrdersList.message.toString(),
                    size: 18),
              );
            case Status.COMPLETED:
              return Column(children: [
                if (value.isAdminRejectedListLoading &&
                    value.adminRejectedOrders.isEmpty)
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (!value.isAdminRejectedListLoading &&
                    value.adminRejectedOrders.isEmpty)
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
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent &&
                            !value.isFetchingMoreRejectedAdminList) {
                          value.fetchAdminRejectedOrdersList(widget.search,
                              isLoadMore: true);
                        }
                        return false;
                      },
                      child: ListView.builder(
                        itemCount: value.adminRejectedOrders.length +
                            (value.isFetchingMoreRejectedAdminList ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == value.adminRejectedOrders.length) {
                            // Show loader at the end
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          final order = value.adminRejectedOrders[index];
                          return GestureDetector(
                            onTap: () {
                              navigate(
                                  context,
                                  AdminTaskDetailTabBar(
                                    videoTypeId: order.id.toString(),
                                    influencerId:
                                        order.influencer!.id.toString(),
                                    createdAt: order.createdAt.toString(),
                                    orderId: order.orderId.toString(),
                                    expiresAt: order.expiresAt.toString(),
                                    status: order.status.toString(),
                                    videoTypeName:
                                        order.videoType!.name.toString(),
                                    from: order.from.toString(),
                                    to: order.to.toString(),
                                    requiredDays: order.requiredDays.toString(),
                                    description: order.description.toString(),
                                    totalPrice: order.totalPrice.toString(),
                                    buyerName: order.user!.name.toString(),
                                    buyerUsername:
                                        order.user!.username.toString(),
                                    buyerEmail: order.user!.email.toString(),
                                    influencerName:
                                        order.influencer!.name.toString(),
                                    influencerEmail:
                                        order.influencer!.email.toString(),
                                    influencerUsername:
                                        order.influencer!.username.toString(),
                                    reason: order.reason.toString(),
                                    videoUploadId: order
                                        .influencerRequestVideos!
                                        .first
                                        .requestVideoId
                                        .toString(),
                                    videoUrl: order
                                        .influencerRequestVideos!.first.videoUrl
                                        .toString(),
                                  ));
                            },
                            child: OrderTile(
                              orderId: order.orderId.toString(),
                              orderPrice: order.totalPrice.toString(),
                              show: true,
                            ),
                          );
                        },
                      ),
                    ),
                  )
              ]);
            case null:
          }
          return Container();
        }),
      ),
    );
  }
}
