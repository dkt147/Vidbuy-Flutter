import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/view/Proof_identity_screen.dart';
import 'package:vidbuy_app/view/influencer_navbar_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';

class ReviewSelectionScreen extends StatefulWidget {
  @override
  State<ReviewSelectionScreen> createState() => _ReviewSelectionScreenState();
}

class _ReviewSelectionScreenState extends State<ReviewSelectionScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InfluencerSelectionViewModel>(context, listen: false)
          .fetchInfluencerReviewList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Consumer<InfluencerSelectionViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.ReviewLoading) {
              return Center(child: CircularProgressIndicator());
            }

            // Assuming you have data in viewModel.influencerReviewList
            final reviewList = viewModel.influencerReviewList;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56.h),
                Text("Review Your Selection",
                    style:
                        TextStyle(fontSize: 30.h, fontWeight: FontWeight.w300)),
                SizedBox(height: 20.h),
                Text(
                    "Category: ${reviewList.data!.result!.category!.first.category!.name.toString()} ",
                    style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        fontFamily: "lato")),
                SizedBox(height: 26.h),
                Text("Videos you will accept:",
                    style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        fontFamily: "lato")),
                // Display the selected category
                SizedBox(height: 26.h),

                GridView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 items per row
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                    childAspectRatio:
                        (100.w / 30.h), // Adjusts width/height ratio of items
                  ),
                  itemCount: reviewList.data?.result?.videoTypes?.length ?? 0,
                  itemBuilder: (context, index) {
                    final videoType =
                        reviewList.data!.result!.videoTypes![index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Text(
                          videoType.videoTypeName ?? '',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: "lato",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: reviewList.data?.result?.videoTypes!.length,
                //     itemBuilder: (context, index) {
                //       final videoType =
                //           reviewList.data!.result!.videoTypes![index];
                //       return Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 10),
                //         child: Row(
                //           mainAxisAlignment:
                //               MainAxisAlignment.start, // Center it horizontally
                //           children: [
                //             Container(
                //                 width: 100.w,
                //                 height: 30.h,
                //                 decoration: BoxDecoration(
                //                   color: Colors.black,
                //                   borderRadius: BorderRadius.circular(30.r),
                //                 ),
                //                 child: Center(
                //                   child: Text(
                //                     videoType.videoTypeName ?? '',
                //                     style: TextStyle(
                //                       fontSize: 18.h,
                //                       fontWeight: FontWeight.w500,
                //                       fontFamily: "lato",
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                 )),
                //           ],
                //         ),
                //       );
                //     }),

                // Container(
                //   width: 100.w,
                //   height: 45.h,
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(30.r),
                //   ),
                //   child: Center(
                //     child: ListView.builder(
                //       shrinkWrap: true,
                //       itemCount: reviewList.data?.result?.videoTypes!.length,
                //       itemBuilder: (context, index) {
                //         final videoType =
                //             reviewList.data!.result!.videoTypes![index];
                //         return Center(
                //           child: Text(
                //             videoType.videoTypeName ?? '',
                //             style: TextStyle(
                //               fontSize: 18.h,
                //               fontWeight: FontWeight.w500,
                //               fontFamily: "lato",
                //               color: Colors.white,
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(height: 26.h),
                Text("Prices For Each Video:",
                    style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        fontFamily: "lato")),
                SizedBox(height: 30.h),

                ListView.builder(
                    shrinkWrap: true,
                    itemCount: reviewList.data?.result?.videoTypes!.length,
                    itemBuilder: (context, index) {
                      final videoType =
                          reviewList.data!.result!.videoTypes![index];
                      return Text(
                        "${videoType.videoTypeName.toString()} Videos : €${videoType.price.toString()}",
                        style: TextStyle(
                            fontSize: 18.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: "lato"),
                      );
                    }),

                // ...reviewList.data!.result["prices"].map<Widget>((priceData) {
                //   return Text(
                //     "${priceData['name']}: €${priceData['price']}",
                //     style: TextStyle(
                //         fontSize: 18.h,
                //         fontWeight: FontWeight.w500,
                //         fontFamily: "lato"),
                //   );
                // }).toList(),
                SizedBox(height: 20.h),
                Container(
                  width: 335.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
                      navigate(context, ProofIdentityScreen());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Finish",
                          style: TextStyle(
                              fontSize: 20.h,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Lato",
                              color: Colors.white),
                        ),
                        SizedBox(width: 10.w),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
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
