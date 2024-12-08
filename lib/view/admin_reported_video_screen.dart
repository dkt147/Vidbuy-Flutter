import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/admin_reported_videos_tile.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_reported_videos_view_model.dart';

// ignore: must_be_immutable
class AdminReportedVideoScreen extends StatefulWidget {
  AdminReportedVideoScreen({super.key});

  @override
  State<AdminReportedVideoScreen> createState() =>
      _AdminReportedVideoScreenState();
}

class _AdminReportedVideoScreenState extends State<AdminReportedVideoScreen> {
  AdminReportedVideosViewModel adminReportedVideosViewModel =
      AdminReportedVideosViewModel();

  @override
  void initState() {
    super.initState();
    // influencersOrdersViewModel = Provider.of<InfluencerOrdersViewModel>(context, listen: false);
    // Initial API call
    adminReportedVideosViewModel.fetchAdminReportedVideosList("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/Icon/backarrow.png",
                    height: 25.h,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Content(
                  data: "Reported Videos",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 32.h,
          // ),
          // Conta
          // SizedBox(
          //   height: 32.h,
          // ),
          ChangeNotifierProvider(
            create: (BuildContext context) => adminReportedVideosViewModel,
            child: Consumer<AdminReportedVideosViewModel>(
                builder: (context, value, child) {
              switch (value.adminReportedVideoList.status) {
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
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: Content(
                              data: value.adminReportedVideoList.message
                                  .toString(),
                              size: 18),
                        ),
                      ],
                    ),
                  );
                case Status.COMPLETED:
                  return value.adminReportedVideoList.data!.data == 0
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
                                  "No reported videos currently",
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
                            itemCount:
                                value.adminReportedVideoList.data!.data!.length,
                            itemBuilder: (context, index) {
                              final reportedVideo = value
                                  .adminReportedVideoList.data!.data![index];

                              return GestureDetector(
                                  onTap: () {},
                                  child: ReportedVideosTile(
                                    userName:
                                        reportedVideo.user!.name.toString(),
                                    influencerName: reportedVideo
                                        .influenzer!.name
                                        .toString(),
                                    videoUrl: reportedVideo.fullUrl.toString(),
                                    reviewCount: reportedVideo
                                        .influenzer!.reviewCount
                                        .toString(),
                                    reportedNo: reportedVideo
                                        .influenzer!.avgRating
                                        .toString(),
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
