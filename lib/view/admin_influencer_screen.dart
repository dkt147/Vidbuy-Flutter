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
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class InfluencerDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: Size(375, 812));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Content(data: "Admin Home", size: 14.h, family: "Nunito",weight: FontWeight.w600,), 
        
        // Text(
        //   'Admin Home',
        //   style: TextStyle(color: Colors.black),
        // ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Content(data: "Influncers", size: 16.h, family: "Lato",weight: FontWeight.w500,), 
              // Text('Influencers', style: TextStyle(color: Colors.black, fontSize: 16.sp)),
              Content(data: "Users", size: 16.h, family: "Lato",weight: FontWeight.w500,),
              Content(data: "Billing", size: 16.h, family: "Lato",weight: FontWeight.w500,),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Center(child: _buildStatCard()),
            SizedBox(height: 16.h),
            _buildBarChartSection(
              title: "Graphic Representation",
              xLabels: [
                "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
              ],
              barColor: Color(0xff4A3AFF),
            ),
            SizedBox(height: 16.h),
            _buildBarChartSection(
              title: "Graphical representation\nInfluencers",
              xLabels: [
                "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
              ],
              barColor: Color(0xff85848F),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard() {
    return Container(
      width: 222.w,
      height: 80.h,
      decoration: BoxDecoration(
        // color: Colors.green,
         gradient: LinearGradient(
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
          Image.asset("assets/Icon/woman.png", height: 45.h,),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Content(data: "Number of Influencers", size: 14.h, family: "Lato", weight: FontWeight.w600, color: Colors.white,),
              Content(data: "1000", size: 20.h, weight: FontWeight.w600,family: "Lato",color: Colors.white,),
              
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarChartSection({
  required String title,
  required List<String> xLabels,
  required Color barColor,
}) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 6,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   title,
        //   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        // ),
        Content(data: title, size: 18.h, weight: FontWeight.w400,family: "Lato",),
        Content(data: "Influencer", size: 20.h, weight: FontWeight.w700,family: "Lato",),
        // SizedBox(height: 10.h),
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
        SizedBox(height: 10.h),
        AspectRatio(
          aspectRatio: 1.6, // Adjust this ratio to fit the chart better
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 3000, // Adjust maxY to fit your data
              barTouchData: BarTouchData(enabled: false),
              // titlesData: FlTitlesData(
              //   // bottomTitles: AxisTitles(
              //   //   sideTitles: SideTitles(
              //   //     // showTitles: true,
              //   //     getTitlesWidget: (value, meta) {
              //   //       return Text(
              //   //         xLabels[value.toInt()],
              //   //         style: TextStyle(fontSize: 12.h),
              //   //       );
              //   //     },
              //   //   ),
              //   // ),
              //   // leftTitles: AxisTitles(
              //   //   sideTitles: SideTitles(
              //   //     showTitles: true,
              //   //     getTitlesWidget: (value, meta) {
              //   //       return Text(
              //   //         '${(value / 1000).toStringAsFixed(1)}k',
              //   //         style: TextStyle(fontSize: 12.sp),
              //   //       );
              //   //     },
              //   //     interval: 500, // Adjust interval to fit better
              //   //   ),
              //   // ),
              // ),  
              barGroups: [
                for (int i = 0; i < xLabels.length; i++)
                  BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: (i + 1) * 200.0.h, // Adjust bar height here
                        color: barColor,
                        width: 12.w, // Bar width adjusted
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