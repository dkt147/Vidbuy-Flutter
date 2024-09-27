import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
import 'package:vidbuy_app/resources/componenets/influencer_donations_tabbar_widget.dart';
import 'package:vidbuy_app/view/giveaway_screen.dart';
import 'package:vidbuy_app/view/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 18.w, left: 11.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22.r,
                    backgroundImage: AssetImage("assets/UI/grouppicture.jpg"),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    children: [
                      Content(
                        data: "Good Evening",
                        size: 14.h,
                        family: "Nunito",
                        color: Color(0xff161436),
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data: "Benji Hovla",
                        size: 16.h,
                        family: "Nunito",
                        color: Color(0xff0A071E),
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigate(context, InfluencerDonationsTabbarWidget());
                        },
                        child: Image.asset(
                          "assets/Icon/Hand.png",
                          height: 25.h,
                        ),
                      ),
                      // Icon(
                      //   Icons.favorite,
                      //   color: Colors.red,
                      //   size: 25.h,
                      // ),
                      SizedBox(width: 8),
                      // Icon(Icons.notifications, size: 25.h),
                      GestureDetector(
                        onTap: () {
                          navigate(context, NotificationScreen());
                        },
                        child: Image.asset(
                          "assets/Icon/Notification.png",
                          height: 25.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Center(
            //   child: ContentField(
            //     label: "",
            //     hint: "Discover Celebrities",
            //     // family: "Nunito",
            //     colorr: Color(0xff4B4A51),
            //     heightt: 349.h,
            //     widthh: 48.w,
            //     prefixIcon: Icon(Icons.search),
            //     controller: _searchController,
            //     inputFormat: <TextInputFormatter>[
            //       FilteringTextInputFormatter.singleLineFormatter
            //     ],
            //     // validate: validateEmail,
            //     keyboardType: TextInputType.multiline,
            //   ),
            // ),
            SizedBox(
              height: 23.h,
            ),
            Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Color(0xff4B4A51), // Background color similar to the image
              borderRadius: BorderRadius.circular(30.r), // Rounded edges
            ),
            width: 349,
            height: 48.h,
            child: Row(
              children: [
                // Icon(
                //   Icons.search,
                //   color: Colors.grey[400], // Icon color similar to placeholder
                // ),
                Image.asset("assets/Icon/searchIcon.png", height: 18.h,),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
                    decoration: InputDecoration(
                      hintText: 'Discover celebrities...',
                      hintStyle: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14.h,
                        color: Color(0xff8E8E8E), // Placeholder text color
                      ),
                      border: InputBorder.none, // No border
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
            SizedBox(
              height: 13.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SliderWidget(
                          text: "Music", picture: "assets/Vector/Shortwave.png"),
                      SizedBox(
                        width: 50.w,
                      ),
                      SliderWidget(
                          text: "Podcast", picture: "assets/Vector/Cover.png"),
                      SizedBox(
                        width: 50.w,
                      ),
                      SliderWidget(
                          text: "Tv\nShows", picture: "assets/Vector/Shortwave.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.w),
                  child: Content(
                    data: "Trending Influencers",
                    size: 22.h,
                    family: "Nunito",
                    color: Color(0xff0A071E),
                    weight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                      InfluencerCardWidget(
                          image: "assets/Vector/bina.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                      InfluencerCardWidget(
                          image: "assets/Vector/kreaty.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                ListTile(
                    leading: CircleAvatar(
                      radius: 22.r,
                      backgroundImage:
                          AssetImage("assets/UI/grouppicture.jpg"),
                    ),
                    title: Text(
                      '1000',
                      // textScaleFactor: 1.5,
                    ),
                    // trailing: Icon(Icons.done),
                    subtitle: Content(
                      data: "Love like you do it",
                      size: 12.h,
                      weight: FontWeight.w400,
                      family: "Nunito",
                    )
                    // selected: true,
                    ),
                GestureDetector(
                  onTap: () {
                    navigate(context, GivewayScreen());
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 331.w,
                          height: 165.h,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Image.asset(
                            "assets/UI/giveaway.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                         margin: EdgeInsets.only(left: 300.w,), 
                          child: Image.asset("assets/Icon/bookmark.png", height: 31.h,)),
                      ],
                    ),
                  ),
                ),
                
                Row(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Container(
                      height: 16.63.h,
                      width: 45.w,
                      margin: EdgeInsets.only(left: 21.w, top: 7.h),
                      // padding: EdgeInsets.all(50.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xffB0ABAB),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/Icon/Heart.png"),
                          Content(
                            data: "244",
                            size: 10.h,
                            weight: FontWeight.w700,
                            family: "Nunito",
                          ),
                          
                        ],
                      ),
                    ),
                    SizedBox(
                    height: 60.h, 
                    width: 150.w,// Adjust based on your image size
                    child: Stack(
                      children: [
            for (int i = 0; i < 4; i++) // Loop to create multiple images
              Positioned(
                left: i * 15.0.w, // Adjust to control the overlap amount
                child: CircleAvatar(
                  radius: 15.r, // Adjust the size of the images
                  backgroundColor: Colors.purple, // Border color
                  child: CircleAvatar(
                    radius: 28.r, // Slightly smaller to create the border effect
                    backgroundImage: AssetImage("assets/Vector/girl.png"),
                  ),
                ),
              ),
                      ],
                    ),
                  ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.w),
                  child: Content(
                    data: "Recently Added",
                    size: 22.h,
                    family: "Nunito",
                    color: Color(0xff0A071E),
                    weight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfluencerCardWidget(
                          image: "assets/Vector/kreaty.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                      InfluencerCardWidget(
                          image: "assets/Vector/bina.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                      InfluencerCardWidget(
                          image: "assets/Vector/influencer.png",
                          influencerName: "Creaty",
                          categoryName: "Actor"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  String text;
  String picture;
  SliderWidget({super.key, required this.text, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Content(
          data: text,
          size: 20.h,
          family: "Nunito",
          weight: FontWeight.w900,
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: 173.w,
          height: 173.h,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(7.r),
          //     bottomRight: Radius.circular(7.r),
          //   )
          // ),
          child: Stack(children: [
            Image.asset(
              picture,
              height: 173.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 145.h,
              // left: 20.w,
              child: Container(
                width: 173.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: Color(0xff373535E3),
                    // color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7.r),
                      bottomRight: Radius.circular(7.r),
                    )),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Content(
                      data: "Agendat totila",
                      size: 10.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    Content(
                      data: "Strem stocker ",
                      size: 8.h,
                      family: "Nunito",
                      weight: FontWeight.w500,
                      color: Colors.white,
                    )
                  ],
                ),
                // child: Content(
                //               data: text,
                //               size: 20.h,
                //               family: "Nunito",
                //               weight: FontWeight.w900,
                //             ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
