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
class AdminCompletedOrderScreen extends StatefulWidget {
  String? search;
  AdminCompletedOrderScreen({super.key, this.search});

  @override
  State<AdminCompletedOrderScreen> createState() =>
      _AdminCompletedOrderScreenState();
}

class _AdminCompletedOrderScreenState extends State<AdminCompletedOrderScreen> {
  AdminRejectedOrdersViewModel adminRejectedOrdersViewModel =
      AdminRejectedOrdersViewModel();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
    // Initial API call
    adminRejectedOrdersViewModel.fetchAdminCompletedOrdersList(widget.search);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          adminRejectedOrdersViewModel.hasMore) {
        adminRejectedOrdersViewModel
            .fetchAdminCompletedOrdersList(widget.search, isNextPage: true);
      }
    });
  }

  @override
  void didUpdateWidget(covariant AdminCompletedOrderScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the date has changed
    if (oldWidget.search != widget.search) {
      adminRejectedOrdersViewModel.fetchAdminCompletedOrdersList(widget.search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (BuildContext context) => adminRejectedOrdersViewModel,
            child: Consumer<AdminRejectedOrdersViewModel>(
                builder: (context, value, child) {
              switch (value.adminCompletedOrdersList.status) {
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
                        data: value.adminCompletedOrdersList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return value.adminCompletedOrdersList.data!.data!.data == 0
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
                              const Center(
                                child: Text(
                                  "No Completed Orders Currently",
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
                            controller: _scrollController,
                            itemCount: value.completedOrders.length +
                                (value.hasMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == value.completedOrders.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }

                              final order = value.completedOrders[index];

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
                                        requiredDays:
                                            order.requiredDays.toString(),
                                        description:
                                            order.description.toString(),
                                        totalPrice: order.totalPrice.toString(),
                                        buyerName: order.user!.name.toString(),
                                        buyerUsername:
                                            order.user!.username.toString(),
                                        buyerEmail:
                                            order.user!.email.toString(),
                                        influencerName:
                                            order.influencer!.name.toString(),
                                        influencerEmail:
                                            order.influencer!.email.toString(),
                                        influencerUsername: order
                                            .influencer!.username
                                            .toString(),
                                        reason: order.reason.toString(),
                                        videoUploadId:
                                            order.videoTypeId.toString(),
                                        videoUrl: order.influencerRequestVideos!
                                            .first.videoUrl
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
                        );
                case null:
              }
              return Container();
            }),
          ),
        ],
      ),
    );
  }
}
