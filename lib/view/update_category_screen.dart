import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/setting_view_model.dart';

class UpdateCategoryScreen extends StatefulWidget {
  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}

class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<SettingViewModel>(context, listen: false)
        .fetchInfluencerCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    final setingViewModel = Provider.of<SettingViewModel>(context);

    // Fetch categories on build (or you can use initState in a StatefulWidget)
    if (setingViewModel.categoryLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (setingViewModel.categories.isEmpty) {
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
              children: setingViewModel.categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    setingViewModel.selectCategory(
                        category); // Use view model to select category
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: setingViewModel.selectedCategory?['id'] ==
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
                        color: setingViewModel.selectedCategory?['id'] ==
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
          // Text(setingViewModel.selectedCategory!['id'].toString()??""),
          // Text(setingViewModel.selectedCategory!['name']
          //     .toString() ?? ""),
          SizedBox(height: 200.h),
          Center(
            child: Container(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: setingViewModel.loading
                    ? null // Disable button if loading
                    : () {
                        if (setingViewModel.selectedCategory != null) {
                          setingViewModel.fetchInfluencerCategoryData(
                            context,
                            category: setingViewModel.selectedCategory!['name']
                                .toString(),
                            categoryId: setingViewModel.selectedCategory!['id'],
                          );

                          // if (!setingViewModel.loading) {
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
                child: setingViewModel.loading
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
