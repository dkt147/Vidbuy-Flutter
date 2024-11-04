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

class CreateOrderScreen extends StatefulWidget {
  final String influencerId;
  CreateOrderScreen({required this.influencerId, super.key});

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
      viewModel.fetchVideoTypeList("1");

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
    final viewModel = Provider.of<CreateOrderViewModel>(context);
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
                    return const Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    return Center(
                      child: Text(
                        viewModel.influencerVideoTypeList.message.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  case Status.COMPLETED:
                    List<Map<String, dynamic>> videoTypeList = viewModel
                            .influencerVideoTypeList.data!.result
                            ?.map<Map<String, dynamic>>(
                                (video) => {'id': video.id, 'name': video.name})
                            .toList() ??
                        [];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 55.h),
                        _buildHeader(),
                        SizedBox(height: 30.h),
                        _buildVideoServiceInfo(),
                        _buildVideoRoleSelection(),
                        SizedBox(height: 13.h),
                        Container(
                          margin: EdgeInsets.only(bottom: 9.h, left: 17.w),
                          child: Text(
                            "Who's this video for?",
                            style: TextStyle(
                                fontSize: 16.h,
                                color: Colors.black,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        _buildVideoTypeDropdown(videoTypeList, viewModel),
                        SizedBox(height: 13.h),
                        _buildTextField("From", "Enter Name", _fromController),
                        _buildTextField("To", "Enter Name", _toController),
                        _buildDetailsSection(),
                        SizedBox(height: 20.h),
                        // Content(data: _selectedVideoType.toString(), size: 20),
                        Content(data: selectedVideoRole.toString(), size: 10),
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
            data: "Create Order",
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
              data: "Influencer Video Service",
              size: 20.h,
              weight: FontWeight.w500,
              family: "Lato"),
          Content(
              data: "Provide the video information",
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

Widget _buildVideoTypeDropdown(
    List<Map<String, dynamic>> videoTypeList, CreateOrderViewModel viewModel) {
  // Use an empty map as a fallback instead of null
  Map<String, dynamic> selectedVideoType = viewModel.selectedVideoTypeDetails != null
      ? videoTypeList.firstWhere(
          (item) => item['id'] == viewModel.selectedVideoTypeDetails!['id'],
          orElse: () => {'id': '', 'name': '', 'price': ''}, // default map
        )
      : {'id': '', 'name': '', 'price': ''};

       final selectedId = viewModel.selectedVideoTypeDetails?['id'];


  return Column(
    children: [
      Center(
        child: SizedBox(
          height: 50,
          width: 335,
          child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Video Type',
                border: OutlineInputBorder(),
              ),
              value: selectedId,
              onChanged: (String? newValue) {
                // Find the selected video type by its ID
                final selectedVideoType = viewModel.videoTypes.firstWhere(
                  (videoType) => videoType['id'].toString() == newValue,
                  orElse: () => {},
                );

                if (selectedVideoType.isNotEmpty) {
                  // Update the selected video type details in the ViewModel
                  viewModel.setVideoType(
                    selectedVideoType['id'],
                    selectedVideoType['name'],
                    selectedVideoType['price'],
                  );
                }
              },
              items: viewModel.videoTypes.map<DropdownMenuItem<String>>((videoType) {
                return DropdownMenuItem<String>(
                  value: videoType['id'].toString(), // Ensure this is a unique ID
                  child: Text(videoType['name']),
                );
              }).toList(),
            ),
        ),
      ),
      // Display selected video type details below the dropdown
      if (viewModel.selectedVideoTypeDetails != null)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
 if (viewModel.selectedVideoTypeDetails != null) ...[
              Text('Selected Video Type ID: ${viewModel.selectedVideoTypeDetails!['id']}'),
              Text('Selected Video Type Price: ${viewModel.selectedVideoTypeDetails!['price']}'),
            ] else ...[
              Text('No video type selected.'),
            ],
            ],
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
            "Details about Request",
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
                hintText: 'Description of what is going on..',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r)),
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
            if (_fromController.text.isEmpty) {
              Utils.snackBar("Please enter from details", context);
            } else if (_toController.text.isEmpty) {
              // navigate(context, RequestVideoScree());
              Utils.snackBar("Please enter to details", context);
            } else if (_detailController.text.isEmpty) {
              // navigate(context, RequestVideoScree());
              Utils.snackBar("Please enter details", context);
            } else if (_selectedVideoType != null) {
              // navigate(context, RequestVideoScree());
              Utils.snackBar("Please select video type", context);
            } else if (selectedVideoRole == "") {
              // navigate(context, RequestVideoScree());
              Utils.snackBar("Please enter from video for", context);
            } else {
              navigate(
                  context,
                  RequestVideoScree(
                    from: _fromController.text.toString(),
                    to: _toController.text.toString(),
                    description: _detailController.text.toString(),
                    videoFor: selectedVideoRole.toString(),
                    videotTypeId: "_selectedVideoType.toString()",
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
            "Next",
            style: TextStyle(
                fontSize: 16.h, color: Colors.white, fontFamily: "Lato"),
          ),
        ),
      ),
    );
  }
}
