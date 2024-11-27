import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/cancel_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_influencer_list_view_model.dart';


//  navigate(context, CancelRequestScreen());
class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
 AdminInfluencersViewModel adminInfluencerViewModel = AdminInfluencersViewModel();

  @override
  void initState() {
    super.initState();
    adminInfluencerViewModel.fetchAdminCancelledInfluencersList("");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

            ChangeNotifierProvider(
          create: (BuildContext context) =>adminInfluencerViewModel,
          child: Consumer<AdminInfluencersViewModel>(
              builder: (context, value, child) {
            switch (value.adminCancelledInfluencerList.status) {
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
                      data: value.adminCancelledInfluencerList.message.toString(),
                      size: 18),
                );
              case Status.COMPLETED:
                return value.adminCancelledInfluencerList.data!.result!.data!
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
                                "No cancelled Influencers",
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
                          itemCount: value.adminCancelledInfluencerList.data!.result!.data!
                            .data!.length,
                          itemBuilder: (context, index) {
                            final influencer = value.adminCancelledInfluencerList.data!.result!.data!
                            .data![index];
          
                            return GestureDetector(
                                onTap: () {
    //  navigate(
    //           context,
    //           MainTabbarAdminWidget(screens: [
    //             VideoIdentityScreen(),
    //             PersonalDetailsScreen(name: influencer.name.toString(), email: influencer.email.toString(), country: influencer.countryName.toString(), genera: influencer.influencerCategories!.first['name'].toString(), username: influencer.username.toString(), videosAccepted: "10", pricePerVideo: "10", totalReviews: influencer.reviewCount.toString(), totalVideosMade: "10", totalVideosRejected: "20", createdAt: influencer.createdAt.toString(),)
    //           ], tabTitles: const [
    //             "Video Identity",
    //             "Personal Details",
    //           ]));
                                },
                                child:  const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: CancelTile(),
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
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
          // CancelTile(),
        ],
      ),
    );
  }
}
