import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/create_order_screen.dart';
import 'package:vidbuy_app/view/stream_video_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/influencer_detail_view_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class InfluencerProfileScreen extends StatefulWidget {
  String influencerId;
  InfluencerProfileScreen({
    required this.influencerId,
    super.key,
  });

  @override
  State<InfluencerProfileScreen> createState() =>
      _InfluencerProfileScreenState();
}

class _InfluencerProfileScreenState extends State<InfluencerProfileScreen> {
  //   List<VideoPlayerController> _controllers = [];
  // List<String> videoUrls = [];

  InfluencerDetailViewModel viewModel = InfluencerDetailViewModel();
  @override
  void initState() {
    super.initState();

    viewModel.fetchinfluencerDetailList(widget.influencerId.toString());
    viewModel.fetchInfluencerView(context, widget.influencerId.toString());

    // Fetch video URLs from your ViewModel or API (simulated here)
    // final viewModel = Provider.of<InfluencerDetailViewModel>(context, listen: false);
    // videoUrls = viewModel.influencerDetailList.data!.result!.videos!.map((url) => url.fullUrl.toString()).toList();

    // // Initialize controllers for each video URL
    // for (var url in videoUrls) {
    //   VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(url))
    //     ..initialize().then((_) {
    //       setState(() {});
    //     });
    //   _controllers.add(controller);
    // }
  }

