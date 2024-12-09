import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/view/request_video_scree.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/create_order_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateOrderScreen extends StatefulWidget {
  final String influencerName;
  final String influencerId;
  CreateOrderScreen(
      {required this.influencerId, required this.influencerName, super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  String selectedVideoRole = "";
  String? _selectedVideoType;
  String? _selectedCountryId;

  final List<String> categories = [
    "Another Person",
    "My Self",
  ];

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Fetch video type list in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel =
          Provider.of<CreateOrderViewModel>(context, listen: false);
      // viewModel.fetchVideoTypeList(widget.influencerId.toString());
      viewModel.fetchVideoTypeList(widget.influencerId);
    });
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Another Person",
      "My Self",
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<CreateOrderViewModel>(
              builder: (context, viewModel, child) {
                switch (viewModel.influencerVideoTypeList.status) {
                  case Status.INIT:
                    return Container();
                  case Status.LOADING:
                    return SizedBox(
                      height: MediaQuery.of(context)
                          .size
                          .height, // Full screen height
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(
                        viewModel.influencerVideoTypeList.message.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  case Status.COMPLETED:
                    // List<Map<String, dynamic>> videoTypeList = viewModel
                    //         .influencerVideoTypeList.data!.result
                    //         ?.map<Map<String, dynamic>>(
                    //             (video) => {'id': video.id, 'name': video.name})
                    //         .toList() ??
                    // [];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 55.h),
                        _buildHeader(),
                        SizedBox(height: 30.h),
                        _buildVideoServiceInfo(),
                        SizedBox(height: 13.h),
                        _buildVideoRoleSelection(),
                        SizedBox(height: 17.h),
                        Container(
                          margin: EdgeInsets.only(bottom: 9.h, left: 17.w),
                          child: Text(
                            AppLocalizations.of(context)!.userWhosThisVideoFor,
                            style: TextStyle(
                                fontSize: 16.h,
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        _buildVideoTypeDropdown(viewModel),
                        SizedBox(height: 13.h),
                        _buildTextField(
                            AppLocalizations.of(context)!.userFrom,
                            AppLocalizations.of(context)!.userEnterName,
                            _fromController),
                        _buildTextField(
                            AppLocalizations.of(context)!.userTo,
                            AppLocalizations.of(context)!.userEnterName,
                            _toController),
                        _buildDetailsSection(),
                        SizedBox(height: 20.h),
                        _buildSubmitButton(viewModel),
                      ],
                    );
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(left: 21.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/Icon/backarrow.png", height: 25.h),
          ),
          SizedBox(width: 5.w),
          Content(
            data: AppLocalizations.of(context)!.userCreateOrder,
            size: 14.h,
            weight: FontWeight.w600,
            family: "Nunito",
          ),
        ],
      ),
    );
  }

  Widget _buildVideoServiceInfo() {
    return Container(
      margin: EdgeInsets.only(left: 26.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Content(
              data: AppLocalizations.of(context)!.userInfluencerVideoService,
              size: 20.h,
              weight: FontWeight.w500,
              family: "Lato"),
          Content(
              data:
                  AppLocalizations.of(context)!.userProvideTheVideoInformation,
              size: 14.h,
              weight: FontWeight.w300,
              family: "Lato"),
        ],
      ),
    );
  }

  Widget _buildVideoRoleSelection() {
    return Container(
      margin: EdgeInsets.only(left: 21.w),
      child: Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        children: categories.map((category) {
          return GestureDetector(
            onTap: () => setState(() => selectedVideoRole = category),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color:
                    selectedVideoRole == category ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: Color(0xff000000), width: 1.w),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 15.h,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                  color: selectedVideoRole == category
                      ? Colors.white
                      : Color(0xff000000),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVideoTypeDropdown(CreateOrderViewModel viewModel) {
    final selectedId = viewModel.selectedVideoTypeDetails?['id'];

    // Debug print
    print("Selected Video Type Details: ${viewModel.selectedVideoTypeDetails}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 9.h, left: 18.w),
            child: Text(
              AppLocalizations.of(context)!.userSelectVideoType,
              style: TextStyle(
                  fontSize: 16.h,
                  color: Colors.black,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500),
            )),
        Center(
          child: SizedBox(
            height: 50.h,
            width: 335.w,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.userSelectVideoType,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
              ),
              value: selectedId?.toString(),
              onChanged: (String? newValue) {
                final selectedVideoType = viewModel.videoTypes.firstWhere(
                  (videoType) => videoType['id'].toString() == newValue,
                  orElse: () => {},
                );

                if (selectedVideoType.isNotEmpty) {
                  viewModel.setVideoType(
                    selectedVideoType['id'].toString(),
                    selectedVideoType['name'],
                    selectedVideoType['price'],
                  );
                }
              },
              items: viewModel.videoTypes
                  .map<DropdownMenuItem<String>>((videoType) {
                return DropdownMenuItem<String>(
                  value: videoType['id'].toString(),
                  child: Text(videoType['name']),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController controller) {
    return Center(
      child: ContentField(
        label: label,
        hint: hint,
        colorr: Colors.transparent,
        controller: controller,
        inputFormat: <TextInputFormatter>[
          FilteringTextInputFormatter.singleLineFormatter
        ],
        validate: (p0) {},
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 9.h, left: 17.w),
          child: Text(
            AppLocalizations.of(context)!.userDetailsAboutRequest,
            style: TextStyle(
                fontSize: 16.h,
                color: Colors.black,
                fontFamily: "Lato",
                fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Container(
            width: 334.w,
            height: 141.h,
            child: TextField(
              controller: _detailController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!
                    .userDescriptionOfWhatIsGoingOn,
                hintStyle: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 14.h,
                  fontWeight: FontWeight.w500,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Color(0xff908B8B), width: 2.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(CreateOrderViewModel viewModel) {
    return Center(
      child: Container(
        width: 280.w,
        height: 50.h,
        child: ElevatedButton(
          onPressed: () {
            // if (_emailController.text.isEmpty) {
            //   snackBar("Enter Valid Email", context);
            // } else if (_passwordController.text.isEmpty) {
            //   snackBar(
            //     "Enter Password",
            //     context,
            //   );
            // } else if (_passwordController.text.length < 8) {
            //   snackBar(
            //       "Enter Minium 8 Characters of Password", context);
            // } else {
            //   // Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //         builder: (_) => TabBarWidget()));
            if (selectedVideoRole == "") {
              Utils.snackBar("Please enter video role", context);
            } else if (viewModel.selectedVideoTypeDetails!['name'] == "") {
              Utils.snackBar("Please select video type", context);
            } else if (_fromController.text.isEmpty) {
              Utils.snackBar("Please enter from details", context);
            } else if (_toController.text.isEmpty) {
              Utils.snackBar("Please select to details", context);
            } else if (_detailController.text.isEmpty) {
              Utils.snackBar(
                  "Please enter description about the video", context);
            } else {
              navigatePushReplace(
                  context,
                  RequestVideoScreen(
                    influencerId: widget.influencerId.toString(),
                    influencerName: widget.influencerName.toString(),
                    from: _fromController.text.toString(),
                    to: _toController.text.toString(),
                    description: _detailController.text.toString(),
                    videoFor: selectedVideoRole.toString(),
                    videotTypeId:
                        viewModel.selectedVideoTypeDetails!['id'].toString(),
                    videoPrice:
                        viewModel.selectedVideoTypeDetails!['price'].toString(),
                  ));
              // Utils.snackBar("all details", context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff5271FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.userNext,
            style: TextStyle(
                fontSize: 16.h, color: Colors.white, fontFamily: "Lato"),
          ),
        ),
      ),
    );
  }
}
