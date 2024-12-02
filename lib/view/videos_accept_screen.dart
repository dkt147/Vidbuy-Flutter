import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';

class VideosAcceptScreen extends StatefulWidget {
  final void Function(List<Map<String, dynamic>>) onNextTab;
  VideosAcceptScreen({super.key, required this.onNextTab});

  @override
  State<VideosAcceptScreen> createState() => _VideosAcceptScreenState();
}

class _VideosAcceptScreenState extends State<VideosAcceptScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the categories after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InfluencerSelectionViewModel>(context, listen: false)
          .fetchInfluencerVideoTypeList();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InfluencerSelectionViewModel>(context, listen: false)
          .fetchInfluencerPriceRangeList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final influencerSelectionViewModel =
        Provider.of<InfluencerSelectionViewModel>(context);

    if (influencerSelectionViewModel.videoTypeLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (influencerSelectionViewModel.videoTypes.isEmpty) {
      return Center(child: Text("No Video Type found."));
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Container(
          margin: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 47.h,
              ),

              Text(
                "Videos you will accept",
                style: TextStyle(
                  fontSize: 30.h,
                  fontWeight: FontWeight.w300,
                  // fontFamily:
                ),
              ),
              Text(
                "The more options, the more attractive the profile will be to the public",
                style: TextStyle(
                  fontSize: 10.h,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 20.h),
              Wrap(
                spacing: 5.w,
                runSpacing: 10.h,
                children:
                    influencerSelectionViewModel.videoTypes.map((videosType) {
                  bool isSelected = influencerSelectionViewModel
                      .selectedVideoTypeIds
                      .contains(videosType['id']);

                  return GestureDetector(
                    onTap: () {
                      influencerSelectionViewModel.selectVideoType(videosType);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xff000000) : Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: Color(0xff000000),
                          width: 1.w,
                        ),
                      ),
                      child: Text(
                        videosType["name"],
                        style: TextStyle(
                          fontSize: 15.h,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : Color(0xff000000),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 30.h),
              Text(
                "What is a range of price?",
                style: TextStyle(
                  fontSize: 30.h,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 5.w,
                runSpacing: 10.h,
                children:
                    influencerSelectionViewModel.priceRanges.map((priceRange) {
                  return GestureDetector(
                    onTap: () {
                      influencerSelectionViewModel.selectPriceRange(priceRange);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: influencerSelectionViewModel
                                    .selectedPriceRange?['id'] ==
                                priceRange['id']
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.w,
                        ),
                      ),
                      child: Text(
                        priceRange["name"],
                        style: TextStyle(
                          fontSize: 15.h,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                          color: influencerSelectionViewModel
                                      .selectedPriceRange?['id'] ==
                                  priceRange['id']
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              // Spacer(),
              SizedBox(
                height: 150.h,
              ),
              Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: influencerSelectionViewModel.priceTypeLoading
                      ? null // Disable button if loading
                      : () {
                          if (influencerSelectionViewModel.selectedPriceRange !=
                                  null &&
                              influencerSelectionViewModel
                                      .selectedVideoTypeIds !=
                                  []) {
                            influencerSelectionViewModel.fetchInfluencerData(
                                context,
                                priceRangeId: influencerSelectionViewModel
                                    .selectedPriceRange!['id'],
                                videoTypes: influencerSelectionViewModel
                                    .selectedVideoTypeIds, func: () {
                              List<Map<String, dynamic>> selectedVideosData =
                                  influencerSelectionViewModel
                                      .influencerVideoTypeData.data!.result!
                                      .map((videoType) {
                                return {
                                  'id': videoType.id,
                                  'name': videoType.name,
                                };
                              }).toList();

                              // Pass the selected videos to the TabBarWidget's saveVideos function
                              widget.onNextTab(selectedVideosData);
                            });
                          } else {
                            Utils.snackBar(
                                "PLease select both option", context);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: influencerSelectionViewModel.priceTypeLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Save & Continue",
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
          ),
        ),
      ),
    );
  }
}