  // @override
  // void dispose() {
  //   // Dispose controllers to free up resources
  //   for (var controller in _controllers) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    // final viewModel =
    //     Provider.of<InfluencerDetailViewModel>(context, listen: false);
    // viewModel.fetchinfluencerDetailList(widget.influencerId.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (BuildContext context) => viewModel,
              child: Consumer<InfluencerDetailViewModel>(
                // Assume data is in HomeScreenViewModel
                builder: (context, value, child) {
                  switch (value.influencerDetailList.status) {
                    case Status.INIT:
                      return Container();
                    case Status.LOADING:
                      return SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height, // Full screen height
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case Status.ERROR:
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: Content(
                              data:
                                  value.influencerDetailList.message.toString(),
                              size: 18),
                        ),
                      );
                    case Status.COMPLETED:

                      //                    final videoUrls = value.influencerDetailList.data!.result!.videos;

                      // // Initialize video controllers for each URL
                      // _controllers = videoUrls!.map((video) {
                      //   // Extracting the full_url for each video
                      //   final videoUrl = video.fullUrl.toString(); // Assuming 'video' is a map object

                      //   VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
                      //     ..initialize().then((_) {
                      //       setState(() {});  // Refresh to show thumbnail or video
                      //     });
                      //   return controller;
                      // }).toList();
                      var influencer =
                          value.influencerDetailList.data!.result!.user;
                      return Column(
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
                                  data:
                                      AppLocalizations.of(context)!.influencer,
                                  size: 14.h,
                                  weight: FontWeight.w600,
                                  family: "Nunito",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            width: 383.w, // Width scaling
                            height: 353.h, // Height scaling
                            // margin: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.r))),
                            child: Stack(
                              children: [
                                // Background Image with a cut shape
                                ClipPath(
                                  clipper: SubtleRightSideSlantClipper(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Vector/Cover.png'), // Replace with your image
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                    left: 15.w,
                                    top: 250.h,
                                    child: Container(
                                      width: 106.w,
                                      height: 106.h,
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(radius)
                                      // ),
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          influencer!.image.toString()),
                                    )),
                                Positioned(
                                    left: 246.w,
                                    top: 220.h,
                                    child: Container(
                                        width: 118.w,
                                        height: 36.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Color(0xffFFFFFF)
                                                .withOpacity(0.8)),
                                        child: Container(
                                          child: Center(
                                              child: Content(
                                            data: influencer
                                                .influencerCategories!
                                                .first
                                                .name
                                                .toString(),
                                            size: 17.h,
                                            weight: FontWeight.w700,
                                            family: "Nunito",
                                            color: Color(0xff7E7C7C),
                                          )),
                                        ))),

                                // Name, Username, and Rating

                                Positioned(
                                    right: 15.w,
                                    bottom: 30.h,
                                    child: Image.asset(
                                      "assets/Icon/Hand.png",
                                      height: 30.h,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 18.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Content(
                                      data: influencer.name.toString(),
                                      size: 18.h,
                                      family: "Nunito",
                                      weight: FontWeight.w700,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        navigate(
                                            context,
                                            CreateOrderScreen(
                                              influencerName:
                                                  influencer.name.toString(),
                                              influencerId:
                                                  influencer.id.toString(),
                                            ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 30.w),
                                        height: 33.h,
                                        width: 107.h,
                                        color: Color(0xff161436),
                                        child: Center(
                                            child: Content(
                                          data: AppLocalizations.of(context)!
                                              .userInfluencerProfileBookMe,
                                          size: 16.h,
                                          family: "Nunito",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Content(
                                      data: influencer.email.toString(),
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w700,
                                    ),
                                    SizedBox(width: 7.w),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 16.w),
                                    Content(
                                      data: "4.7",
                                      size: 10.h,
                                      family: "Nunito",
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Content(
                                data: "Designer, Photographer",
                                size: 12.h,
                                family: "Nunito",
                                weight: FontWeight.w600,
                              ),
                              Icon(
                                Icons.flag,
                                size: 17.h,
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 28.w, right: 26.w, top: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Content(
                                      data: AppLocalizations.of(context)!
                                          .userInfluencerProfileTotalReviews,
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w400,
                                    ),
                                    Content(
                                      data: value.influencerDetailList.data!
                                          .result!.totalReviews
                                          .toString(),
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w700,
                                    ),
                                    // Content(
                                    //   data: "Total Request",
                                    //   size: 12.h,
                                    //   family: "Nunito",
                                    //   weight: FontWeight.w400,
                                    // ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Content(
                                      data: AppLocalizations.of(context)!
                                          .userInfluencerProfilePricePerVideo,
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w400,
                                    ),
                                    Content(
                                      data: value.influencerDetailList.data!
                                          .result!.priceRange
                                          .toString(),
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w700,
                                    ),
                                    // Content(
                                    //   data: "55",
                                    //   size: 12.h,
                                    //   family: "Nunito",
                                    //   weight: FontWeight.w400,
                                    // ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Content(
                                      data: AppLocalizations.of(context)!
                                          .userInfluencerProfileTotalRequest,
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w400,
                                    ),
                                    Content(
                                      data: value.influencerDetailList.data!
                                          .result!.totalRequest
                                          .toString(),
                                      size: 12.h,
                                      family: "Nunito",
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          value.influencerDetailList.data!.result!.videos!
                                  .isEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: DashedBorderContainer(
                                        text: AppLocalizations.of(context)!
                                            .userInfluencerProfileNoVideos),
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  child: Wrap(
                                    spacing:
                                        8.w, // Horizontal space between items
                                    runSpacing:
                                        8.h, // Vertical space between items
                                    alignment: WrapAlignment
                                        .center, // Center alignment of items
                                    children: List.generate(
                                      viewModel
                                          .influencerDetailList
                                          .data!
                                          .result!
                                          .videos!
                                          .length, // Number of videos in the list
                                      (index) {
                                        final videoUrl = viewModel
                                            .influencerDetailList
                                            .data!
                                            .result!
                                            .videos![index]
                                            .fullUrl;

                                        return Container(
                                          width: 100
                                              .w, // Width of each video container
                                          height: 110
                                              .h, // Height of each video container
                                          margin: EdgeInsets.all(
                                              4.w), // Margin around each item
                                          child: VideoPlayerWidget(
                                            videoUrl: videoUrl!,
                                            videoTitle: viewModel
                                                .influencerDetailList
                                                .data!
                                                .result!
                                                .user!
                                                .videoTypes![index]
                                                .videoTypeName
                                                .toString(),
                                          ), // Pass video URL to the VideoPlayerWidget
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          value.influencerDetailList.data!.result!.reviews!
                                  .isEmpty
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Content(
                                        data: AppLocalizations.of(context)!
                                            .userInfluencerProfileInfluencerReviews,
                                        size: 18.h,
                                        family: "Nunito",
                                        weight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),

                          value.influencerDetailList.data!.result!.reviews!
                                  .isEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: DashedBorderContainer(
                                        text: AppLocalizations.of(context)!
                                            .userInfluencerProfileNoReviews),
                                  ),
                                )
                              : SizedBox(
                                  height: 200
                                      .h, // Set a height for the ListView.builder
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value
                                        .influencerDetailList
                                        .data!
                                        .result!
                                        .reviews!
                                        .length, // Adjust this to the number of items you want
                                    itemBuilder: (context, index) {
                                      var user = value.influencerDetailList
                                          .data!.result!.reviews![index];
                                      return Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          // Add spacing between items
                                          height: 180.h,
                                          width: 180.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Color(0xffDDBFB2),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              ClipOval(
                                                child: Image.network(
                                                  user.reviewer!.image
                                                      .toString(),
                                                  height: 60.h,
                                                  width: 60.w,
                                                  fit: BoxFit
                                                      .cover, // Ensures the image covers the circular area
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.star,
                                                      color: Colors.yellow,
                                                      size: 16.w),
                                                  Content(
                                                    data:
                                                        user.rating.toString(),
                                                    size: 10.h,
                                                    family: "Nunito",
                                                    weight: FontWeight.w700,
                                                  ),
                                                ],
                                              ),
                                              Content(
                                                data: user.reviewer!.name
                                                    .toString(),
                                                size: 16.h,
                                                family: "Lato",
                                                weight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Content(
                                                  data: user.message.toString(),
                                                  size: 14.h,
                                                  family: "Lato",
                                                  weight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )

                          // Container(
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Content(
                          //         data: "Influencer Reviews",
                          //         size: 18.h,
                          //         family: "Nunito",
                          //         weight: FontWeight.w700,
                          //       ),
                          //       SizedBox(
                          //         height: 10.h,
                          //       ),

                          //       // SingleChildScrollView(
                          //       //   scrollDirection: Axis.horizontal,
                          //       //   child: Row(
                          //       //     children: [
                          //       //       Container(
                          //       //         height: 180.h,
                          //       //         width: 180.w,
                          //       //         decoration: BoxDecoration(
                          //       //             borderRadius:
                          //       //                 BorderRadius.circular(10.r),
                          //       //             color: Color(0xffDDBFB2)),
                          //       //         child: Column(
                          //       //           crossAxisAlignment:
                          //       //               CrossAxisAlignment.center,
                          //       //           mainAxisAlignment:
                          //       //               MainAxisAlignment.center,
                          //       //           children: [
                          //       //             SizedBox(
                          //       //               height: 10.h,
                          //       //             ),
                          //       //             Image.asset(
                          //       //               "assets/Vector/girl.png",
                          //       //               height: 60.h,
                          //       //               width: 60.w,
                          //       //             ),
                          //       //             Row(
                          //       //               mainAxisAlignment:
                          //       //                   MainAxisAlignment.center,
                          //       //               crossAxisAlignment:
                          //       //                   CrossAxisAlignment.center,
                          //       //               children: [
                          //       //                 Icon(Icons.star,
                          //       //                     color: Colors.yellow,
                          //       //                     size: 16.w),
                          //       //                 Content(
                          //       //                   data: "4.7",
                          //       //                   size: 10.h,
                          //       //                   family: "Nunito",
                          //       //                   weight: FontWeight.w700,
                          //       //                 ),
                          //       //               ],
                          //       //             ),
                          //       //             Content(
                          //       //               data: "Wade Warren",
                          //       //               size: 16.h,
                          //       //               family: "Lato",
                          //       //               weight: FontWeight.w700,
                          //       //               color: Colors.white,
                          //       //             ),
                          //       //             Content(
                          //       //               data:
                          //       //                   "Awesome website and\nfunnel for your business",
                          //       //               size: 16.h,
                          //       //               family: "Lato",
                          //       //               weight: FontWeight.w700,
                          //       //               color: Colors.white,
                          //       //             ),
                          //       //           ],
                          //       //         ),
                          //       //       ),
                          //       //       SizedBox(
                          //       //         width: 14.w,
                          //       //       ),
                          //       //     ],
                          //       //   ),
                          //       // )
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 50.h,
                          // ),

                          //  SingleChildScrollView(
                          //    child: Container(
                          //      child: Column(
                          //        children: [
                          //          Row(
                          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //               ],
                          //             ),

                          //               Row(
                          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //               ],
                          //             ),

                          //             Row(
                          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //                 Image.asset(
                          //                   "assets/UI/grouppicture.jpg",
                          //                   width: 124.w,
                          //                   height: 110.h,
                          //                 ),
                          //               ],
                          //             ),

                          //        ],
                          //      ),
                          //    ),
                          //  ),

                          // SizedBox(
                          //   height: 28.h,
                          // ),
                          // DashedBorderContainer(text: 'No videos yet'),
                          // SizedBox(height: 20.h),
                          // DashedBorderContainer(text: 'No reviews yet'),
                        ],
                      );

                    case null:
                  }
                  return Container();
                },
              ),
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [

            //         // Container(
            //         //   margin: EdgeInsets.only(left: 28.w, right: 26.w, top: 15.h),
            //         //   child: Row(
            //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //     children: [
            //         //       Column(
            //         //         children: [
            //         //           Content(
            //         //             data: "Total Reviews",
            //         //             size: 12.h,
            //         //             family: "Nunito",
            //         //             weight: FontWeight.w400,
            //         //           ),
            //         //           Content(
            //         //             data: "120k",
            //         //             size: 12.h,
            //         //             family: "Nunito",
            //         //             weight: FontWeight.w700,
            //         //           ),
            //         //           // Content(
            //         //           //   data: "Total Request",
            //         //           //   size: 12.h,
            //         //           //   family: "Nunito",
            //         //           //   weight: FontWeight.w400,
            //         //           // ),
            //         //         ],
            //         //       ),
            //         //       Column(
            //         //         children: [
            //         //           Content(
            //         //             data: "Price Per Video",
            //         //             size: 12.h,
            //         //             family: "Nunito",
            //         //             weight: FontWeight.w400,
            //         //           ),
            //         //           Content(
            //         //             data: "50 to 200",
            //         //             size: 12.h,
            //         //             family: "Nunito",
            //         //             weight: FontWeight.w700,
            //         //           ),
            //         //           // Content(
            //         //           //   data: "55",
            //         //           //   size: 12.h,
            //         //           //   family: "Nunito",
            //         //           //   weight: FontWeight.w400,
            //         //           // ),
            //         //         ],
            //         //       ),
            //         //       Column(
            //         //         children: [
            //         //           Content(
            //         //             data: "Total Request",
            //         //             size: 12.h,
            //         //             family: "Nunito",
            //         //             weight: FontWeight.w400,
            //         //           ),
            //         //           Content(
            //         //             data: "55",
            //         //             size: 12.h,
            //         //             family: "Nunito",
            //         //             weight: FontWeight.w700,
            //         //           ),
            //         //         ],
            //         //       )
            //         //     ],
            //         //   ),
            //         // ),
            //         SizedBox(
            //           height: 20.h,
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             // Row(
            //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             //   children: [
            //             //     Image.asset(
            //             //       "assets/UI/grouppicture.jpg",
            //             //       width: 124.w,
            //             //       height: 110.h,
            //             //     ),
            //             //     Image.asset(
            //             //       "assets/UI/grouppicture.jpg",
            //             //       width: 124.w,
            //             //       height: 110.h,
            //             //     ),
            //             //     Image.asset(
            //             //       "assets/UI/grouppicture.jpg",
            //             //       width: 124.w,
            //             //       height: 110.h,
            //             //     ),
            //             //   ],
            //             // ),
            //             // SizedBox(
            //             //   height: 7.h,
            //             // ),
            //             // Row(
            //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             //   children: [
            //             //     Image.asset(
            //             //       "assets/UI/grouppicture.jpg",
            //             //       width: 124.w,
            //             //       height: 110.h,
            //             //     ),
            //             //     Image.asset(
            //             //       "assets/UI/grouppicture.jpg",
            //             //       width: 124.w,
            //             //       height: 110.h,
            //             //     ),
            //             //     Image.asset(
            //             //       "assets/UI/grouppicture.jpg",
            //             //       width: 124.w,
            //             //       height: 110.h,
            //             //     ),
            //             //   ],
            //             // ),
            //             // SizedBox(
            //             //   height: 28.h,
            //             // ),
            //             Container(
            //               margin: EdgeInsets.only(left: 19.h),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Content(
            //                     data: "Influencer Reviews",
            //                     size: 18.h,
            //                     family: "Nunito",
            //                     weight: FontWeight.w700,
            //                   ),
            //                   SizedBox(
            //                     height: 10.h,
            //                   ),
            //                   SingleChildScrollView(
            //                     scrollDirection: Axis.horizontal,
            //                     child: Row(
            //                       children: [
            //                         Container(
            //                           height: 180.h,
            //                           width: 180.w,
            //                           decoration: BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.circular(10.r),
            //                               color: Color(0xffDDBFB2)),
            //                           child: Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.center,
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             children: [
            //                               SizedBox(
            //                                 height: 10.h,
            //                               ),
            //                               Image.asset(
            //                                 "assets/Vector/girl.png",
            //                                 height: 60.h,
            //                                 width: 60.w,
            //                               ),
            //                               Row(
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.center,
            //                                 crossAxisAlignment:
            //                                     CrossAxisAlignment.center,
            //                                 children: [
            //                                   Icon(Icons.star,
            //                                       color: Colors.yellow,
            //                                       size: 16.w),
            //                                   Content(
            //                                     data: "4.7",
            //                                     size: 10.h,
            //                                     family: "Nunito",
            //                                     weight: FontWeight.w700,
            //                                   ),
            //                                 ],
            //                               ),
            //                               Content(
            //                                 data: "Wade Warren",
            //                                 size: 16.h,
            //                                 family: "Lato",
            //                                 weight: FontWeight.w700,
            //                                 color: Colors.white,
            //                               ),
            //                               Content(
            //                                 data:
            //                                     "Awesome website and\nfunnel for your business",
            //                                 size: 16.h,
            //                                 family: "Lato",
            //                                 weight: FontWeight.w700,
            //                                 color: Colors.white,
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         // SizedBox(
            //                         //   width: 14.w,
            //                         // ),
            //                         // Container(
            //                         //   height: 180.h,
            //                         //   width: 180.w,
            //                         //   decoration: BoxDecoration(
            //                         //       borderRadius:
            //                         //           BorderRadius.circular(10.r),
            //                         //       color: Color(0xffDDBFB2)),
            //                         //   child: Column(
            //                         //     crossAxisAlignment:
            //                         //         CrossAxisAlignment.center,
            //                         //     mainAxisAlignment:
            //                         //         MainAxisAlignment.center,
            //                         //     children: [
            //                         //       SizedBox(
            //                         //         height: 10.h,
            //                         //       ),
            //                         //       Image.asset(
            //                         //         "assets/Vector/girl.png",
            //                         //         height: 60.h,
            //                         //         width: 60.w,
            //                         //       ),
            //                         //       Row(
            //                         //         mainAxisAlignment:
            //                         //             MainAxisAlignment.center,
            //                         //         crossAxisAlignment:
            //                         //             CrossAxisAlignment.center,
            //                         //         children: [
            //                         //           Icon(Icons.star,
            //                         //               color: Colors.yellow,
            //                         //               size: 16.w),
            //                         //           Content(
            //                         //             data: "4.7",
            //                         //             size: 10.h,
            //                         //             family: "Nunito",
            //                         //             weight: FontWeight.w700,
            //                         //           ),
            //                         //         ],
            //                         //       ),
            //                         //       Content(
            //                         //         data: "Wade Warren",
            //                         //         size: 16.h,
            //                         //         family: "Lato",
            //                         //         weight: FontWeight.w700,
            //                         //         color: Colors.white,
            //                         //       ),
            //                         //       Content(
            //                         //         data:
            //                         //             "Awesome website and\nfunnel for your business",
            //                         //         size: 16.h,
            //                         //         family: "Lato",
            //                         //         weight: FontWeight.w700,
            //                         //         color: Colors.white,
            //                         //       ),
            //                         //     ],
            //                         //   ),
            //                         // ),
            //                         // SizedBox(
            //                         //   width: 14.w,
            //                         // ),
            //                         // Container(
            //                         //   height: 180.h,
            //                         //   width: 180.w,
            //                         //   decoration: BoxDecoration(
            //                         //       borderRadius:
            //                         //           BorderRadius.circular(10.r),
            //                         //       color: Color(0xffDDBFB2)),
            //                         //   child: Column(
            //                         //     crossAxisAlignment:
            //                         //         CrossAxisAlignment.center,
            //                         //     mainAxisAlignment:
            //                         //         MainAxisAlignment.center,
            //                         //     children: [
            //                         //       SizedBox(
            //                         //         height: 10.h,
            //                         //       ),
            //                         //       Image.asset(
            //                         //         "assets/Vector/girl.png",
            //                         //         height: 60.h,
            //                         //         width: 60.w,
            //                         //       ),
            //                         //       Row(
            //                         //         mainAxisAlignment:
            //                         //             MainAxisAlignment.center,
            //                         //         crossAxisAlignment:
            //                         //             CrossAxisAlignment.center,
            //                         //         children: [
            //                         //           Icon(Icons.star,
            //                         //               color: Colors.yellow,
            //                         //               size: 16.w),
            //                         //           Content(
            //                         //             data: "4.7",
            //                         //             size: 10.h,
            //                         //             family: "Nunito",
            //                         //             weight: FontWeight.w700,
            //                         //           ),
            //                         //         ],
            //                         //       ),
            //                         //       Content(
            //                         //         data: "Wade Warren",
            //                         //         size: 16.h,
            //                         //         family: "Lato",
            //                         //         weight: FontWeight.w700,
            //                         //         color: Colors.white,
            //                         //       ),
            //                         //       Content(
            //                         //         data:
            //                         //             "Awesome website and\nfunnel for your business",
            //                         //         size: 16.h,
            //                         //         family: "Lato",
            //                         //         weight: FontWeight.w700,
            //                         //         color: Colors.white,
            //                         //       ),
            //                         //     ],
            //                         //   ),
            //                         // ),
            //                         // SizedBox(
            //                         //   width: 14.w,
            //                         // ),
            //                         // Container(
            //                         //   height: 180.h,
            //                         //   width: 180.w,
            //                         //   decoration: BoxDecoration(
            //                         //       borderRadius:
            //                         //           BorderRadius.circular(10.r),
            //                         //       color: Color(0xffDDBFB2)),
            //                         //   child: Column(
            //                         //     crossAxisAlignment:
            //                         //         CrossAxisAlignment.center,
            //                         //     mainAxisAlignment:
            //                         //         MainAxisAlignment.center,
            //                         //     children: [
            //                         //       SizedBox(
            //                         //         height: 10.h,
            //                         //       ),
            //                         //       Image.asset(
            //                         //         "assets/Vector/girl.png",
            //                         //         height: 60.h,
            //                         //         width: 60.w,
            //                         //       ),
            //                         //       Row(
            //                         //         mainAxisAlignment:
            //                         //             MainAxisAlignment.center,
            //                         //         crossAxisAlignment:
            //                         //             CrossAxisAlignment.center,
            //                         //         children: [
            //                         //           Icon(Icons.star,
            //                         //               color: Colors.yellow,
            //                         //               size: 16.w),
            //                         //           Content(
            //                         //             data: "4.7",
            //                         //             size: 10.h,
            //                         //             family: "Nunito",
            //                         //             weight: FontWeight.w700,
            //                         //           ),
            //                         //         ],
            //                         //       ),
            //                         //       Content(
            //                         //         data: "Wade Warren",
            //                         //         size: 16.h,
            //                         //         family: "Lato",
            //                         //         weight: FontWeight.w700,
            //                         //         color: Colors.white,
            //                         //       ),
            //                         //       Content(
            //                         //         data:
            //                         //             "Awesome website and\nfunnel for your business",
            //                         //         size: 16.h,
            //                         //         family: "Lato",
            //                         //         weight: FontWeight.w700,
            //                         //         color: Colors.white,
            //                         //       ),
            //                         //     ],
            //                         //   ),
            //                         // ),
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             SizedBox(
            //               height: 50.h,
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class SubtleRightSideSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0); // Start at top-left
    path.lineTo(size.width, 0.0); // Move to top-right
    path.lineTo(size.width, size.height * 0.75); // Move diagonally to the right
    path.lineTo(0.0, size.height); // Create slant to bottom-left
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DashedBorderContainer extends StatelessWidget {
  final String text;

  const DashedBorderContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0), // Adds slight padding to avoid overflow
      child: ClipRRect(
        child: Container(
          width: 250, // Adjusted to fit better, you may need to change
          height: 90, // Adjusted to fit better, you may need to change
          child: Stack(
            children: [
              // Dashed border
              Positioned.fill(
                child: DashBorder(),
              ),
              // Centered text
              Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            // Top dashed border
            Dash(
              length: constraints.maxWidth,
              dashLength: 5,
              dashColor: Colors.black26,
            ),
            Expanded(
              child: Row(
                children: [
                  // Left dashed border
                  Dash(
                    direction: Axis.vertical,
                    length: constraints.maxHeight,
                    dashLength: 5,
                    dashColor: Colors.black26,
                  ),
                  Spacer(),
                  // Right dashed border
                  Dash(
                    direction: Axis.vertical,
                    length: constraints.maxHeight,
                    dashLength: 5,
                    dashColor: Colors.black26,
                  ),
                ],
              ),
            ),
            // Bottom dashed border
            Dash(
              length: constraints.maxWidth,
              dashLength: 5,
              dashColor: Colors.black26,
            ),
          ],
        );
      },
    );
  }
}

class Dash extends StatelessWidget {
  final double length;
  final Axis direction;
  final double dashLength;
  final Color dashColor;

  const Dash({
    this.direction = Axis.horizontal,
    required this.length,
    required this.dashLength,
    required this.dashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate((length / (2 * dashLength)).floor(), (index) {
        return SizedBox(
          width: direction == Axis.horizontal ? dashLength : 1,
          height: direction == Axis.vertical ? dashLength : 1,
          child: DecoratedBox(
            decoration: BoxDecoration(color: dashColor),
          ),
        );
      }),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;

  VideoPlayerWidget({required this.videoUrl, required this.videoTitle});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false; // To track whether the video is playing or not
  bool _isFullScreen =
      false; // To track whether the video is in full-screen mode

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  // Function to toggle play/pause
  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  // Function to toggle full-screen mode
  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close full screen when tapped anywhere outside
        if (_isFullScreen) {
          _toggleFullScreen();
        }
      },
      child: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? Stack(
                  children: [
                    VideoPlayer(_controller),
                    // Play button in the center
                    Center(
                      child: IconButton(
                        icon: Icon(
                          _isPlaying ? null : Icons.play_arrow,
                          color: Colors.white,
                          size: 64.0,
                        ),
                        onPressed:
                            _togglePlayPause, // Toggle play/pause on button press
                      ),
                    ),
                    // Expand screen button at the top-right corner
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            _isPlaying ? Icons.fullscreen : null,
                            color: Colors.white,
                            size: 32.0,
                          ),
                          onPressed: () {
                            navigate(
                                context,
                                StreamVideoScreen(
                                    videoSource: widget.videoUrl.toString()));
                          }, // Toggle full-screen on button press
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Text at the bottom-left
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text(
                                  widget
                                      .videoTitle, // Display the text passed from the parent
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class InfluencerProfileScreens extends StatefulWidget {
  const InfluencerProfileScreens({super.key});

  @override
  State<InfluencerProfileScreens> createState() =>
      _InfluencerProfileScreensState();
}

class _InfluencerProfileScreensState extends State<InfluencerProfileScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  data: "Influencer",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: 383.w, // Width scaling
            height: 353.h, // Height scaling
            // margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10.r))),
            child: Stack(
              children: [
                // Background Image with a cut shape
                ClipPath(
                  clipper: SubtleRightSideSlantClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Vector/Cover.png'), // Replace with your image
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                    left: 15.w,
                    top: 250.h,
                    child: Container(
                      width: 106.w,
                      height: 106.h,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(radius)
                      // ),
                      child: Image.asset("assets/Vector/influencer.png"),
                    )),
                Positioned(
                    left: 246.w,
                    top: 220.h,
                    child: Container(
                        width: 118.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xffFFFFFF).withOpacity(0.8)),
                        child: Container(
                          child: Center(
                              child: Content(
                            data: "Entertainer",
                            size: 18.h,
                            weight: FontWeight.w700,
                            family: "Nunito",
                            color: Color(0xff7E7C7C),
                          )),
                        ))),

                // Name, Username, and Rating

                Positioned(
                    right: 15.w,
                    bottom: 30.h,
                    child: Image.asset(
                      "assets/Icon/Hand.png",
                      height: 30.h,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 18.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Content(
                      data: "Suson Goph",
                      size: 18.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                    GestureDetector(
                      onTap: () {
                        // navigate(context, CreateOrderScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 130.w),
                        height: 33.h,
                        width: 107.h,
                        color: Color(0xff161436),
                        child: Center(
                            child: Content(
                          data: "Book Me",
                          size: 16.h,
                          family: "Nunito",
                          weight: FontWeight.w700,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Content(
                      data: "@susan.345",
                      size: 12.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                    SizedBox(width: 7.w),
                    Icon(Icons.star, color: Colors.yellow, size: 16.w),
                    Content(
                      data: "4.7",
                      size: 10.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Content(
                        data: "Designer, Photographer",
                        size: 12.h,
                        family: "Nunito",
                        weight: FontWeight.w600,
                      ),
                      Icon(
                        Icons.flag,
                        size: 17.h,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 28.w, right: 26.w, top: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Content(
                              data: "Total Reviews",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w400,
                            ),
                            Content(
                              data: "120k",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                            // Content(
                            //   data: "Total Request",
                            //   size: 12.h,
                            //   family: "Nunito",
                            //   weight: FontWeight.w400,
                            // ),
                          ],
                        ),
                        Column(
                          children: [
                            Content(
                              data: "Price Per Video",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w400,
                            ),
                            Content(
                              data: "50 to 200",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                            // Content(
                            //   data: "55",
                            //   size: 12.h,
                            //   family: "Nunito",
                            //   weight: FontWeight.w400,
                            // ),
                          ],
                        ),
                        Column(
                          children: [
                            Content(
                              data: "Total Request",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w400,
                            ),
                            Content(
                              data: "55",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 19.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Content(
                              data: "Influencer Reviews",
                              size: 18.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
