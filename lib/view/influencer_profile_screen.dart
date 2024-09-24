import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/create_order_screen.dart';

class InfluencerProfileScreen extends StatefulWidget {
  const InfluencerProfileScreen({super.key});

  @override
  State<InfluencerProfileScreen> createState() =>
      _InfluencerProfileScreenState();
}

class _InfluencerProfileScreenState extends State<InfluencerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  data: "Influencer",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: 383.w, // Width scaling
            height: 353.h, // Height scaling
            // margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10.r))),
            child: Stack(
              children: [
                // Background Image with a cut shape
                ClipPath(
                  clipper: SubtleRightSideSlantClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Vector/Cover.png'), // Replace with your image
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                    left: 15.w,
                    top: 250.h,
                    child: Container(
                      width: 106.w,
                      height: 106.h,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(radius)
                      // ),
                      child: Image.asset("assets/Vector/influencer.png"),
                    )),
                Positioned(
                    left: 246.w,
                    top: 220.h,
                    child: Container(
                        width: 118.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xffFFFFFF).withOpacity(0.8)),
                        child: Container(
                          child: Center(
                              child: Content(
                            data: "Entertainer",
                            size: 18.h,
                            weight: FontWeight.w700,
                            family: "Nunito",
                            color: Color(0xff7E7C7C),
                          )),
                        ))),

                // Name, Username, and Rating

                Positioned(
                    right: 15.w,
                    bottom: 30.h,
                    child: Image.asset(
                      "assets/Icon/Hand.png",
                      height: 30.h,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 18.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Content(
                      data: "Suson Goph",
                      size: 18.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, CreateOrderScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 130.w),
                        height: 33.h,
                        width: 107.h,
                        color: Color(0xff161436),
                        child: Center(
                            child: Content(
                          data: "Book Me",
                          size: 16.h,
                          family: "Nunito",
                          weight: FontWeight.w700,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Content(
                      data: "@susan.345",
                      size: 12.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                    SizedBox(width: 7.w),
                    Icon(Icons.star, color: Colors.yellow, size: 16.w),
                    Content(
                      data: "4.7",
                      size: 10.h,
                      family: "Nunito",
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Content(
                        data: "Designer, Photographer",
                        size: 12.h,
                        family: "Nunito",
                        weight: FontWeight.w600,
                      ),
                      Icon(
                        Icons.flag,
                        size: 17.h,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 28.w, right: 26.w, top: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Content(
                              data: "Total Reviews",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w400,
                            ),
                            Content(
                              data: "120k",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                            // Content(
                            //   data: "Total Request",
                            //   size: 12.h,
                            //   family: "Nunito",
                            //   weight: FontWeight.w400,
                            // ),
                          ],
                        ),
                        Column(
                          children: [
                            Content(
                              data: "Price Per Video",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w400,
                            ),
                            Content(
                              data: "50 to 200",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                            // Content(
                            //   data: "55",
                            //   size: 12.h,
                            //   family: "Nunito",
                            //   weight: FontWeight.w400,
                            // ),
                          ],
                        ),
                        Column(
                          children: [
                            Content(
                              data: "Total Request",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w400,
                            ),
                            Content(
                              data: "55",
                              size: 12.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                          Image.asset(
                            "assets/UI/grouppicture.jpg",
                            width: 124.w,
                            height: 110.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 19.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Content(
                              data: "Influencer Reviews",
                              size: 18.h,
                              family: "Nunito",
                              weight: FontWeight.w700,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Container(
                                    height: 180.h,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Color(0xffDDBFB2)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Image.asset(
                                          "assets/Vector/girl.png",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow,
                                                size: 16.w),
                                            Content(
                                              data: "4.7",
                                              size: 10.h,
                                              family: "Nunito",
                                              weight: FontWeight.w700,
                                            ),
                                          ],
                                        ),
                                        Content(
                                          data: "Wade Warren",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                        Content(
                                          data:
                                              "Awesome website and\nfunnel for your business",
                                          size: 16.h,
                                          family: "Lato",
                                          weight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubtleRightSideSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0); // Start at top-left
    path.lineTo(size.width, 0.0); // Move to top-right
    path.lineTo(size.width, size.height * 0.75); // Move diagonally to the right
    path.lineTo(0.0, size.height); // Create slant to bottom-left
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
