import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/setting_view_model.dart';

class UpdateCategoryScreen extends StatefulWidget {
  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}

class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  SettingViewModel settingViewModel = SettingViewModel();

  @override
  void initState() {
    super.initState();

    // Provider.of<SettingViewModel>(context, listen: false)
    settingViewModel.fetchInfluencerCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch categories on build (or you can use initState in a StatefulWidget)
    // if (setingViewModel.categoryLoading) {
    //   return Center(child: CircularProgressIndicator());
    // }
    // if (setingViewModel.categories.isEmpty) {
    //   return Center(child: Text("No categories found."));
    // }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: Row(
              children: [
                Image.asset(
                  "assets/Icon/backarrow.png",
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Content(
                  data: "Update Category",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => settingViewModel,
            child: Consumer<SettingViewModel>(builder: (context, value, child) {
              switch (value.influencerCategoryList.status) {
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
                        data: value.influencerCategoryList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  return value.influencerCategoryList.data!.result!
                          .categorylist!.isEmpty
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
                                  "No Categories Currently",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30.h),
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
                              SizedBox(height: 50.h),

                              // SizedBox(height: 20.h),
                              Container(
                                // margin: EdgeInsets.only(left: 21.w),
                                child: Wrap(
                                  spacing: 5.w,
                                  runSpacing: 10.h,
                                  children: settingViewModel.categories
                                      .map((category) {
                                    return GestureDetector(
                                      onTap: () {
                                        settingViewModel.selectCategory(
                                            category); // Use view model to select category
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: settingViewModel
                                                          .selectedCategory?[
                                                      'id'] ==
                                                  category['id']
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          border: Border.all(
                                              color: Color(0xff000000),
                                              width: 1.w),
                                        ),
                                        child: Text(
                                          category['name'],
                                          style: TextStyle(
                                            fontSize: 15.h,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                            color: settingViewModel
                                                            .selectedCategory?[
                                                        'id'] ==
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

                              SizedBox(height: 200.h),
                              Center(
                                child: Container(
                                  width: 335.w,
                                  height: 50.h,
                                  child: ElevatedButton(
                                    onPressed: settingViewModel.loading
                                        ? null // Disable button if loading
                                        : () {
                                            if (settingViewModel
                                                    .selectedCategory !=
                                                null) {
                                              settingViewModel
                                                  .fetchInfluencerCategoryData(
                                                context,
                                                category: settingViewModel
                                                    .selectedCategory!['name']
                                                    .toString(),
                                                categoryId: settingViewModel
                                                    .selectedCategory!['id'],
                                              );

                                              // if (!setingViewModel.loading) {
                                              //     widget.onNextTab();
                                              //   }
                                            } else {
                                              Utils.snackBar(
                                                  "PLease select a category",
                                                  context);
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff5271FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                    ),
                                    child: settingViewModel.loading
                                        ? CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )
                                        : Text(
                                            "Update Category",
                                            style: TextStyle(
                                              fontSize: 20.h,
                                              color: Colors.white,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
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
