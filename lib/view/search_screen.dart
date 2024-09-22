import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
import 'package:vidbuy_app/resources/componenets/price_slider.dart';
import 'package:vidbuy_app/view/home_screen.dart';
import 'package:vidbuy_app/view/influencer_profile_screen.dart';

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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 62.h,
          ),
          Center(
            child: ContentField(
              label: "",
              hint: "Discover Celebrities",
              prefixIcon: Icon(Icons.search),
              controller: _searchController,
              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              // validate: validateEmail,
              keyboardType: TextInputType.multiline,
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SliderWidget(text: "Music", picture: "assets/Vector/Cover.png"),
                SizedBox(
                  width: 50.w,
                ),
                SliderWidget(text: "Music", picture: "assets/Vector/Cover.png"),
                SizedBox(
                  width: 50.w,
                ),
                SliderWidget(text: "Music", picture: "assets/Vector/Cover.png"),
              ],
            ),
          ),
          // Row(
          //   children: [
          // // Container(
          // //   height: 169.h,
          // //   width: 55.h,
          // //   child: ContentField(
          // //                   label: "",
          // //                   hint: "Discover Celebrities",
          // //                   prefixIcon: Icon(Icons.search),
          // //                   controller: _searchController,
          // //                   inputFormat: <TextInputFormatter>[
          // //   FilteringTextInputFormatter.singleLineFormatter
          // //                   ],
          // //                   // validate: validateEmail,
          // //                   keyboardType: TextInputType.multiline,
          // //                 ),
          // // ),
          // Container(
          //   color: Colors.amber,
          //   child: PriceSlider(
          //             initialValue: 25,
          //             onChanged: (double value) {
          //               // Handle slider value changes here
          //               print('Slider value: $value');
          //             },
          //             maxValue: 100,
          //           ),
          // ),
          Container(
            margin: EdgeInsets.only(left: 20.w, top: 22.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 100.0, // Adjust the maximum value as needed
                  divisions: 100,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  label: '€${_sliderValue.toStringAsFixed(2)}',
                  activeColor:
                      Colors.blue, // Adjust the active color as desired
                  inactiveColor:
                      Colors.grey, // Adjust the inactive color as desired
                ),
              ],
            ),
          ),
          //   ],
          // )

          SizedBox(
            height: 31.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigate(context, InfluencerProfileScreen());
                        },
                        child: InfluencerCardWidget(
                            image: "assets/Vector/influencer.png",
                            influencerName: "Creaty",
                            categoryName: "Actor"),
                      ),
                      SizedBox(
                        width: 26.w,
                      ),
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                      SizedBox(
                        width: 26.w,
                      ),
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                      SizedBox(
                        width: 26.w,
                      ),
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                      SizedBox(
                        width: 26.w,
                      ),
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                    ],
                  ),

                  //
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}
