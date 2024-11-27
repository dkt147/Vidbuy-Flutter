import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/resources/componenets/pending_admin_tile.dart';
import 'package:vidbuy_app/view/persnol_details_screen.dart';
import 'package:vidbuy_app/view/video_identity_screen.dart';
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
class PendingAdminScreen extends StatefulWidget {
  const PendingAdminScreen({super.key});

  @override
  State<PendingAdminScreen> createState() => _PendingAdminScreenState();
}

class _PendingAdminScreenState extends State<PendingAdminScreen> {
  AdminInfluencersViewModel adminInfluencerViewModel = AdminInfluencersViewModel();

  @override
  void initState() {
    super.initState();
    adminInfluencerViewModel.fetchAdminPendingInfluencersList("");
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
          create: (BuildContext context) =>adminInfluencerViewModel,
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
                      data: value.adminPendingInfluencerList.message.toString(),
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
                          itemCount: value.adminPendingInfluencerList.data!.result!.data!
                            .data!.length,
                          itemBuilder: (context, index) {
                            final influencer = value.adminPendingInfluencerList.data!.result!.data!
                            .data![index];
          
                            return GestureDetector(
                                onTap: () {
     navigate(
              context,
              MainTabbarAdminWidget(screens: [
                VideoIdentityScreen(status: influencer.status.toString(), influencerId: "influencer.id.toString()", videoUrl: "http://influenzers.waapsdeveloper.co/FaceIdentity/1732566383-airbuds.mp4",),
                PersonalDetailsScreen(name: influencer.name.toString(), email: influencer.email.toString(), country: influencer.countryName.toString(), genera: influencer.influencerCategories!.first['name'].toString(), username: influencer.username.toString(), videosAccepted: "10", pricePerVideo: "10", totalReviews: influencer.reviewCount.toString(), totalVideosMade: "10", totalVideosRejected: "20", createdAt: influencer.createdAt.toString(),)
              ], tabTitles: const [
                "Video Identity",
                "Personal Details",
              ]));
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: PendingAdminTile(name: influencer.name.toString(), countryName: influencer.countryName.toString(), reviews: "14K",),
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
