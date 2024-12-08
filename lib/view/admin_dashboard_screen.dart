// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class InfluencerChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Graphic Representation',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               'Influencers',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 16),
//             AspectRatio(
//               aspectRatio: 1.5,
//               child: BarChart(
//                 BarChartData(
//                   alignment: BarChartAlignment.spaceAround,
//                   maxY: 3000,
//                   barTouchData: BarTouchData(enabled: false),
//                   titlesData: FlTitlesData(
//                     show: true,
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         getTitlesWidget: (value, meta) {
//                           const style = TextStyle(
//                             color: Colors.black54,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           );
//                           switch (value.toInt()) {
//                             case 0:
//                               return Text('Jan', style: style);
//                             case 1:
//                               return Text('Feb', style: style);
//                             case 2:
//                               return Text('Mar', style: style);
//                             case 3:
//                               return Text('Apr', style: style);
//                             case 4:
//                               return Text('May', style: style);
//                             case 5:
//                               return Text('Jun', style: style);
//                             case 6:
//                               return Text('Jul', style: style);
//                             case 7:
//                               return Text('Aug', style: style);
//                             case 8:
//                               return Text('Sep', style: style);
//                             case 9:
//                               return Text('Oct', style: style);
//                             case 10:
//                               return Text('Nov', style: style);
//                             case 11:
//                               return Text('Dec', style: style);
//                             default:
//                               return Text('');
//                           }
//                         },
//                       ),
//                     ),
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 40,
//                         getTitlesWidget: (value, meta) {
//                           const style = TextStyle(
//                             color: Colors.black54,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           );
//                           return Text('${value.toInt()}', style: style);
//                         },
//                         interval: 1000,
//                       ),
//                     ),
//                     topTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     rightTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                   ),
//                   borderData: FlBorderData(
//                     show: true,
//                     border: Border(
//                       left: BorderSide(color: Colors.black12),
//                       bottom: BorderSide(color: Colors.black12),
//                     ),
//                   ),
//                   barGroups: _buildBarGroups(),
//                   gridData: FlGridData(show: false),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<BarChartGroupData> _buildBarGroups() {
//     return [
//       BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 1000, color: Colors.blue)]),
//       BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 500, color: Colors.blue)]),
//       BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 2000, color: Colors.blue)]),
//       BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 1500, color: Colors.blue)]),
//       BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 2500, color: Colors.blue)]),
//       BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 3000, color: Colors.blue)]),
//       BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 1500, color: Colors.blue)]),
//       BarChartGroupData(x: 7, barRods: [BarChartRodData(toY: 1000, color: Colors.blue)]),
//       BarChartGroupData(x: 8, barRods: [BarChartRodData(toY: 2500, color: Colors.blue)]),
//       BarChartGroupData(x: 9, barRods: [BarChartRodData(toY: 2000, color: Colors.blue)]),
//       BarChartGroupData(x: 10, barRods: [BarChartRodData(toY: 1500, color: Colors.blue)]),
//       BarChartGroupData(x: 11, barRods: [BarChartRodData(toY: 500, color: Colors.blue)]),
//     ];
//   }
// }

// class WeeklyInfluencerChart extends StatefulWidget {
//   @override
//   _WeeklyInfluencerChartState createState() => _WeeklyInfluencerChartState();
// }

// class _WeeklyInfluencerChartState extends State<WeeklyInfluencerChart> {
//   bool isMonthly = false; // Toggle for Week/Month switch

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Graphical representation',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 DropdownButton<String>(
//                   value: isMonthly ? 'Month' : 'Week',
//                   items: ['Week', 'Month']
//                       .map((label) => DropdownMenuItem(
//                             child: Text(label),
//                             value: label,
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       isMonthly = value == 'Month';
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 4),
//             Text(
//               'Influencers',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 16),
//             AspectRatio(
//               aspectRatio: 1.5,
//               child: BarChart(
//                 BarChartData(
//                   alignment: BarChartAlignment.spaceAround,
//                   maxY: 3000,
//                   barTouchData: BarTouchData(enabled: false),
//                   titlesData: FlTitlesData(
//                     show: true,
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         getTitlesWidget: (value, meta) {
//                           const style = TextStyle(
//                             color: Colors.black54,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           );
//                           if (isMonthly) {
//                             // Monthly Labels
//                             switch (value.toInt()) {
//                               case 0:
//                                 return Text('Jan', style: style);
//                               case 1:
//                                 return Text('Feb', style: style);
//                               case 2:
//                                 return Text('Mar', style: style);
//                               case 3:
//                                 return Text('Apr', style: style);
//                               case 4:
//                                 return Text('May', style: style);
//                               case 5:
//                                 return Text('Jun', style: style);
//                               case 6:
//                                 return Text('Jul', style: style);
//                               case 7:
//                                 return Text('Aug', style: style);
//                               case 8:
//                                 return Text('Sep', style: style);
//                               case 9:
//                                 return Text('Oct', style: style);
//                               case 10:
//                                 return Text('Nov', style: style);
//                               case 11:
//                                 return Text('Dec', style: style);
//                               default:
//                                 return Text('');
//                             }
//                           } else {
//                             // Weekly Labels
//                             switch (value.toInt()) {
//                               case 0:
//                                 return Text('MON', style: style);
//                               case 1:
//                                 return Text('TUE', style: style);
//                               case 2:
//                                 return Text('WED', style: style);
//                               case 3:
//                                 return Text('THU', style: style);
//                               case 4:
//                                 return Text('FRI', style: style);
//                               case 5:
//                                 return Text('SAT', style: style);
//                               case 6:
//                                 return Text('SUN', style: style);
//                               default:
//                                 return Text('');
//                             }
//                           }
//                         },
//                       ),
//                     ),
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 40,
//                         getTitlesWidget: (value, meta) {
//                           const style = TextStyle(
//                             color: Colors.black54,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           );
//                           return Text('${value.toInt()}', style: style);
//                         },
//                         interval: 1000,
//                       ),
//                     ),
//                     topTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     rightTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                   ),
//                   borderData: FlBorderData(
//                     show: true,
//                     border: Border(
//                       left: BorderSide(color: Colors.black12),
//                       bottom: BorderSide(color: Colors.black12),
//                     ),
//                   ),
//                   barGroups: _buildBarGroups(),
//                   gridData: FlGridData(show: false),
//                 ),
//               ),
//             ),
//             // WeeklyInfluencerChart(),
//           ],
//         ),
//       ),
//     );
//   }

//   List<BarChartGroupData> _buildBarGroups() {
//     return [
//       BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 1000, color: Colors.grey)]),
//       BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 2000, color: Colors.grey)]),
//       BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 500, color: Colors.grey)]),
//       BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 2500, color: Colors.grey)]),
//       BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 3000, color: Colors.grey)]),
//       BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 1500, color: Colors.grey)]),
//       BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 1200, color: Colors.grey)]),
//     ];
//   }
// }
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/model/admin_model/admin_graph_date_wise_data_model/admin_graph_date_wise_data_model.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_home_view_model.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  AdminHomeViewModel adminHomeViewModel = AdminHomeViewModel();
  String selectedOption = "Weekly";
  @override
  void initState() {
    super.initState();
    // final viewModel = Provider.of<HomeScreenViewModel>(context, listen: false);

    String startDate = getCurrentWeekStartDate();
    String endDate = getCurrentWeekEndDate();

    // Fetch data for the current week
    adminHomeViewModel.fetchAdminDateWiseGraphData(startDate, endDate);
    adminHomeViewModel.fetchAdminTotalInfluencerData();
    adminHomeViewModel.fetchAdminYearlyGraphData();
  }

  String getCurrentWeekStartDate() {
    DateTime now = DateTime.now();
    int daysToSubtract = now.weekday - DateTime.monday;
    DateTime startOfWeek = now.subtract(Duration(days: daysToSubtract));
    return DateFormat('yyyy-MM-dd').format(startOfWeek); // Format to yyyy-MM-dd
  }

  // Function to get the end date of the current week (Sunday)
  String getCurrentWeekEndDate() {
    DateTime now = DateTime.now();
    int daysToAdd = DateTime.sunday - now.weekday;
    DateTime endOfWeek = now.add(Duration(days: daysToAdd));
    return DateFormat('yyyy-MM-dd').format(endOfWeek); // Format to yyyy-MM-dd
  }

  final List<double> barData = [
    1,
    1.5,
    2,
    2.5,
    3,
    2.5,
    2.0,
    1.5,
    1,
    1.5,
    2,
    2.5
  ];

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: Size(375, 812));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Content(
          data: "Admin Home",
          size: 14.h,
          family: "Nunito",
          weight: FontWeight.w600,
        ),

        // Text(
        //   'Admin Home',
        //   style: TextStyle(color: Colors.black),
        // ),
        // bottom: PreferredSize(
        //   preferredSize: Size(double.infinity, 50.h),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Content(
        //         data: "Influncers",
        //         size: 16.h,
        //         family: "Lato",
        //         weight: FontWeight.w500,
        //       ),
        //       // Text('Influencers', style: TextStyle(color: Colors.black, fontSize: 16.sp)),
        //       Content(
        //         data: "Users",
        //         size: 16.h,
        //         family: "Lato",
        //         weight: FontWeight.w500,
        //       ),
        //       Content(
        //         data: "Billing",
        //         size: 16.h,
        //         family: "Lato",
        //         weight: FontWeight.w500,
        //       ),
        //     ],
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            ChangeNotifierProvider(
                create: (BuildContext context) =>
                    adminHomeViewModel, // Assuming viewModel is an instance of HomeScreenViewModel
                child: Consumer<AdminHomeViewModel>(
                    builder: (context, value, child) {
                  return Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First part: Influencer Category List
                        value.adminTotalInfluencerData.status == Status.LOADING
                            ? Center(child: CircularProgressIndicator())
                            : value.adminTotalInfluencerData.status ==
                                    Status.ERROR
                                ? Center(
                                    child: Content(
                                        data: value
                                            .adminTotalInfluencerData.message
                                            .toString(),
                                        size: 18))
                                : value.adminTotalInfluencerData.status ==
                                        Status.COMPLETED
                                    ? Center(
                                        child: _buildStatCard(value
                                            .adminTotalInfluencerData
                                            .data!
                                            .result!
                                            .totalInfluencer
                                            .toString()))
                                    : Container(),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Graphic Representation (Yearly)",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Content(
                                data: "Influencers",
                                size: 18.sp,
                                weight: FontWeight.bold,
                                // family: "Lato",
                              ),
                              SizedBox(height: 10.h),
                              Divider(
                                color: Colors.black.withOpacity(0.2),
                                endIndent: 1.w,
                                indent: 1.w,
                              ),
                            ],
                          ),
                        ),
                        value.adminYearlyGraphData.status == Status.LOADING
                            ? Center(child: CircularProgressIndicator())
                            : value.adminYearlyGraphData.status == Status.ERROR
                                ? Center(
                                    child: Content(
                                      data: value.adminYearlyGraphData.message
                                          .toString(),
                                      size: 18,
                                    ),
                                  )
                                : value.adminYearlyGraphData.status ==
                                        Status.COMPLETED
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: SizedBox(
                                          height: 200.h,
                                          width: 330.w,
                                          child: BarChart(
                                            BarChartData(
                                              alignment:
                                                  BarChartAlignment.spaceAround,
                                              maxY: 3, // Y-axis scale for 3k
                                              minY: 0,
                                              barTouchData: BarTouchData(
                                                enabled: true,
                                                touchTooltipData:
                                                    BarTouchTooltipData(
                                                  tooltipPadding:
                                                      const EdgeInsets.all(8),
                                                  tooltipMargin: 8,
                                                  tooltipRoundedRadius: 8,
                                                  tooltipBorder: BorderSide(
                                                    color: Colors.grey.shade300,
                                                    width: 1,
                                                  ),
                                                  getTooltipItem: (group,
                                                      groupIndex,
                                                      rod,
                                                      rodIndex) {
                                                    return BarTooltipItem(
                                                      '${(rod.toY * 1000).toInt()} views', // Show exact values
                                                      const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),

                                              titlesData: FlTitlesData(
                                                leftTitles: AxisTitles(
                                                  sideTitles: SideTitles(
                                                    showTitles: true,
                                                    getTitlesWidget:
                                                        (value, meta) {
                                                      return Text(
                                                        '${value.toInt()}k',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                        ),
                                                      );
                                                    },
                                                    interval: 1, // 1k intervals
                                                    reservedSize: 24,
                                                  ),
                                                ),
                                                bottomTitles: AxisTitles(
                                                  sideTitles: SideTitles(
                                                    showTitles: true,
                                                    getTitlesWidget:
                                                        (value, meta) {
                                                      const months = [
                                                        'Jan',
                                                        'Feb',
                                                        'Mar',
                                                        'Apr',
                                                        'May',
                                                        'Jun',
                                                        'Jul',
                                                        'Aug',
                                                        'Sep',
                                                        'Oct',
                                                        'Nov',
                                                        'Dec'
                                                      ];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 7),
                                                        child: Text(
                                                          months[value.toInt()],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    reservedSize: 40.h,
                                                  ),
                                                ),
                                                rightTitles: const AxisTitles(
                                                  sideTitles: SideTitles(
                                                      showTitles:
                                                          false), // Remove right titles
                                                ),
                                                topTitles: const AxisTitles(
                                                  sideTitles: SideTitles(
                                                      showTitles:
                                                          false), // Remove top titles
                                                ),
                                              ),
                                              gridData: FlGridData(
                                                show: true,
                                                drawVerticalLine: false,
                                                drawHorizontalLine: true,
                                                horizontalInterval: 1,
                                                checkToShowHorizontalLine:
                                                    (value) {
                                                  return value == 0 ||
                                                      value == 1 ||
                                                      value == 2 ||
                                                      value == 3;
                                                },
                                                getDrawingHorizontalLine:
                                                    (value) {
                                                  return const FlLine(
                                                    color: Colors.grey,
                                                    strokeWidth: 1,
                                                    dashArray: [5, 5],
                                                  );
                                                },
                                              ),
                                              barGroups: List.generate(
                                                  value
                                                      .adminYearlyGraphData
                                                      .data!
                                                      .result!
                                                      .length, (index) {
                                                final data = value
                                                    .adminYearlyGraphData
                                                    .data!
                                                    .result![index];
                                                final toYValue =
                                                    data.totalViews! / 1000;
                                                return BarChartGroupData(
                                                  x: index,
                                                  barRods: [
                                                    BarChartRodData(
                                                      toY: toYValue > 0.1
                                                          ? toYValue
                                                          : 0.1, // Ensure a minimum height for visibility
                                                      color: const Color(
                                                          0xFF4A3AFF),
                                                      width: 19.w,
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      borderSide:
                                                          BorderSide.none,
                                                    )
                                                  ],
                                                );
                                              }),
                                              borderData:
                                                  FlBorderData(show: false),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Graphic Representation (Yearly)",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Content(
                                    data: "Influencers",
                                    size: 18.sp,
                                    weight: FontWeight.bold,
                                    // family: "Lato",
                                  ),
                                  DropdownButton<String>(
                                    dropdownColor:
                                        Colors.white.withOpacity(0.9),
                                    value: selectedOption,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedOption = newValue!;
                                      });
                                    },
                                    items: ["Weekly", "Monthly"]
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Divider(
                                color: Colors.black.withOpacity(0.2),
                                endIndent: 1.w,
                                indent: 1.w,
                              ),
                            ],
                          ),
                        ),

                        value.adminDateWiseGraphData.status == Status.LOADING
                            ? Center(child: CircularProgressIndicator())
                            : value.adminDateWiseGraphData.status ==
                                    Status.ERROR
                                ? Center(
                                    child: Content(
                                      data: value.adminDateWiseGraphData.message
                                          .toString(),
                                      size: 18,
                                    ),
                                  )
                                : value.adminDateWiseGraphData.status ==
                                        Status.COMPLETED
                                    ? (() {
                                        // Create the 'prices' list only when status is 'COMPLETED'
                                        final List<String> weekdays = value
                                            .adminDateWiseGraphData
                                            .data!
                                            .result!
                                            .map((type) =>
                                                type.weekday as String)
                                            .toList();
                                        final List<int> reviews = value
                                            .adminDateWiseGraphData
                                            .data!
                                            .result!
                                            .map((type) =>
                                                type.totalViews as int)
                                            .toList();

                                        // Use 'prices' in the widget tree as needed
                                        return Column(
                                          children: [
                                            // Text('Prices: ${prices.join(', ')}'), // Example usage
                                            WeekdayBarChart(
                                              weekdays: weekdays,
                                              reviews: reviews,
                                            ),
                                          ],
                                        );
                                      })()
                                    : Container()

                        // value.adminDateWiseGraphData.status == Status.LOADING
                        //     ? Center(child: CircularProgressIndicator())
                        //     : value.adminDateWiseGraphData.status ==
                        //             Status.ERROR
                        //         ? Center(
                        //             child: Content(
                        //               data: value.adminDateWiseGraphData.message
                        //                   .toString(),
                        //               size: 18,
                        //             ),
                        //           )
                        //         : value.adminDateWiseGraphData.status ==
                        //                 Status.COMPLETED
                        //             ? Center(
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.symmetric(
                        //                       vertical: 5),
                        //                   child: SizedBox(
                        //                     height: 200.h,
                        //                     width: 330.w,
                        //                     child: BarChart(
                        //                       BarChartData(
                        //                         alignment: BarChartAlignment
                        //                             .spaceAround,
                        //                         maxY: 3,
                        //                         minY: 0,
                        //                         barTouchData:
                        //                             BarTouchData(enabled: true),
                        //                         titlesData: FlTitlesData(
                        //                           leftTitles: AxisTitles(
                        //                             sideTitles: SideTitles(
                        //                               showTitles: true,
                        //                               getTitlesWidget:
                        //                                   (value, meta) {
                        //                                 if (value == 0) {
                        //                                   return Text(
                        //                                     '0',
                        //                                     style: TextStyle(
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w300,
                        //                                       color: Colors
                        //                                           .black
                        //                                           .withOpacity(
                        //                                               0.5),
                        //                                     ),
                        //                                   );
                        //                                 } else if (value % 1 ==
                        //                                     0) {
                        //                                   return Text(
                        //                                     '${value.toInt()}k',
                        //                                     style: TextStyle(
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w300,
                        //                                       color: Colors
                        //                                           .black
                        //                                           .withOpacity(
                        //                                               0.5),
                        //                                     ),
                        //                                   );
                        //                                 }
                        //                                 return SizedBox
                        //                                     .shrink();
                        //                               },
                        //                               interval: 1,
                        //                               reservedSize: 24,
                        //                             ),
                        //                           ),
                        //                           bottomTitles: AxisTitles(
                        //                             sideTitles: SideTitles(
                        //                               showTitles: true,
                        //                               getTitlesWidget:
                        //                                   (value, meta) {
                        //                                 const months = [
                        //                                   'Jan',
                        //                                   'Feb',
                        //                                   'Mar',
                        //                                   'Apr',
                        //                                   'May',
                        //                                   'Jun',
                        //                                   'Jul',
                        //                                   'Aug',
                        //                                   'Sep',
                        //                                   'Oct',
                        //                                   'Nov',
                        //                                   'Dec'
                        //                                 ];
                        //                                 return Padding(
                        //                                   padding:
                        //                                       const EdgeInsets
                        //                                           .symmetric(
                        //                                           vertical: 7),
                        //                                   child: Text(
                        //                                     months[
                        //                                         value.toInt()],
                        //                                     style: TextStyle(
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w300,
                        //                                       color: Colors
                        //                                           .black
                        //                                           .withOpacity(
                        //                                               0.5),
                        //                                     ),
                        //                                   ),
                        //                                 );
                        //                               },
                        //                               reservedSize: 40.h,
                        //                             ),
                        //                           ),
                        //                           rightTitles: const AxisTitles(
                        //                             sideTitles: SideTitles(
                        //                                 showTitles: false),
                        //                           ),
                        //                           topTitles: const AxisTitles(
                        //                             sideTitles: SideTitles(
                        //                                 showTitles: false),
                        //                           ),
                        //                         ),
                        //                         gridData: FlGridData(
                        //                           show: true,
                        //                           drawVerticalLine: false,
                        //                           drawHorizontalLine: true,
                        //                           horizontalInterval: 1,
                        //                           checkToShowHorizontalLine:
                        //                               (value) {
                        //                             return value == 0 ||
                        //                                 value == 1 ||
                        //                                 value == 2 ||
                        //                                 value == 3;
                        //                           },
                        //                           getDrawingHorizontalLine:
                        //                               (value) {
                        //                             return const FlLine(
                        //                               color: Colors.grey,
                        //                               strokeWidth: 1,
                        //                               dashArray: [
                        //                                 5,
                        //                                 5
                        //                               ], // Dashed line
                        //                             );
                        //                           },
                        //                         ),
                        //                         barGroups: List.generate(
                        //                           12,
                        //                           (index) {
                        //                             final barData = value
                        //                                     .adminDateWiseGraphData
                        //                                     .data
                        //                                     ?.result ??
                        //                                 [];
                        //                             final toYValue = (index <
                        //                                     barData.length)
                        //                                 ? barData[index]
                        //                                         .totalViews! /
                        //                                     1000
                        //                                 : 0.1; // Ensure safe access and minimum height
                        //                             return BarChartGroupData(
                        //                               x: index,
                        //                               barRods: [
                        //                                 BarChartRodData(
                        //                                   toY: toYValue,
                        //                                   color: Colors.grey,
                        //                                   width: 19.w,
                        //                                   borderRadius:
                        //                                       BorderRadius.zero,
                        //                                   borderSide:
                        //                                       BorderSide.none,
                        //                                 ),
                        //                               ],
                        //                             );
                        //                           },
                        //                         ),
                        //                         borderData:
                        //                             FlBorderData(show: false),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               )
                        //             : Container()
                      ]);
                })),

            // Center(child: _buildStatCard()),
            // Center(
            //   child: SizedBox(
            //     height: 285.h,
            //     width: 330.w,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Graphic Representation",
            //           style: TextStyle(
            //               fontSize: 18.sp,
            //               fontWeight: FontWeight.w300,
            //               color: Colors.black.withOpacity(0.5)),
            //         ),
            //         Content(
            //           data: "Influencers",
            //           size: 18.sp,
            //           weight: FontWeight.bold,
            //           // family: "Lato",
            //         ),
            //         SizedBox(height: 10.h),
            //         Divider(
            //           color: Colors.black.withOpacity(0.2),
            //           endIndent: 1.w,
            //           indent: 1.w,
            //         ),
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.end,
            //         //   children: [
            //         //     Container(
            //         //       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            //         //       decoration: BoxDecoration(
            //         //         color: Colors.grey.shade200,
            //         //         borderRadius: BorderRadius.circular(20.r),
            //         //       ),
            //         //       child: Row(
            //         //         children: [
            //         //           Text("Month", style: TextStyle(fontSize: 14.sp)),
            //         //           Icon(Icons.arrow_drop_down),
            //         //         ],
            //         //       ),
            //         //     ),
            //         //   ],
            //         // ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 5),
            //           child: SizedBox(
            //             height: 200.h,
            //             width: 330.w,
            //             child: BarChart(
            //               BarChartData(
            //                   alignment: BarChartAlignment.spaceAround,
            //                   maxY: 3,
            //                   minY: 0,
            //                   barTouchData: BarTouchData(enabled: true),
            //                   titlesData: FlTitlesData(
            //                     leftTitles: AxisTitles(
            //                       sideTitles: SideTitles(
            //                         showTitles: true,
            //                         getTitlesWidget: (value, meta) {
            //                           if (value == 0) {
            //                             return Text(
            //                               '0',
            //                               style: TextStyle(
            //                                 fontWeight: FontWeight.w300,
            //                                 color:
            //                                     Colors.black.withOpacity(0.5),
            //                               ),
            //                             );
            //                           } else if (value % 1 == 0) {
            //                             return Text(
            //                               '${value.toInt()}k',
            //                               style: TextStyle(
            //                                 fontWeight: FontWeight.w300,
            //                                 color:
            //                                     Colors.black.withOpacity(0.5),
            //                               ),
            //                             );
            //                           }
            //                           return SizedBox.shrink();
            //                         },
            //                         interval: 1,
            //                         reservedSize: 24,
            //                       ),
            //                     ),
            //                     bottomTitles: AxisTitles(
            //                       sideTitles: SideTitles(
            //                         showTitles: true,
            //                         getTitlesWidget: (value, meta) {
            //                           const months = [
            //                             'Jan',
            //                             'Feb',
            //                             'Mar',
            //                             'Apr',
            //                             'May',
            //                             'Jun',
            //                             'Jul',
            //                             'Aug',
            //                             'Sep',
            //                             'Oct',
            //                             'Nov',
            //                             'Dec'
            //                           ];
            //                           return Padding(
            //                             padding: const EdgeInsets.symmetric(
            //                                 vertical: 7),
            //                             child: Text(
            //                                 style: TextStyle(
            //                                   fontWeight: FontWeight.w300,
            //                                   color:
            //                                       Colors.black.withOpacity(0.5),
            //                                 ),
            //                                 months[value.toInt()]),
            //                           );
            //                         },
            //                         reservedSize: 40.h,
            //                       ),
            //                     ),
            //                     rightTitles: const AxisTitles(
            //                       sideTitles: SideTitles(
            //                           showTitles: false), // Remove right titles
            //                     ),
            //                     topTitles: const AxisTitles(
            //                       sideTitles: SideTitles(
            //                           showTitles: false), // Remove top titles
            //                     ),
            //                   ),
            //                   gridData: FlGridData(
            //                     show: true,
            //                     drawVerticalLine: false,
            //                     drawHorizontalLine: true,
            //                     horizontalInterval: 1,
            //                     checkToShowHorizontalLine: (value) {
            //                       return value == 0 ||
            //                           value == 1 ||
            //                           value == 2 ||
            //                           value == 3;
            //                     },
            //                     getDrawingHorizontalLine: (value) {
            //                       return const FlLine(
            //                         color: Colors.grey,
            //                         strokeWidth: 1,
            //                         dashArray: [5, 5], // Dashed line
            //                       );
            //                     },
            //                   ),
            //                   barGroups: List.generate(12, (index) {
            //                     return BarChartGroupData(
            //                       x: index,
            //                       barRods: [
            //                         BarChartRodData(
            //                           toY: barData[index], // Example data
            //                           color: const Color(0xFF4A3AFF),
            //                           width: 19.w,
            //                           borderRadius: BorderRadius
            //                               .zero, // Remove rounded corners
            //                           borderSide: BorderSide
            //                               .none, // Ensure no border is applied
            //                         )
            //                       ],
            //                     );
            //                   }),
            //                   borderData: FlBorderData(show: false)),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(
              height: 40.h,
            ),

            // Center(
            //   child: SizedBox(
            //     height: 285.h,
            //     width: 330.w,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Graphic Representation",
            //           style: TextStyle(
            //               fontSize: 18.sp,
            //               fontWeight: FontWeight.w300,
            //               color: Colors.black.withOpacity(0.5)),
            //         ),
            //         Content(
            //           data: "Influencers",
            //           size: 18.sp,
            //           weight: FontWeight.bold,
            //           // family: "Lato",
            //         ),
            //         SizedBox(height: 10.h),
            //         Divider(
            //           color: Colors.black.withOpacity(0.2),
            //           endIndent: 1.w,
            //           indent: 1.w,
            //         ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade200,
            //         borderRadius: BorderRadius.circular(20.r),
            //       ),
            //       child: Row(
            //         children: [
            //           Text("Month", style: TextStyle(fontSize: 14.sp)),
            //           Icon(Icons.arrow_drop_down),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 5),
            //   child: SizedBox(
            //     height: 200.h,
            //     width: 330.w,
            //     child: BarChart(
            //       BarChartData(
            //           alignment: BarChartAlignment.spaceAround,
            //           maxY: 3,
            //           minY: 0,
            //           barTouchData: BarTouchData(enabled: true),
            //           titlesData: FlTitlesData(
            //             leftTitles: AxisTitles(
            //               sideTitles: SideTitles(
            //                 showTitles: true,
            //                 getTitlesWidget: (value, meta) {
            //                   if (value == 0) {
            //                     return Text(
            //                       '0',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.w300,
            //                         color:
            //                             Colors.black.withOpacity(0.5),
            //                       ),
            //                     );
            //                   } else if (value % 1 == 0) {
            //                     return Text(
            //                       '${value.toInt()}k',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.w300,
            //                         color:
            //                             Colors.black.withOpacity(0.5),
            //                       ),
            //                     );
            //                   }
            //                   return SizedBox.shrink();
            //                 },
            //                 interval: 1,
            //                 reservedSize: 24,
            //               ),
            //             ),
            //             bottomTitles: AxisTitles(
            //               sideTitles: SideTitles(
            //                 showTitles: true,
            //                 getTitlesWidget: (value, meta) {
            //                   const months = [
            //                     'Jan',
            //                     'Feb',
            //                     'Mar',
            //                     'Apr',
            //                     'May',
            //                     'Jun',
            //                     'Jul',
            //                     'Aug',
            //                     'Sep',
            //                     'Oct',
            //                     'Nov',
            //                     'Dec'
            //                   ];
            //                   return Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         vertical: 7),
            //                     child: Text(
            //                         style: TextStyle(
            //                           fontWeight: FontWeight.w300,
            //                           color:
            //                               Colors.black.withOpacity(0.5),
            //                         ),
            //                         months[value.toInt()]),
            //                   );
            //                 },
            //                 reservedSize: 40.h,
            //               ),
            //             ),
            //             rightTitles: const AxisTitles(
            //               sideTitles: SideTitles(
            //                   showTitles: false), // Remove right titles
            //             ),
            //             topTitles: const AxisTitles(
            //               sideTitles: SideTitles(
            //                   showTitles: false), // Remove top titles
            //             ),
            //           ),
            //           gridData: FlGridData(
            //             show: true,
            //             drawVerticalLine: false,
            //             drawHorizontalLine: true,
            //             horizontalInterval: 1,
            //             checkToShowHorizontalLine: (value) {
            //               return value == 0 ||
            //                   value == 1 ||
            //                   value == 2 ||
            //                   value == 3;
            //             },
            //             getDrawingHorizontalLine: (value) {
            //               return const FlLine(
            //                 color: Colors.grey,
            //                 strokeWidth: 1,
            //                 dashArray: [5, 5], // Dashed line
            //               );
            //             },
            //           ),
            //           barGroups: List.generate(12, (index) {
            //             return BarChartGroupData(
            //               x: index,
            //               barRods: [
            //                 BarChartRodData(
            //                   toY: barData[index], // Example data
            //                   color: Colors.grey,
            //                   width: 19.w,
            //                   borderRadius: BorderRadius
            //                       .zero, // Remove rounded corners
            //                   borderSide: BorderSide
            //                       .none, // Ensure no border is applied
            //                 )
            //               ],
            //             );
            //           }),
            //           borderData: FlBorderData(show: false)),
            //     ),
            //   ),
            // ),

            //         SizedBox(
            //           height: 100,
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            // _buildBarChartSection(
            //   title: "Graphic Representation",
            //   xLabels: [
            //     "Jan",
            //     "Feb",
            //     "Mar",
            //     "Apr",
            //     "May",
            //     "Jun",
            //   ],
            //   barColor: Color(0xff4A3AFF),
            // ),
            // SizedBox(height: 16.h),
            // _buildBarChartSection(
            //   title: "Graphical representation\nInfluencers",
            //   xLabels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
            //   barColor: Color(0xff85848F),
            // ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String influencersCount) {
    return Container(
      width: 222.w,
      height: 80.h,
      decoration: BoxDecoration(
        // color: Colors.green,
        gradient: const LinearGradient(
          // begin: Alignment.topRight,
          // end: Alignment.bottomLeft,
          // stops: [
          //   0.1,
          //   0.4,
          //   0.6,
          //   0.9,
          // ],
          colors: [
            Color(0xff67D47F),
            Color(0xff459556),
          ],
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(Icons.person, color: Colors.orange, size: 40.h),
          Image.asset(
            "assets/Icon/woman.png",
            height: 45.h,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Content(
                data: "Number of Influencers",
                size: 14.h,
                family: "Lato",
                weight: FontWeight.w600,
                color: Colors.white,
              ),
              Content(
                data: influencersCount,
                size: 20.h,
                weight: FontWeight.w600,
                family: "Lato",
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildDateWiseGraph(ApiResponse<AdminGraphDateWiseDataModel> data) {
  // Weekdays for the X-axis
  List<String> weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

  // Default values for 7 days (Initialize to 0 views)
  List<int> viewsData = List.generate(7, (index) => 0);

  // Extract total_views for each weekday from the API response
  for (var item in data.data!.result!) {
    int dayIndex = weekdays.indexOf(item.weekday!.toUpperCase());
    if (dayIndex != -1) {
      viewsData[dayIndex] =
          item.totalViews!; // Update views for the correct weekday
    }
  }

  // Debug: Print the viewsData to verify
  print('Views Data: $viewsData');

  // Prepare the graph data (bar chart)
  List<BarChartGroupData> barGroups = [];
  for (int i = 0; i < 7; i++) {
    barGroups.add(
      BarChartGroupData(
        x: i, // X-axis position (representing each day)
        barRods: [
          BarChartRodData(
            toY: viewsData[i] / 1000.0, // Convert views to 'k' scale
            color: viewsData[i] > 0
                ? Colors.blue
                : Colors.grey, // Show grey for 0 views
            width: 16,
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide.none,
          ),
        ],
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: SizedBox(
      height: 250, // Adjust height as needed
      width: double.infinity,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 3, // This corresponds to 3000 views (3k)
          minY: 0,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1, // Ensure only 0, 1k, 2k, 3k labels appear
                getTitlesWidget: (value, meta) {
                  int intValue = value.toInt();
                  if (intValue == 0) {
                    // Show '0'
                    return Text(
                      '0',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    );
                  } else if (intValue == 1) {
                    // Show '1k'
                    return Text(
                      '1k',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    );
                  } else if (intValue == 2) {
                    // Show '2k'
                    return Text(
                      '2k',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    );
                  } else if (intValue == 3) {
                    // Show '3k'
                    return Text(
                      '3k',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    );
                  }
                  return SizedBox.shrink(); // Avoid out-of-range indices
                },
                reservedSize: 32,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index >= 0 && index < 7) {
                    return Text(
                      weekdays[
                          index], // Show the weekday label (MON, TUE, etc.)
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    );
                  }
                  return SizedBox.shrink(); // Avoid out-of-range indices
                },
                reservedSize: 32,
              ),
            ),
            rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Hide right titles
            topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false)), // Hide top titles
          ),
          gridData: FlGridData(show: true, drawVerticalLine: false),
          borderData: FlBorderData(show: false),
          barGroups: barGroups,
        ),
      ),
    ),
  );
}

