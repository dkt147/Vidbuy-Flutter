import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
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
  String selectedCategoryId = "1"; // Default category ID

  List<String> sortOptions = [
    'Sort by',
    'Price: Low to High',
    'Price: High to Low',
    'Newest',
    'Oldest'
  ];
  double _sliderValue = 25;

  @override
  void initState() {
    super.initState();
    final viewModel =
        Provider.of<SearchScreenViewModel>(context, listen: false);
    viewModel.fetchInfluencerList(selectedCategoryId);
    viewModel.fetchCategoryList();
  }

  void onCategorySelected(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
    _fetchInfluencerList();
  }

  void _fetchInfluencerList() {
    final viewModel =
        Provider.of<SearchScreenViewModel>(context, listen: false);
    viewModel.fetchInfluencerList(
        selectedCategoryId); // Call fetch with updated values
  }

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<SearchScreenViewModel>(context, listen: false);
    // viewModel.fetchInfluencerList("1");
    // viewModel.fetchCategoryList();

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

            Consumer<SearchScreenViewModel>(
              builder: (context, value, child) {
                switch (value.influencerCategoryList.status) {
                  case Status.INIT:
                    return Container();
                  case Status.LOADING:
                    return Center(child: const CircularProgressIndicator());
                  case Status.ERROR:
                    return Center(
                      child: Content(
                          data: value.influencerCategoryList.message.toString(),
                          size: 18),
                    );
                  case Status.COMPLETED:
                    return Center(
                      child: Column(children: [
                        StyledCarouselSlider(
                          categories: viewModel.categories,
                          onChanged: (value) =>
                              onCategorySelected(value.toString()),
                        )
                      ]),
                    );
                  case null:
                }
                return Container();

                // Return an empty container if no data
              },
            ),
            SizedBox(
              height: 22.h,
            ),
            Content(data: selectedCategoryId, size: 10),
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
                    return Center(child: const CircularProgressIndicator());
                  case Status.ERROR:
                    return Center(
                      child: Content(
                          data: value.influencersList.message.toString(),
                          size: 18),
                    );
                  case Status.COMPLETED:
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.w), // Padding if needed
                      child: GridView.builder(
                        shrinkWrap:
                            true, // Ensure GridView doesn't take up extra space
                        physics:
                            NeverScrollableScrollPhysics(), // Prevent internal scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items per row
                          crossAxisSpacing:
                              26.w, // Horizontal space between items
                          mainAxisSpacing: 14.h, // Vertical space between rows
                          childAspectRatio:
                              1, // Adjust the aspect ratio as needed
                        ),
                        itemCount: value.influencersList.data!.result!.data!.length , // Assuming you have a data list
                        itemBuilder: (context, index) {
                          final influencer =
                              value.influencersList.data!.result!.data![index];
                          return GestureDetector(
                            onTap: () {
                              navigate(
                                  context,
                                  InfluencerProfileScreen(
                                    data: influencer,
                                  ));
                            },
                            child: InfluencerCardWidget2(
                              image: influencer.image
                                  .toString(), // Use actual data from the API
                              influencerName: influencer.name.toString(),
                              categoryName: influencer.countryName.toString(),
                              price: influencer.priceRange.toString(),
                              rating: influencer.reviewCount.toString(),
                            ),
                          );
                        },
                      ),
                    );

                  case null:
                }
                return Container();
              },
            ),

            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}

class StyledCarouselSlider extends StatelessWidget {
  final List<Map<String, String?>> categories;
  final ValueChanged<String?> onChanged; // Update callback to pass the Id

  StyledCarouselSlider({
    required this.categories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: categories.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 250,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(item["image"]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"] ?? "No Title",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              item["subtitle"] ?? "No Subtitle",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 150,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.6,
            onPageChanged: (index, reason) {
              final itemId =
                  categories[index]["id"]; // Get the Id of the current item
              onChanged(itemId); // Pass the Id to the onChanged callback
            },
          ),
        ),
      ],
    );
  }
}
