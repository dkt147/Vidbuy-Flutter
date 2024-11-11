import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/app_url.dart';
import 'package:vidbuy_app/resources/componenets/carousel_slider_category.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
import 'package:vidbuy_app/resources/componenets/influencer_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/cancel_screen.dart';
import 'package:vidbuy_app/view/giveaway_screen.dart';
import 'package:vidbuy_app/view/notification_screen.dart';
import 'package:vidbuy_app/view/pending_admin_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final TextEditingController _searchController = TextEditingController();

  // final Logger _logger = Logger();
  // late NetworkService _networkService;

  List<dynamic> categories = []; // List to hold category data
  // List<dynamic> influencers = [];
  // bool isLoading = true; // Loading state
  // String? errorMessage; // To hold error messages
  // String? userName;

  @override
  void initState() {
    super.initState();

    // _networkService = NetworkService(
    //   api: ApiService(),
    // );

    // _loadUserName();
    // fetchCategories();
    // fetchInfluencers(); // Fetch categories on init
  }

  // Future<void> fetchCategories() async {
  //   try {
  //     // Assuming you have a NetworkService instance
  //     setState(() {
  //       isLoading = true; // Stop loading
  //     });

  //     var response = await _networkService.getCategory(); // Fetch categories
  //     _logger.e(response);

  //     categories = response['list'];

  //     setState(() {
  //       isLoading = false; // Stop loading
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false; // Stop loading
  //     });
  //   }
  // }

  // Future<void> fetchInfluencers() async {
  //   try {
  //     // Assuming you have a NetworkService instance
  //     setState(() {
  //       isLoading = true; // Stop loading
  //     });

  //     var response = await _networkService.getInfluencers(); // Fetch categories
  //     _logger.e(response);

  //     influencers = response['list'];

  //     setState(() {
  //       isLoading = false; // Stop loading
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false; // Stop loading
  //     });
  //   }
  // }

  HomeScreenViewModel _homesScreenViewModell = HomeScreenViewModel();

  Future<List<String>> _getSuggestions(String query) async {
    // Replace this with your API call to fetch data
    // Here it's just simulating a network call
    await Future.delayed(Duration(milliseconds: 300));
    return _homesScreenViewModell.searchInfluencerList.data
        .where((suggestion) =>
            suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }


  String getGreeting() {
    int hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else if (hour < 20) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  // v

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeScreenViewModel>(context, listen: false);
    viewModel.fetchCategoryList();
    viewModel.fetchTrendingInfluencerList();
    viewModel.fetchGiveAwayList();
    viewModel.fetchRecentlyAddedList();
    return Scaffold(
      body:
          //  isLoading
          //     ? const Center(
          //         child: CircularProgressIndicator()) // Show loading indicator
          //     : errorMessage != null
          //         ? Center(child: Text(errorMessage!)) // Show error message
          //         :
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48.h),
            Container(
              margin: EdgeInsets.only(right: 18.w, left: 11.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      navigate(
                        context,
                        MainTabbarAdminWidget(
                          tabTitles: const [
                            "Pending Request",
                            "Approved",
                            "Canceled"
                          ],
                          screens: const [
                            PendingAdminScreen(),
                            PendingAdminScreen(),
                            CancelScreen(),
                          ],
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundImage: NetworkImage(LocalData.image),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    children: [
                      Content(
                        data: getGreeting(),
                        size: 14.h,
                        family: "Nunito",
                        color: const Color(0xff161436),
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data: LocalData.name,
                        size: 16.h,
                        family: "Nunito",
                        color: const Color(0xff0A071E),
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // navigate(context, InfluencerDonationsTabbarWidget());
                        },
                        child: Image.asset(
                          "assets/Icon/Hand.png",
                          height: 25.h,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          navigate(context, const NotificationScreen());
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
            SizedBox(height: 23.h),
       Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xff4B4A51),
          borderRadius: BorderRadius.circular(30),
        ),
        width: 349,
        child: TypeAheadField<String>(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _searchController,
            style: const TextStyle(color: Colors.white, fontFamily: "Nunito"),
            decoration: InputDecoration(
              hintText: 'Discover celebrities...',
              hintStyle: TextStyle(
                fontFamily: "Nunito",
                fontSize: 14,
                color: const Color(0xff8E8E8E),
              ),
              border: InputBorder.none,
            ),
          ),
          suggestionsCallback: _getSuggestions,
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(
                suggestion,
                style: TextStyle(color: Colors.black),
              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            _searchController.text = suggestion;
          },
          noItemsFoundBuilder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No results found',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          loadingBuilder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ),
            SizedBox(height: 13.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [

                //        SliderWidget(
                //         text: "category['name']",
                //         picture: "category[]" // Use the image from the API
                //       ),

                //     ]
                //   ),
                // ),

                Consumer<HomeScreenViewModel>(
                  builder: (context, value, child) {
                    switch (value.influencerCategoryList.status) {
                      case Status.INIT:
                        return Container();
                      case Status.LOADING:
                        return Center(child: const CircularProgressIndicator());
                      case Status.ERROR:
                        return Center(
                          child: Content(
                              data: value.influencerCategoryList.message
                                  .toString(),
                              size: 18),
                        );
                      case Status.COMPLETED:
                        return Center(
                          child: Column(children: [
                            StyledCarouselSlider(
                                categories: viewModel.categories)
                          ]),
                        );
                      case null:
                    }
                    return Container();

                    // Return an empty container if no data
                  },
                ),

                // Consumer<HomeScreenViewModel>(
                //   builder: (context, viewModel, child) {
                //     // Show loading indicator if data is being fetched
                //     if (viewModel.categoryLoading) {
                //       return Center(child: CircularProgressIndicator());
                //     }

                //     // Show category list when data is loaded
                //     return Center(
                //       child: SizedBox(
                //         height: 100.h,
                //         child: SingleChildScrollView(
                //           scrollDirection: Axis.horizontal,
                //           child: Row(
                //             children: viewModel.categories.map((category) {
                //               return SliderWidget(
                //                 text: category['name'],
                //                 picture:
                //                     category['image'], // Display image from API
                //               );
                //             }).toList(),
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),

                SizedBox(height: 40.h),
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
                  child: Consumer<HomeScreenViewModel>(
                    // Assume data is in HomeScreenViewModel
                    builder: (context, value, child) {
                      switch (value.trendingInfluencerList.status) {
                        case Status.INIT:
                          return Container();
                        case Status.LOADING:
                          return Center(
                              child: const CircularProgressIndicator());
                        case Status.ERROR:
                          return Center(
                            child: Content(
                                data: value.trendingInfluencerList.message
                                    .toString(),
                                size: 18),
                          );
                        case Status.COMPLETED:
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: value.trendingInfluencerList.data!.result!
                                .map((influencer) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => InfluencerProfileScreen(
                                  //         // influencer: influencer, // Pass the influencer data to the profile screen
                                  //         ),
                                  //   ),
                                  // );
                                },
                                child: InfluencerCardWidget(
                                  image: influencer.image
                                      .toString(), // Assuming 'image' is a URL or asset path
                                  influencerName: influencer.name
                                      .toString(), // Use actual name from API
                                  categoryName: influencer
                                      .influencerCategory!.first.name
                                      .toString(), // Or whichever field you need
                                ),
                              );
                            }).toList(),
                          );
                        case null:
                      }
                      return Container();
                    },
                  ),
                ),

                SizedBox(
                  height: 23.h,
                ),

                Consumer<HomeScreenViewModel>(
                  // Assume data is in HomeScreenViewModel
                  builder: (context, value, child) {
                    switch (value.giveAwayList.status) {
                      case Status.INIT:
                        return Container();
                      case Status.LOADING:
                        return Center(child: const CircularProgressIndicator());
                      case Status.ERROR:
                        return Center(
                          child: Content(
                              data: value.giveAwayList.message.toString(),
                              size: 18),
                        );
                      case Status.COMPLETED:
                        return Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ListTile(
                                  leading: CircleAvatar(
                                    radius: 22.r,
                                    backgroundImage: NetworkImage(value
                                        .giveAwayList.data!.result!.first.image
                                        .toString()),
                                  ),
                                  title: Text(
                                    value.giveAwayList.data!.result!.first.price
                                        .toString(),
                                    // textScaleFactor: 1.5,
                                  ),
                                  // trailing: Icon(Icons.done),
                                  subtitle: Content(
                                    data: value
                                        .giveAwayList.data!.result!.first.title
                                        .toString(),
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
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: Image.network(
                                          value.giveAwayList.data!.result!.first
                                              .image
                                              .toString(),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                            left: 300.w,
                                          ),
                                          child: Image.asset(
                                            "assets/Icon/bookmark.png",
                                            height: 31.h,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 16.63.h,
                                    width: 45.w,
                                    margin:
                                        EdgeInsets.only(left: 21.w, top: 7.h),
                                    // padding: EdgeInsets.all(50.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Color(0xffB0ABAB),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("assets/Icon/Heart.png"),
                                        Content(
                                          data: value.giveAwayList.data!.result!
                                              .first.like
                                              .toString(),
                                          size: 10.h,
                                          weight: FontWeight.w700,
                                          family: "Nunito",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60.h,
                                    width: 150
                                        .w, // Adjust based on your image size
                                    child: Stack(
                                      children: [
                                        for (int i = 0;
                                            i < 4;
                                            i++) // Loop to create multiple images
                                          Positioned(
                                            left: i *
                                                15.0.w, // Adjust to control the overlap amount
                                            child: CircleAvatar(
                                              radius: 15
                                                  .r, // Adjust the size of the images
                                              backgroundColor:
                                                  Colors.purple, // Border color
                                              child: CircleAvatar(
                                                radius: 28
                                                    .r, // Slightly smaller to create the border effect
                                                backgroundImage: AssetImage(
                                                    "assets/Vector/girl.png"),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ]);
                      case null:
                    }
                    return Container();
                  },
                ),

                // ListTile(
                //     leading: CircleAvatar(
                //       radius: 22.r,
                //       backgroundImage: AssetImage("assets/UI/grouppicture.jpg"),
                //     ),
                //     title: Text(
                //       '1000',
                //       // textScaleFactor: 1.5,
                //     ),
                //     // trailing: Icon(Icons.done),
                //     subtitle: Content(
                //       data: "Love like you do it",
                //       size: 12.h,
                //       weight: FontWeight.w400,
                //       family: "Nunito",
                //     )
                //     // selected: true,
                //     ),
                // GestureDetector(
                //   onTap: () {
                //     navigate(context, GivewayScreen());
                //   },
                //   child: Center(
                //     child: Stack(
                //       children: [
                //         Container(
                //           width: 331.w,
                //           height: 165.h,
                //           decoration: BoxDecoration(
                //               color: Colors.amber,
                //               borderRadius: BorderRadius.circular(10.r)),
                //           child: Image.asset(
                //             "assets/UI/giveaway.png",
                //             fit: BoxFit.contain,
                //           ),
                //         ),
                //         Container(
                //             margin: EdgeInsets.only(
                //               left: 300.w,
                //             ),
                //             child: Image.asset(
                //               "assets/Icon/bookmark.png",
                //               height: 31.h,
                //             )),
                //       ],
                //     ),
                //   ),
                // ),

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
                  child: Consumer<HomeScreenViewModel>(
                    // Assume data is in HomeScreenViewModel
                    builder: (context, value, child) {
                      switch (value.recentlyAddedList.status) {
                        case Status.INIT:
                          return Container();
                        case Status.LOADING:
                          return Center(
                              child: const CircularProgressIndicator());
                        case Status.ERROR:
                          return Center(
                            child: Content(
                                data:
                                    value.recentlyAddedList.message.toString(),
                                size: 18),
                          );
                        case Status.COMPLETED:
                          final users =
                              value.recentlyAddedList.data!.result!.users!;
                          final firstThreeUsers = users.take(3).toList();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: firstThreeUsers.map((influencer) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => InfluencerProfileScreen(
                                  //         // influencer: influencer, // Pass the influencer data to the profile screen
                                  //         ),
                                  //   ),
                                  // );
                                },
                                child: InfluencerCardWidget(
                                    image: influencer.image
                                        .toString(), // Assuming 'image' is a URL or asset path
                                    influencerName: influencer.name
                                        .toString(), // Use actual name from API
                                    categoryName: influencer
                                        .influencerCategory!.first.name
                                        .toString() // Or whichever field you need
                                    ),
                              );
                            }).toList(),
                          );
                        case null:
                      }
                      return Container();
                    },
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     InfluencerCardWidget(
                  //         image: "assets/Vector/kreaty.png",
                  //         influencerName: "Creaty",
                  //         categoryName: "Actor"),
                  //     InfluencerCardWidget(
                  //         image: "assets/Vector/bina.png",
                  //         influencerName: "Creaty",
                  //         categoryName: "Actor"),
                  //     InfluencerCardWidget(
                  //         image: "assets/Vector/influencer.png",
                  //         influencerName: "Creaty",
                  //         categoryName: "Actor"),
                  //   ],
                  // ),
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

// class SliderWidget extends StatelessWidget {
//   final String text;
//   final String picture;

//   const SliderWidget({
//     Key? key,
//     required this.text,
//     required this.picture,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Content(
//           data: text,
//           size: 20.h,
//           family: "Nunito",
//           weight: FontWeight.w900,
//         ),
//         SizedBox(height: 15.h),
//         SizedBox(
//           width: 173.w,
//           height: 173.h,
//           child: Stack(
//             children: [
//               Image.network(
//                 picture, // Use dynamic image
//                 height: 173.h,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Icon(
//                     Icons.error,
//                     size: 50,
//                     color: Colors.red,
//                   ); // Dynamic error handling
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               (loadingProgress.expectedTotalBytes ?? 1)
//                           : null,
//                     ),
//                   );
//                 },
//               ),
//               Positioned(
//                 top: 145.h,
//                 child: Container(
//                   width: 173.w,
//                   height: 40.h,
//                   decoration: BoxDecoration(
//                     color: Colors.black
//                         .withOpacity(0.7), // Semi-transparent background
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(7.r),
//                       bottomRight: Radius.circular(7.r),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Content(
//                         data: text, // Dynamic text
//                         size: 10.h,
//                         family: "Nunito",
//                         weight: FontWeight.w700,
//                         color: Colors.white,
//                       ),
//                       Content(
//                         data:
//                             "Additional Info", // Replace this with any dynamic field if needed
//                         size: 8.h,
//                         family: "Nunito",
//                         weight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