class WeekdayBarChart extends StatelessWidget {
  final List<String> weekdays;
  final List<int> reviews;

  WeekdayBarChart({required this.weekdays, required this.reviews});

  // Getter to generate bar chart data based on input lists
  List<BarChartGroupData> getBarChartData() {
    // Ensure that the weekdays list and reviews list have the same length
    if (weekdays.length != reviews.length) {
      throw ArgumentError(
          "Weekdays and reviews lists must have the same length.");
    }

    // Calculate the max total views (to scale the y-axis)
    double maxTotalViews = reviews.fold(0, (max, data) {
      // Ensure maxTotalViews is always double
      return data > max ? data : max;
    }).toDouble();

    // Adjust maxY to always have a proper scale, like 0k, 1k, 2k, 3k, etc.
    double maxY =
        (maxTotalViews / 1000).ceilToDouble(); // Round up to nearest whole 'k'

    // Ensure maxY is at least 3k for proper chart scaling (if the data is too small)
    if (maxY < 3) {
      maxY = 3.0; // Ensure we have up to 3k
    }

    // Prepare the data
    List<BarChartGroupData> barGroups = List.generate(weekdays.length, (index) {
      int totalViews = reviews[index];
      double totalViewsInK = (totalViews / 1000.0); // Convert to 'k' value
      int weekdayIndex = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
      ].indexOf(weekdays[index]);

      return BarChartGroupData(
        x: weekdayIndex,
        barRods: [
          BarChartRodData(
            toY: totalViewsInK > 0
                ? totalViewsInK
                : 0.1, // Ensure bars are visible even for 0
            color: totalViews == 0
                ? Colors.grey
                : Colors.blue, // Show grey for zero views
            width: 19,
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide.none,
          ),
        ],
      );
    });

    return barGroups;
  }

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = getBarChartData();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 200,
        width: 330,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY:
                3, // Make sure it's at least 3k, or you can use dynamic maxY here
            minY: 0,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value == 0) {
                      return Text(
                        '0',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      );
                    }
                    if (value == 1) {
                      return Text(
                        '1k',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      );
                    }
                    if (value == 2) {
                      return Text(
                        '2k',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      );
                    }
                    if (value == 3) {
                      return Text(
                        '3k',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  interval: 1,
                  reservedSize: 24,
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const weekdays = [
                      'MON',
                      'TUE',
                      'WED',
                      'THU',
                      'FRI',
                      'SAT',
                      'SUN'
                    ];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        weekdays[value.toInt()],
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    );
                  },
                  reservedSize: 40,
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              drawHorizontalLine: true,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (value) {
                return value == 0 || value == 1 || value == 2 || value == 3;
              },
              getDrawingHorizontalLine: (value) {
                return const FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                  dashArray: [5, 5],
                );
              },
            ),
            barGroups: barGroups,
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}
