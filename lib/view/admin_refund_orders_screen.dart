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
class AdminRefundOrdersScreen extends StatefulWidget {
  String? search;
  AdminRefundOrdersScreen({super.key, this.search});

  @override
  State<AdminRefundOrdersScreen> createState() =>
      _AdminRefundOrdersScreenState();
}

class _AdminRefundOrdersScreenState extends State<AdminRefundOrdersScreen> {
  AdminRejectedOrdersViewModel adminRejectedOrdersViewModel =
      AdminRejectedOrdersViewModel();

  @override
  void initState() {
    super.initState();
    // influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
    // Initial API call
    adminRejectedOrdersViewModel.fetchAdminRefundOrdersList(widget.search);
  }

  @override
  void didUpdateWidget(covariant AdminRefundOrdersScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the date has changed
    if (oldWidget.search != widget.search) {
      adminRejectedOrdersViewModel.fetchAdminRefundOrdersList(widget.search);
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
              switch (value.adminRefundOrdersList.status) {
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
                        data: value.adminRefundOrdersList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return value.adminRefundOrdersList.data!.data!.data == 0
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
                                  "No Rejected Orders Currently",
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
                            itemCount: value
                                .adminRefundOrdersList.data!.data!.data!.length,
                            itemBuilder: (context, index) {
                              final influencer = value.adminRefundOrdersList
                                  .data!.data!.data![index];

                              return GestureDetector(
                                  onTap: () {
                                    navigate(
                                        context,
                                        AdminTaskDetailTabBar(
                                          videoTypeId: influencer.id.toString(),
                                          influencerId: influencer
                                              .influencer!.id
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
                                          totalPrice:
                                              influencer.totalPrice.toString(),
                                          buyerName:
                                              influencer.user!.name.toString(),
                                          buyerUsername: influencer
                                              .user!.username
                                              .toString(),
                                          buyerEmail:
                                              influencer.user!.email.toString(),
                                          influencerName: influencer
                                              .influencer!.name
                                              .toString(),
                                          influencerEmail: influencer
                                              .influencer!.email
                                              .toString(),
                                          influencerUsername: influencer
                                              .influencer!.username
                                              .toString(),
                                          reason: influencer.reason.toString(),
                                          videoUploadId:
                                              influencer.videoTypeId.toString(),
                                          videoUrl: influencer
                                              .influencerRequestVideos!
                                              .first
                                              .videoUrl
                                              .toString(),
                                        ));
                                  },
                                  child: OrderTile(
                                    orderId: influencer.orderId.toString(),
                                    orderPrice:
                                        influencer.totalPrice.toString(),
                                    show: true,
                                  ));
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
