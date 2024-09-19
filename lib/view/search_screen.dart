import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
import 'package:vidbuy_app/resources/componenets/price_slider.dart';
import 'package:vidbuy_app/view/home_screen.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  TextEditingController _searchController = TextEditingController();

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
                      SliderWidget(
                          text: "Music", picture: "assets/Vector/Cover.png"),
                      SizedBox(
                        width: 50.w,
                      ),
                      SliderWidget(
                          text: "Music", picture: "assets/Vector/Cover.png"),
                      SizedBox(
                        width: 50.w,
                      ),
                      SliderWidget(
                          text: "Music", picture: "assets/Vector/Cover.png"),
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
                //   ],
                // )
      
      
                SizedBox(
                  height: 140.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InfluencerCardWidget(
                              image: "assets/Vector/influencer.png",
                              influencerName: "Creaty",
                              categoryName: "Actor"),
                              SizedBox(width: 26.w,),
                          InfluencerCardWidget(
                              image: "assets/Vector/influencer.png",
                              influencerName: "Creaty",
                              categoryName: "Actor"),
                          ],
                        ),
                        SizedBox(height: 14.h,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfluencerCardWidget(
                                image: "assets/Vector/influencer.png",
                                influencerName: "Creaty",
                                categoryName: "Actor"),
                                SizedBox(width: 26.w,),
                            InfluencerCardWidget(
                                image: "assets/Vector/influencer.png",
                                influencerName: "Creaty",
                                categoryName: "Actor"),
                            ],
                          ),
                                                  SizedBox(height: 14.h,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfluencerCardWidget(
                                image: "assets/Vector/influencer.png",
                                influencerName: "Creaty",
                                categoryName: "Actor"),
                                SizedBox(width: 26.w,),
                            InfluencerCardWidget(
                                image: "assets/Vector/influencer.png",
                                influencerName: "Creaty",
                                categoryName: "Actor"),
                            ],
                          ),
                          SizedBox(height: 14.h,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfluencerCardWidget(
                                image: "assets/Vector/influencer.png",
                                influencerName: "Creaty",
                                categoryName: "Actor"),
                                SizedBox(width: 26.w,),
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
                SizedBox(height: 70.h,),
        ],
      ),
    );
  }
}
