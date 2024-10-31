import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/influencer_profile_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_search_screen_view_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String selectedValue = 'Sort by';

  List<String> sortOptions = [
    'Sort by',
    'Price: Low to High',
    'Price: High to Low',
    'Newest',
    'Oldest'
  ];
  double _sliderValue = 25;

  @override
  Widget build(BuildContext context) {
     final viewModel = Provider.of<SearchScreenViewModel>(context, listen: false);
    viewModel.fetchInfluencerList();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 62.h,
            ),
            Center(
              child: Container(
                width: 335.w,
                height: 50.h,
                child: TextField(
                  style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
                  decoration: InputDecoration(
                    hintText: 'Discover celebrities...',
                    suffixIcon: Image.asset(
                      "assets/Icon/cancel.png",
                      height: 20.h,
                    ),
                    prefixIcon: Image.asset(
                      "assets/Icon/searchIcon.png",
                      height: 18.h,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 14.h,
                      // color: Color(0xff8E8E8E), // Placeholder text color
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide:
                          BorderSide(color: Color(0xff908B8B), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide:
                          BorderSide(color: Color(0xff908B8B), width: 2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide:
                          BorderSide(color: Color(0xff908B8B), width: 2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide:
                          BorderSide(color: Color(0xff908B8B), width: 2.0),
                    ),
                    // border: InputBorder.none, // No border
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 22.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Content(data: "data", size: 15.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    width: 169.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: DropdownButton<String>(
                      value: selectedValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24.h,
                      underline: SizedBox(),
                      isExpanded: true,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.h,
                        fontFamily: "Lato",
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: sortOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to start
                    children: [
                      Stack(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.grey.withOpacity(0.5),
                              thumbColor: Colors.black,
                              trackHeight: 3.0,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                            ),
                            child: Slider(
                              value: _sliderValue,
                              min: 0,
                              max: 100,
                              onChanged: (double value) {
                                setState(() {
                                  _sliderValue = value;
                                });
                              },
                            ),
                          ),
                          // Positioned price label to the right of the slider
                          Positioned(
                            right: 25.w,
                            top: 0,
                            // left: 0.w, // Align with the slider's thumb vertically
                            child: Content(
                              data: '€${_sliderValue.toInt()}',
                              size: 12.h,
                              family: "Lato",
                              weight: FontWeight.w500,
                            ),
                          ),
                          Positioned(
                            right: 25.w,
                            top: 25.h,
                            child: Content(
                              data: 'Max Price',
                              size: 12.h,
                              family: "Lato",
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      // Max price label just below the slider
                    ],
                  ),
                ],
              ),
            ),
            //   ],
            // )

            SizedBox(
              height: 31.h,
            ),
            
                  Consumer<SearchScreenViewModel>(
                    // Assume data is in HomeScreenViewModel
                    builder: (context, value, child) {
                      switch (value.influencersList.status) {
                        case Status.INIT:
                          return Container();
                        case Status.LOADING:
                          return Center(
                              child: const CircularProgressIndicator());
                        case Status.ERROR:
                          return Center(
                            child: Content(
                                data:
                                    value.influencersList.message.toString(),
                                size: 18),
                          );
                        case Status.COMPLETED:
                          return Column(
              children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigate(context, InfluencerProfileScreen());
                      },
                      child: InfluencerCardWidget2(
                        image: "assets/Vector/influencer.png",
                        influencerName: "Creaty",
                        categoryName: "Actor",
                        price: "€ 1234.56",
                        rating: "1234.56",
                      ),
                    ),
                    SizedBox(
                      width: 26.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, InfluencerProfileScreen());
                      },
                      child: InfluencerCardWidget2(
                        image: "assets/Vector/influencer.png",
                        influencerName: "Creaty",
                        categoryName: "Actor",
                        price: "€ 1234.56",
                        rating: "1234.56",
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 14.h,
                ),
                
              ],
            );
                        case null:
                      }
                      return Container();
                    },
                  ),

                
                
  Text(LocalData.token),
  Text(LocalData.roleId),

              
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}
