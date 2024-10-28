import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';

class ChooseCategoryScreen extends StatefulWidget {
  final VoidCallback onNextTab;

  ChooseCategoryScreen({required this.onNextTab});

  @override
  State<ChooseCategoryScreen> createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the categories after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InfluencerSelectionViewModel>(context, listen: false)
          .fetchInfluencerCategoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final influencerSelectionViewModel =
        Provider.of<InfluencerSelectionViewModel>(context);

    // Fetch categories on build (or you can use initState in a StatefulWidget)
    if (influencerSelectionViewModel.categoryLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (influencerSelectionViewModel.categories.isEmpty) {
      return Center(child: Text("No categories found."));
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 47.h),
          Container(
            margin: EdgeInsets.only(left: 21.w),
            child: Column(
              children: [
                Text(
                  "Choose your category",
                  style: TextStyle(
                    fontSize: 30.h,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "Make it easier for your followers to find you",
                  style: TextStyle(
                    fontSize: 12.h,
                    color: Colors.black,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.only(left: 21.w),
            child: Wrap(
              spacing: 5.w,
              runSpacing: 10.h,
              children: influencerSelectionViewModel.categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    influencerSelectionViewModel.selectCategory(
                        category); // Use view model to select category
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: influencerSelectionViewModel
                                  .selectedCategory?['id'] ==
                              category['id']
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: Color(0xff000000), width: 1.w),
                    ),
                    child: Text(
                      category['name'],
                      style: TextStyle(
                        fontSize: 15.h,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                        color: influencerSelectionViewModel
                                    .selectedCategory?['id'] ==
                                category['id']
                            ? Colors.white
                            : Color(0xff000000),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Text(influencerSelectionViewModel.selectedCategory!['id'].toString()??""),
          // Text(influencerSelectionViewModel.selectedCategory!['name']
          //     .toString() ?? ""),
          SizedBox(height: 200.h),
          Center(
            child: Container(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: influencerSelectionViewModel.loading
                    ? null // Disable button if loading
                    : () {
                        if (influencerSelectionViewModel.selectedCategory !=
                            null) {
                          influencerSelectionViewModel
                              .fetchInfluencerCategoryData(context,
                                  category: influencerSelectionViewModel
                                      .selectedCategory!['name']
                                      .toString(),
                                  categoryId: influencerSelectionViewModel
                                      .selectedCategory!['id'], func: () {
                            widget.onNextTab();
                          });

                          // if (!influencerSelectionViewModel.loading) {
                          //     widget.onNextTab();
                          //   }
                        } else {
                          Utils.snackBar("PLease select a category", context);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: influencerSelectionViewModel.loading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Save & Continue",
                            style: TextStyle(
                              fontSize: 20.h,
                              color: Colors.white,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
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
          ),
        ],
      ),
    );
  }
}
