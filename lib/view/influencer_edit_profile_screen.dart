import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/view/change_password_screen.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/setting_view_model.dart';
import 'package:video_player/video_player.dart';

class InfluencerEditProfileScreen extends StatefulWidget {
  const InfluencerEditProfileScreen({super.key});

  @override
  State<InfluencerEditProfileScreen> createState() =>
      _InfluencerEditProfileScreenState();
}

class _InfluencerEditProfileScreenState
    extends State<InfluencerEditProfileScreen> {
  // SettingViewModel viewModel = SettingViewModel();
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  //  final ScrollController _scrollController = ScrollController();
  // String? _selectedCountry;

  @override
  void initState() {
    super.initState();
    // viewModel.fetchCountryList();
    // Listen to scroll events for pagination
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //    viewModel.fetchCountryList(loadMore: true);
    //   }
    // });
    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    // _scrollController.dispose();
    super.dispose();
  }

  // File? _image;

  // Future<void> _pickImage() async {
  //   try {
  //     final ImagePicker _picker = ImagePicker();
  //     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  //     if (image != null) {
  //       setState(() {
  //         _image = File(image.path);
  //       });
  //     }
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }

  // File? _media;
  // final ImagePicker _picker = ImagePicker();
  // bool _isImage = true;

  // Future<void> _pickMedia() async {
  //   final XFile? pickedFile = await _picker.pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 100,
  //   );

  //   if (pickedFile == null) {
  //     // If no image is selected, try to pick a video
  //     final XFile? pickedVideo =
  //         await _picker.pickVideo(source: ImageSource.gallery);
  //     if (pickedVideo != null) {
  //       setState(() {
  //         _media = File(pickedVideo.path);
  //         _isImage = false; // Mark as video
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _media = File(pickedFile.path);
  //       _isImage = true; // Mark as image
  //     });
  //   }
  // }

  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SettingViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 52.h), // Space from top
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
                    data: "Edit Profile",
                    size: 14.h,
                    weight: FontWeight.w600,
                    family: "Nunito",
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Create user account",
                  //   style: TextStyle(
                  //     fontSize: 28.h,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Content(
                    data: "Edit profile",
                    size: 30.h,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(height: 5.h),
                  Content(
                    data: "Below are your profile details",
                    size: 16.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      viewModel.pickProfileImage();
                    },
                    child: Consumer<SettingViewModel>(
                        builder: (context, viewModel, child) {
                      return SizedBox(
                        height: 89.h,
                        width: 87.w,
                        child: CircleAvatar(
                          radius: 40.r,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: viewModel.profileImage != null
                              ? FileImage(viewModel.profileImage!)
                              : null,
                          child: viewModel.profileImage == null
                              ? const Icon(Icons.camera_alt,
                                  size: 26, color: Colors.grey)
                              : null,
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.pickIntroVideo();
                    },
                    child: Consumer<SettingViewModel>(
                      builder: (context, viewModel, child) {
                        return SizedBox(
                          height: 89.h,
                          width: 87.w,
                          child: viewModel.introVideo != null &&
                                  viewModel.videoPlayerController != null &&
                                  viewModel.videoPlayerController!.value
                                      .isInitialized
                              ? ClipOval(
                                  child: AspectRatio(
                                    aspectRatio: viewModel
                                        .videoPlayerController!
                                        .value
                                        .aspectRatio,
                                    child: VideoPlayer(
                                        viewModel.videoPlayerController!),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 40.r,
                                  backgroundColor: Colors.grey[200],
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 26,
                                    color: Colors.grey,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Profile Photo",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Intro Video",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Container(
            //   height: 89.h,
            //   width: 87.w,
            //   child: CircleAvatar(
            //     radius: 40.r,
            //     backgroundColor: Colors.grey[200],
            //     child: Icon(
            //       Icons.camera_alt,
            //       size: 26.h,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentField(
                    label: "Your Name",
                    hint: "Enter Your Name",
                    colorr: Colors.transparent,
                    prefixIcon: Image.asset(
                      "assets/Icon/person.png",
                      height: 25.h,
                    ),
                    controller: _nameController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "Your username",
                    hint: "Enter Your Username",
                    colorr: Colors.transparent,
                    prefixIcon: Image.asset(
                      "assets/Icon/person.png",
                      height: 25.h,
                    ),
                    controller: _usernameController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  // ContentField(
                  //   label: "Your category",
                  //   hint: "[CATEGORY]",
                  //   colorr: Colors.transparent,
                  //   // prefixIcon: Icon(Icons.email),
                  //   suffixIcon: Image.asset(
                  //     "assets/Icon/down.png",
                  //   ),
                  //   controller: _emailController,
                  //   inputFormat: <TextInputFormatter>[
                  //     FilteringTextInputFormatter.singleLineFormatter
                  //   ],
                  //   keyboardType: TextInputType.emailAddress,
                  // ),
                  // SizedBox(height: 10.h),
                  // ContentField(
                  //   label: "Your Country",
                  //   hint: "[Country]",
                  //   colorr: Colors.transparent,
                  //   // prefixIcon: Icon(Icons.email),
                  //   suffixIcon: Image.asset(
                  //     "assets/Icon/down.png",
                  //   ),
                  //   controller: _emailController,
                  //   inputFormat: <TextInputFormatter>[
                  //     FilteringTextInputFormatter.singleLineFormatter
                  //   ],
                  //   keyboardType: TextInputType.emailAddress,
                  // ),

                  // ContentField(
                  //   label: "Your Country",
                  //   hint: "Enter Your Country",
                  //   colorr: Colors.transparent,
                  //   controller: _countryController,
                  //   inputFormat: <TextInputFormatter>[
                  //     FilteringTextInputFormatter.singleLineFormatter
                  //   ],
                  //   keyboardType: TextInputType.text,
                  // ),

                  //              ChangeNotifierProvider.value(
                  //   value: viewModel,
                  //   child: Consumer<SettingViewModel>(
                  //     builder: (context, viewModel, child) {
                  //       switch (viewModel.countryList.status) {
                  //         case Status.LOADING:
                  //           return const CircularProgressIndicator();
                  //         case Status.COMPLETED:
                  //           return Container(
                  //             height: 50.h,
                  //             width: 335.w,
                  //             child: DropdownButtonFormField<String>(
                  //               decoration: InputDecoration(
                  //                 contentPadding:
                  //                     const EdgeInsets.symmetric(horizontal: 20),
                  //                 focusedBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30.r),
                  //                   borderSide: const BorderSide(
                  //                       color: Color(0xff908B8B), width: 2.0),
                  //                 ),
                  //                 enabledBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30.r),
                  //                   borderSide: const BorderSide(
                  //                       color: Color(0xff908B8B), width: 2.0),
                  //                 ),
                  //               ),
                  //               hint: Text(
                  //                 "Select your country",
                  //                 style: TextStyle(
                  //                   fontSize: 16.h,
                  //                   color: Colors.black,
                  //                   fontFamily: "Lato",
                  //                   fontWeight: FontWeight.w500,
                  //                 ),
                  //               ),
                  //               value: _selectedCountry,
                  //               icon: Image.asset("assets/Icon/dropdown.png"),
                  //               items: viewModel.countries.map((country) {
                  //                 return DropdownMenuItem<String>(
                  //                   value: country.name,
                  //                   child: Text(
                  //                     country.name!,
                  //                     style: TextStyle(
                  //                       fontSize: 16.h,
                  //                       color: Colors.black,
                  //                       fontFamily: "Lato",
                  //                       fontWeight: FontWeight.w500,
                  //                     ),
                  //                   ),
                  //                 );
                  //               }).toList(),
                  //               onChanged: (String? newValue) {
                  //                 setState(() {
                  //                   _selectedCountry = newValue!;
                  //                 });
                  //               },
                  //               menuMaxHeight: 200.0,
                  //             ),
                  //           );
                  //         case Status.ERROR:
                  //           return Center(
                  //             child: Text(viewModel.countryList.message ?? 'Error'),
                  //           );
                  //         default:
                  //           return Container();
                  //       }
                  //     },
                  //   ),
                  // ),
                  // Text(_selectedCountry ?? ""),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "The email associated with this account is:",
                    hint: "Email",
                    colorr: Colors.transparent,
                    // prefixIcon: Icon(Icons.email),
                    // suffixIcon: Image.asset("assets/Icon/down.png",),
                    controller: _emailController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),

            // SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                navigate(context, ChangePasswordScreen());
              },
              child: Container(
                margin: EdgeInsets.only(left: 27.w),
                child: Text(
                  "Change Password?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.h,
                  ),
                ),
              ),
            ),
            // Container(
            //     margin: EdgeInsets.only(bottom: 9.h),
            //     child: Text(
            //       "Country",
            //       style: TextStyle(
            //           fontSize: 16.h,
            //           color: Colors.black,
            //           fontFamily: "Lato",
            //           fontWeight: FontWeight.w500),
            //     )),
            // CountryDropdownWidget(),
            SizedBox(height: 20.h),
            Center(child: Consumer<SettingViewModel>(
                builder: (context, viewModel, child) {
              return Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: viewModel.influencerEditProfileLoading
                      ? null // Disable button if loading
                      : () {
                          // Handle account creation
                          viewModel.fetchEditProfileResponse(
                              context,
                              _nameController.text.toString(),
                              _usernameController.text.toString(),
                              _emailController.text.toString(),
                              viewModel.base64Image.toString(), () {
                            _nameController.clear();
                            _usernameController.clear();
                            _emailController.clear();
                            viewModel.clearProfileImage();
                            viewModel.clearIntroVideo();
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 120.w,
                    //   vertical: 15.h,
                    // ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: viewModel.influencerEditProfileLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 20.h,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                ),
              );
            })),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CountryDropdownWidget extends StatefulWidget {
  @override
  _CountryDropdownWidgetState createState() => _CountryDropdownWidgetState();
}

class _CountryDropdownWidgetState extends State<CountryDropdownWidget> {
  String? _selectedCountry;
  SettingViewModel viewModel = SettingViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchCountryList(); // Initial fetch
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          Consumer<SettingViewModel>(
            builder: (context, value, child) {
              List<DropdownMenuItem<String>> countryItems = [];

              // Add countries to dropdown if available
              if (value.countryList.status == Status.COMPLETED) {
                var countries =
                    value.countryList.data?.result!.countryList!.data ?? [];
                countryItems = countries.map((country) {
                  return DropdownMenuItem<String>(
                    value: country.name,
                    child: Text(country.name!),
                  );
                }).toList();
              }

              // Add loading indicator and pagination controls to the dropdown
              if (value.countryLoading) {
                countryItems.add(DropdownMenuItem<String>(
                  enabled: false,
                  child: Center(child: CircularProgressIndicator()),
                ));
              } else {
                // Add pagination control as the last item in the dropdown
                countryItems.add(DropdownMenuItem<String>(
                  enabled: false, // Make this non-selectable
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_left),
                        onPressed: () {
                          value.decrementPage(); // Decrement page
                        },
                      ),
                      Text("Page ${value.currentPage}",
                          style: TextStyle(fontSize: 16.h)),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {
                          value.incrementPage(); // Increment page
                        },
                      ),
                    ],
                  ),
                ));
              }

              return SizedBox(
                height: 50.h,
                width: 335.w,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
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
                  ),
                  hint: Text(
                    "Select your country",
                    style: TextStyle(
                      fontSize: 16.h,
                      color: Colors.black,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: _selectedCountry,
                  icon: Image.asset("assets/Icon/dropdown.png"),
                  items: countryItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCountry = newValue!;
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// class CountryDropdownWidget extends StatefulWidget {
//   @override
//   _CountryDropdownWidgetState createState() => _CountryDropdownWidgetState();
// }

// class _CountryDropdownWidgetState extends State<CountryDropdownWidget> {
//   String? _selectedCountry;
//   bool _isLoading = false;  // To track if loading is in progress for pagination
//   SettingViewModel viewModel = SettingViewModel();

//   @override
//   void initState() {
//     super.initState();
//     viewModel.fetchCountryList(); // Initial fetch
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => viewModel,
//       child: Column(
//         children: [
//           // Dropdown for Country List
//           Consumer<SettingViewModel>(
//             builder: (context, value, child) {
//               if (_isLoading) {
//                 // Show loading spinner inside the dropdown when data is being fetched
//                 return SizedBox(
//                   height: 50.h,
//                   width: 335.w,
//                   child: DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                     ),
//                     hint: Text("Loading countries..."),
//                     value: _selectedCountry,
//                     icon: Image.asset("assets/Icon/dropdown.png"),
//                     items: [],  // Empty items while loading
//                     onChanged: (String? newValue) {},
//                   ),
//                 );
//               } else if (value.countryList.status == Status.LOADING) {
//                 return const CircularProgressIndicator();
//               } else if (value.countryList.status == Status.ERROR) {
//                 return Center(
//                   child: Text("Error: ${value.countryList.message}"),
//                 );
//               } else if (value.countryList.status == Status.COMPLETED) {
//                 var countries = value.countryList.data?.result!.countryList!.data ?? [];
//                 return SizedBox(
//                   height: 50.h,
//                   width: 335.w,
//                   child: DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                     ),
//                     hint: Text("Select your country"),
//                     value: _selectedCountry,
//                     icon: Image.asset("assets/Icon/dropdown.png"),
//                     items: countries.map((country) {
//                       return DropdownMenuItem<String>(
//                         value: country.name,
//                         child: Text(country.name!),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedCountry = newValue!;
//                       });
//                     },
//                   ),
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),

//           // Pagination Controls
//           PaginationControls(viewModel: viewModel, onPageChange: () {
//             setState(() {
//               _isLoading = true; // Set loading flag to true when page changes
//             });
//           }),
//         ],
//       ),
//     );
//   }
// }

// class PaginationControls extends StatelessWidget {
//   final SettingViewModel viewModel;
//   final VoidCallback onPageChange;

//   PaginationControls({required this.viewModel, required this.onPageChange});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SettingViewModel>(
//       builder: (context, value, child) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: Icon(Icons.arrow_left),
//               onPressed: () {
//                 onPageChange(); // Trigger loading inside dropdown
//                 viewModel.decrementPage(); // Decrement page
//               },
//             ),
//             Text("Page ${value.currentPage}"),
//             IconButton(
//               icon: Icon(Icons.arrow_right),
//               onPressed: () {
//                 onPageChange(); // Trigger loading inside dropdown
//                 viewModel.incrementPage(); // Increment page
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
