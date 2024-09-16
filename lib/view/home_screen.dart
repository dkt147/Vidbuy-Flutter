import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';

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
      body: Column(
        children: [
          SingleChildScrollView(
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
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25.h,
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.notifications, size: 25.h),
                        ],
                      ),
                    ],
                  ),
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
                      SliderWidget(text: "Music", picture: "assets/UI/mountain.jpg"),
                      SizedBox(
                        width: 50.w,
                      ),
                      SliderWidget(text: "Music", picture: "assets/UI/mountain.jpg"),
                      SizedBox(
                        width: 50.w,
                      ),
                      SliderWidget(text: "Music", picture: "assets/UI/mountain.jpg"),
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
                          image: "assets/Vector/influencer.png",
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
                  height: 23.h,
                ),
                 ListTile(
                      leading: CircleAvatar(
                        radius: 22.r,
                        backgroundImage: AssetImage("assets/UI/grouppicture.jpg"),
                      ),
                      title: Text(
                        '1000',
                        // textScaleFactor: 1.5,
                      ),
                      // trailing: Icon(Icons.done),
                      subtitle: Content(data: "Love like you do it", size: 12.h, weight: FontWeight.w400, family: "Nunito",)
                      // selected: true,
                    ),
              ],
            ),
          ),
        ],
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
