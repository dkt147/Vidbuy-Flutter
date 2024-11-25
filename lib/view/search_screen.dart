import 'dart:async';

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

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchcontroller = TextEditingController();
  String enteredText = '';
  String selectedCategoryId = "1"; // Default category ID

  String? selectedValue;
  String? selectedSortKey;

  @override
  bool get wantKeepAlive => true;

  Map<String, String> sortOptions = {
    'Price: Low to High': 'lowtohigh',
    'Price: High to Low': 'hightolow',
    'Newest': 'newest',
    'Oldest': 'oldest',
  };
  double _sliderValue = 0;

  Timer? _debounce;

  void _fetchInfluencerListDebounced() {
    if (_debounce?.isActive ?? false)
      _debounce?.cancel(); // Cancel any ongoing debounce

    // Set a debounce duration (e.g., 500 milliseconds)
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _fetchInfluencerList();
    });
  }

  SearchScreenViewModel viewModel = SearchScreenViewModel();

  @override
  void initState() {
    super.initState();
    _fetchInfluencerList();
    viewModel.fetchCategoryList();
  }

  void onCategorySelected(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });

    _fetchInfluencerListDebounced();
  }

  void _onSortOptionSelected(String? sortKey) {
    if (selectedSortKey != sortKey) {
      setState(() {
        selectedSortKey = sortKey;
      });
      _fetchInfluencerListDebounced();
    }
  }

  void _onPriceChanged(double value) {
    if (_sliderValue != value) {
      setState(() {
        _sliderValue = value;
      });
      // _fetchInfluencerList();
    }
  }

  void _fetchInfluencerList() {
    viewModel.fetchInfluencerList(
      search: enteredText,
      categoryId: selectedCategoryId,
      sortBy: selectedSortKey,
      maxPrice: _sliderValue,
    );
    // });
  }

  @override
  void dispose() {
    _searchcontroller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 62.h,
              ),
              ChangeNotifierProvider(
                  create: (BuildContext context) =>
                      viewModel, // Assuming viewModel is an instance of HomeScreenViewModel
                  child: Consumer<SearchScreenViewModel>(
                      builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 23.h),
                        Center(
                          child: Container(
                            width: 335.w,
                            height: 50.h,
                            child: TextField(
                              controller: _searchcontroller,
                              onChanged: (text) {
                                setState(() {
                                  enteredText =
                                      text; // Update the entered text whenever it's changed
                                });
                                _fetchInfluencerList();
                              },
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "Nunito"),
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
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: Color(0xff908B8B), width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: Color(0xff908B8B), width: 2.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: Color(0xff908B8B), width: 2.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  borderSide: BorderSide(
                                      color: Color(0xff908B8B), width: 2.0),
                                ),
                                // border: InputBorder.none, // No border
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 22.h,
                        ),

                        value.influencerCategoryList.status == Status.LOADING
                            ? Center(child: CircularProgressIndicator())
                            : value.influencerCategoryList.status ==
                                    Status.ERROR
                                ? Center(
                                    child: Content(
                                        data: value
                                            .influencerCategoryList.message
                                            .toString(),
                                        size: 18))
                                : value.influencerCategoryList.status ==
                                        Status.COMPLETED
                                    ? StyledCarouselSlider(
                                        categories: value.categories,
                                        onChanged: (value) =>
                                            onCategorySelected(
                                                value.toString()))
                                    : Container(),

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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 8.h),
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
                                  hint: Text(
                                    'Sort by',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.h,
                                      fontFamily: "Lato",
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.h,
                                    fontFamily: "Lato",
                                  ),
                                  onChanged: (String? newValue) {
                                    if (newValue != null &&
                                        newValue != selectedValue) {
                                      setState(() {
                                        selectedValue = newValue;
                                        selectedSortKey = sortOptions[newValue];
                                      });
                                    }
                                    _fetchInfluencerListDebounced();
                                  },
                                  items: sortOptions.keys
                                      .map<DropdownMenuItem<String>>(
                                          (String label) {
                                    return DropdownMenuItem<String>(
                                      value: label,
                                      child: Text(label),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align text to start
                                children: [
                                  Stack(
                                    children: [
                                      SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          activeTrackColor: Colors.black,
                                          inactiveTrackColor:
                                              Colors.grey.withOpacity(0.5),
                                          thumbColor: Colors.black,
                                          trackHeight: 3.0,
                                          thumbShape: RoundSliderThumbShape(
                                              enabledThumbRadius: 10.0),
                                        ),
                                        child: Slider(
                                          value: _sliderValue,
                                          min: 0,
                                          max: 500,
                                          onChanged: (double value) {
                                            setState(() {
                                              _sliderValue = value;
                                            });
                                            _fetchInfluencerListDebounced();
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
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 31.h,
                        ),

                        value.influencersList.status == Status.LOADING
                            ? Center(child: CircularProgressIndicator())
                            : value.influencersList.status == Status.ERROR
                                ? Center(
                                    child: Content(
                                        data: value.influencersList.message
                                            .toString(),
                                        size: 18))
                                : value.influencersList.status ==
                                        Status.COMPLETED
                                    ? GridView.builder(
                                        shrinkWrap:
                                            true, // Ensure GridView doesn't take up extra space
                                        physics: ScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          // 2 items per row
                                          crossAxisSpacing: 5
                                              .w, // Horizontal space between items
                                          mainAxisSpacing: 30
                                              .h, // Vertical space between rows
                                          // childAspectRatio:
                                          //     2, // Adjust the aspect ratio as needed
                                        ),
                                        itemCount: value
                                            .influencersList
                                            .data!
                                            .data!
                                            .length, // Assuming you have a data list
                                        itemBuilder: (context, index) {
                                          final influencer = value
                                              .influencersList
                                              .data!
                                              .data![index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: GestureDetector(
                                              onTap: () {
                                                navigate(
                                                    context,
                                                    InfluencerProfileScreen(
                                                      influencerId: influencer
                                                          .id
                                                          .toString(),
                                                    ));
                                              },
                                              child: InfluencerCardWidget2(
                                                image: influencer.image
                                                    .toString(), // Use actual data from the API
                                                influencerName:
                                                    influencer.name.toString(),
                                                categoryName: influencer
                                                    .influencerCategories!
                                                    .first
                                                    .name
                                                    .toString(),
                                                price: "€5673",
                                                rating: influencer.reviewCount
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Container(),

                        //               ChangeNotifierProvider(
                        //   create: (BuildContext context) => viewModel,
                        //   child: Consumer<SearchScreenViewModel>(
                        //     builder: (context, value, child) {
                        //       switch (value.influencersList.status) {
                        //         case Status.INIT:
                        //           return Container();
                        //         case Status.LOADING:
                        //           return const Center(child: CircularProgressIndicator());
                        //         case Status.ERROR:
                        //           return Center(
                        //             child: Content(
                        //                 data: value.influencersList.message.toString(),
                        //                 size: 18),
                        //           );
                        //         case Status.COMPLETED:
                        //           return GridView.builder(
                        //             shrinkWrap:
                        //                 true, // Ensure GridView doesn't take up extra space
                        //             physics: ScrollPhysics(),
                        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //               crossAxisCount: 2,
                        //               // 2 items per row
                        //               crossAxisSpacing:
                        //                   5.w, // Horizontal space between items
                        //               mainAxisSpacing: 30.h, // Vertical space between rows
                        //               // childAspectRatio:
                        //               //     2, // Adjust the aspect ratio as needed
                        //             ),
                        //             itemCount: value.influencersList.data!.data!
                        //                 .length, // Assuming you have a data list
                        //             itemBuilder: (context, index) {
                        //               final influencer =
                        //                   value.influencersList.data!.data![index];
                        //               return Padding(
                        //                 padding: const EdgeInsets.symmetric(horizontal: 25),
                        //                 child: GestureDetector(
                        //                   onTap: () {
                        //                     navigate(
                        //                         context,
                        //                         InfluencerProfileScreen(
                        //                           influencerId: influencer.id.toString(),
                        //                         ));
                        //                   },
                        //                   child: InfluencerCardWidget2(
                        //                     image: influencer.image
                        //                         .toString(), // Use actual data from the API
                        //                     influencerName: influencer.name.toString(),
                        //                     categoryName: influencer
                        //                         .influencerCategories!.first.name
                        //                         .toString(),
                        //                     price: "€5673",
                        //                     rating: influencer.reviewCount.toString(),
                        //                   ),
                        //                 ),
                        //               );
                        //             },
                        //           );

                        //         case null:
                        //       }
                        //       return Container();
                        //     },
                        //   ),
                        // ),
                      ],
                    );
                  })),
              SizedBox(
                height: 70.h,
              ),
            ])));
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
