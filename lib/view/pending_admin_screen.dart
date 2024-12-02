import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/pending_admin_tile.dart';
import 'package:vidbuy_app/view/admin_influencer_detail_tab_bar.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_influencer_list_view_model.dart';

// navigate(
//         context,
//         MainTabbarAdminWidget(screens: const [
//           VideoIdentityScreen(),
//           PersnolDetailsScreen(),
//         ], tabTitles: const [
//           "Video Identity",
//           "Persnol Detail",
//         ]));
// ignore: must_be_immutable
class PendingAdminScreen extends StatefulWidget {
  String? search;
  PendingAdminScreen({super.key, this.search});

  @override
  State<PendingAdminScreen> createState() => _PendingAdminScreenState();
}

class _PendingAdminScreenState extends State<PendingAdminScreen> {
  AdminInfluencersViewModel adminInfluencerViewModel =
      AdminInfluencersViewModel();

  @override
  void initState() {
    super.initState();
    adminInfluencerViewModel.fetchAdminPendingInfluencersList(widget.search);
  }

  @override
  void didUpdateWidget(covariant PendingAdminScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the date has changed
    if (oldWidget.search != widget.search) {
      adminInfluencerViewModel.fetchAdminPendingInfluencersList(widget.search);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      adminInfluencerViewModel.fetchAdminPendingInfluencersList(widget.search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ListTile(
          //   leading: Content(
          //                     data: "Influencers Name",
          //                     size: 16.h,
          //                     weight: FontWeight.w500,
          //                     family: "Lato",
          //                   ),
          //                   // title: Content(data: "Cancel", size: 14.h,  family: "Lato", weight: FontWeight.w500,),
          //                   trailing: Content(data: "Cancel  Revert", size: 14.h,  family: "Lato", weight: FontWeight.w500,),
          // ),

          ChangeNotifierProvider(
            create: (BuildContext context) => adminInfluencerViewModel,
            child: Consumer<AdminInfluencersViewModel>(
                builder: (context, value, child) {
              switch (value.adminPendingInfluencerList.status) {
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
                        data:
                            value.adminPendingInfluencerList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return value.adminPendingInfluencerList.data!.result!.data!
                              .data!.length ==
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
                              const Center(
                                child: Text(
                                  "No Pending Influencers",
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
                            itemCount: value.adminPendingInfluencerList.data!
                                .result!.data!.data!.length,
                            itemBuilder: (context, index) {
                              final influencer = value
                                  .adminPendingInfluencerList
                                  .data!
                                  .result!
                                  .data!
                                  .data![index];

                              final List<String> names = influencer.videoTypes!
                                  .map((type) => type.videoTypeName as String)
                                  .toList(); // Extract video type names

                              final List<String> prices = influencer.videoTypes!
                                  .map((type) => type.price as String)
                                  .toList();

                              return GestureDetector(
                                onTap: () {
                                  navigate(
                                      context,
                                      AdminInfluencerDetailTabBarWidget(
                                        influencerId: influencer.id
                                                    .toString()
                                                    .isNotEmpty ==
                                                true
                                            ? influencer.id
                                                .toString()
                                                .toString()
                                            : "not found",
                                        status: influencer.status
                                                    .toString()
                                                    .isNotEmpty ==
                                                true
                                            ? influencer.status
                                                .toString()
                                                .toString()
                                            : "not found",
                                        videoUrl: influencer.faceIdentity?.video
                                                    ?.isNotEmpty ==
                                                true
                                            ? influencer.faceIdentity!.link
                                                .toString()
                                            : "not found",
                                        name:
                                            influencer.name?.isNotEmpty == true
                                                ? influencer.name.toString()
                                                : "not found",
                                        email:
                                            influencer.email?.isNotEmpty == true
                                                ? influencer.email.toString()
                                                : "not found",
                                        country: influencer
                                                    .countryName?.isNotEmpty ==
                                                true
                                            ? influencer.countryName.toString()
                                            : "not found",
                                        genera: influencer.influencerCategories
                                                    ?.first.name?.isNotEmpty ==
                                                true
                                            ? influencer.influencerCategories!
                                                .first.name
                                                .toString()
                                            : "not found",
                                        username:
                                            influencer.username?.isNotEmpty ==
                                                    true
                                                ? influencer.username.toString()
                                                : "not found",
                                        videosAccepted:
                                            "10", // If this needs a check, replace accordingly
                                        pricePerVideo:
                                            "10", // If this needs a check, replace accordingly
                                        totalReviews: influencer.reviewCount
                                                ?.toString() ??
                                            "not found",
                                        totalVideosMade:
                                            "10", // If this needs a check, replace accordingly
                                        totalVideosRejected:
                                            "20", // If this needs a check, replace accordingly
                                        createdAt:
                                            influencer.createdAt?.toString() ??
                                                "not found",
                                        videoTypes:
                                            names.isNotEmpty ? names : [],
                                        videoPrices:
                                            prices.isNotEmpty ? prices : [],
                                      ));

                                  // navigate(
                                  //     context,
                                  //     MainTabbarAdminWidget(screens: [
                                  //       VideoIdentityScreen(
                                  //         status:
                                  //             influencer.status?.isNotEmpty ==
                                  //                     true
                                  //                 ? influencer.status.toString()
                                  //                 : "not found",
                                  //         influencerId:
                                  //             influencer.id?.toString() ??
                                  //                 "not found",
                                  // videoUrl: influencer.faceIdentity
                                  //             ?.link?.isNotEmpty ==
                                  //         true
                                  //     ? influencer.faceIdentity!.link
                                  //         .toString()
                                  //     : "not found",
                                  //       ),
                                  //       PersonalDetailsScreen(
                                  // influencerId:influencer.id.toString().isNotEmpty ==
                                  //         true
                                  //     ? influencer.id.toString().toString()
                                  //     : "not found",
                                  //     status:influencer.status.toString().isNotEmpty ==
                                  //         true
                                  //     ? influencer.status.toString().toString()
                                  //     : "not found",
                                  // name: influencer.name?.isNotEmpty ==
                                  //         true
                                  //     ? influencer.name.toString()
                                  //     : "not found",
                                  // email: influencer.email?.isNotEmpty ==
                                  //         true
                                  //     ? influencer.email.toString()
                                  //     : "not found",
                                  // country: influencer.countryName
                                  //             ?.isNotEmpty ==
                                  //         true
                                  //     ? influencer.countryName
                                  //         .toString()
                                  //     : "not found",
                                  // genera: influencer
                                  //             .influencerCategories
                                  //             ?.first
                                  //             .name
                                  //             ?.isNotEmpty ==
                                  //         true
                                  //     ? influencer.influencerCategories!
                                  //         .first.name
                                  //         .toString()
                                  //     : "not found",
                                  // username: influencer
                                  //             .username?.isNotEmpty ==
                                  //         true
                                  //     ? influencer.username.toString()
                                  //     : "not found",
                                  // videosAccepted:
                                  //     "10", // If this needs a check, replace accordingly
                                  // pricePerVideo:
                                  //     "10", // If this needs a check, replace accordingly
                                  // totalReviews: influencer.reviewCount
                                  //         ?.toString() ??
                                  //     "not found",
                                  // totalVideosMade:
                                  //     "10", // If this needs a check, replace accordingly
                                  // totalVideosRejected:
                                  //     "20", // If this needs a check, replace accordingly
                                  // createdAt: influencer.createdAt
                                  //         ?.toString() ??
                                  //     "not found",
                                  // videoTypes:
                                  //     names.isNotEmpty ? names : [],
                                  // videoPrices:
                                  //     prices.isNotEmpty ? prices : [],
                                  //       )
                                  //     ], tabTitles: const [
                                  //       "Video Identity",
                                  //       "Personal Details",
                                  //     ]));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: PendingAdminTile(
                                    name: influencer.name.toString(),
                                    countryName:
                                        influencer.countryName.toString(),
                                    reviews: "14K",
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
          ),
          SizedBox(
            height: 70.h,
          ),

          // PendingAdminTile(),
          // PendingAdminTile(),
          // PendingAdminTile(),
          // PendingAdminTile(),
          // PendingAdminTile(),
          // PendingAdminTile(),
          // PendingAdminTile(),
          // PendingAdminTile(),
          // PendingAdminTile(),
        ],
      ),
    );
  }
}
