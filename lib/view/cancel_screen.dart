import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/cancel_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/pending_admin_tile.dart';
import 'package:vidbuy_app/view/admin_influencer_detail_tab_bar.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_influencer_list_view_model.dart';

//  navigate(context, CancelRequestScreen());
// ignore: must_be_immutable
class CancelScreen extends StatefulWidget {
  String? search;
  CancelScreen({super.key, this.search});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  late AdminInfluencersViewModel adminInfluencerViewModel;

  @override
  void initState() {
    super.initState();
    adminInfluencerViewModel = AdminInfluencersViewModel();
    adminInfluencerViewModel.fetchAdminCancelledInfluencersList(widget.search);
  }

  @override
  void didUpdateWidget(covariant CancelScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the date has changed
    if (oldWidget.search != widget.search) {
      adminInfluencerViewModel.resetAdminCancelledListPagination();
      adminInfluencerViewModel
          .fetchAdminCancelledInfluencersList(widget.search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => adminInfluencerViewModel,
        child: Consumer<AdminInfluencersViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                if (viewModel.isAdminCancelledListLoading &&
                    viewModel.adminCancelledList.isEmpty)
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (!viewModel.isAdminCancelledListLoading &&
                    viewModel.adminCancelledList.isEmpty)
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
                            !viewModel.isFetchingMoreCancelledAdminList) {
                          viewModel.fetchAdminCancelledInfluencersList(
                              widget.search,
                              isLoadMore: true);
                        }
                        return false;
                      },
                      child: ListView.builder(
                        itemCount:
                            // viewModel.hasMoreAdminCancelledList
                            viewModel.adminCancelledList.length +
                                (viewModel.isFetchingMoreCancelledAdminList
                                    ? 1
                                    : 0),
                        // : viewModel.adminCancelledList.length,
                        itemBuilder: (context, index) {
                          if (index == viewModel.adminCancelledList.length) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          final influencer =
                              viewModel.adminCancelledList[index];
                          final List<String> names = influencer.videoTypes!
                              .map((type) => type.videoTypeName as String)
                              .toList(); // Extract video type names

                          final List<String> prices = influencer.videoTypes!
                              .map((type) => type.price as String)
                              .toList();
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: CancelTile(
                                influencerName: influencer.name.toString(),
                                func: () {
                                  viewModel.fetchChangeInfluencerStatus(
                                      "Pending",
                                      influencer.id.toString(),
                                      context, () {
                                    viewModel
                                        .fetchAdminCancelledInfluencersList(
                                            widget.search);
                                  });
                                },
                              ));
                        },
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

//     return Scaffold(
//       body: Column(
//         children: [
//           ChangeNotifierProvider(
//             create: (BuildContext context) => adminInfluencerViewModel,
//             child: Consumer<AdminInfluencersViewModel>(
//                 builder: (context, value, child) {
//               switch (value.adminCancelledInfluencerList.status) {
//                 case Status.INIT:
//                   return Container();
//                 case Status.LOADING:
//                   return const Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       ],
//                     ),
//                   );
//                 case Status.ERROR:
//                   return Center(
//                     child: Content(
//                         data: value.adminCancelledInfluencerList.message
//                             .toString(),
//                         size: 18),
//                   );
//                 case Status.COMPLETED:
//                   return value.adminCancelledInfluencerList.data!.result!.data!
//                               .data!.length ==
//                           0
//                       ? Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Center(
//                                 child: Image.asset(
//                                   'assets/Logo/logo.png',
//                                   height: 177.h,
//                                   width: 128.w,
//                                 ),
//                               ),
//                               SizedBox(height: 16),
//                               const Center(
//                                 child: Text(
//                                   "No cancelled Influencers",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       : Expanded(
//                           child: ListView.builder(
//                             itemCount: value.adminCancelledInfluencerList.data!
//                                 .result!.data!.data!.length,
//                             itemBuilder: (context, index) {
//                               final influencer = value
//                                   .adminCancelledInfluencerList
//                                   .data!
//                                   .result!
//                                   .data!
//                                   .data![index];

//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 5),
//                                 child: Consumer<AdminInfluencersViewModel>(
//                                     builder: (context, viewModel, child) {
//                                   return CancelTile(
//                                     influencerName: influencer.name.toString(),
//                                     func: () {
//                                       viewModel.fetchChangeInfluencerStatus(
//                                           "Pending",
//                                           influencer.id.toString(),
//                                           context);
//                                     },
//                                   );
//                                 }),
//                               );
//                             },
//                           ),
//                         );
//                 case null:
//               }
//               return Container();
//             }),
//           ),
//           SizedBox(
//             height: 70.h,
//           ),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//           // CancelTile(),
//         ],
//       ),
//     );
//   }
// }
