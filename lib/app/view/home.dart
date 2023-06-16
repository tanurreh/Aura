// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:Aura/app/models/chat_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:Aura/app/app.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/painting.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isCardView = false;
  String currentTime = "This Week";
  String currentComparison = "None";
  List<dynamic> dbdata = [];
  HomeController _hc = Get.put(HomeController());
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage("assets/Logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text("Hello User",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 120.h,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            decoration: BoxDecoration(
              color: CustomColors.KlightBlue,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 30.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      color: _hc.selectedTime == Time.Week
                          ? CustomColors.KPrimaryColor
                          : null,
                      child: Text("This Week",
                          style: TextStyle(
                              color: _hc.selectedTime == Time.Week
                                  ? Colors.white
                                  : Colors.black)),
                      onPressed: () {
                        _hc.updateTime(Time.Week);
                      },
                    ),
                    MaterialButton(
                      height: 30.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      color: _hc.selectedTime == Time.Month
                          ? CustomColors.KPrimaryColor
                          : null,
                      child: Text("This Month",
                          style: TextStyle(
                              color: _hc.selectedTime == Time.Month
                                  ? Colors.white
                                  : Colors.black)),
                      onPressed: () {
                        _hc.updateTime(Time.Month);
                      },
                    ),
                    MaterialButton(
                      height: 30.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      color: _hc.selectedTime == Time.Year
                          ? CustomColors.KPrimaryColor
                          : null,
                      child: Text("This Year",
                          style: TextStyle(
                              color: _hc.selectedTime == Time.Year
                                  ? Colors.white
                                  : Colors.black)),
                      onPressed: () {
                        _hc.updateTime(Time.Year);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          "Comaprison",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                      Container(
                        width: 72.w,
                        child: MaterialButton(
                          height: 30.h,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          color: _hc.selectedComparison == Comparison.None
                              ? CustomColors.KPrimaryColor
                              : null,
                          child: Text("None",
                              style: TextStyle(
                                color: _hc.selectedComparison == Comparison.None
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 13.sp,
                              )),
                          onPressed: () {
                            _hc.updateComparison(Comparison.None);
                          },
                        ),
                      ),
                      MaterialButton(
                        height: 30.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        color: _hc.selectedComparison == Comparison.Neightbour
                            ? CustomColors.KPrimaryColor
                            : null,
                        child: Text(
                          "Neighbors",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: _hc.selectedComparison ==
                                      Comparison.Neightbour
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        onPressed: () {
                          _hc.updateComparison(Comparison.Neightbour);
                        },
                      ),
                      FittedBox(
                        child: Container(
                          child: MaterialButton(
                            height: 30.h,
                            minWidth: 40.w,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            color: _hc.selectedComparison == Comparison.City
                                ? CustomColors.KPrimaryColor
                                : null,
                            child: Text(
                              "City",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color:
                                      _hc.selectedComparison == Comparison.City
                                          ? Colors.white
                                          : Colors.black),
                            ),
                            onPressed: () {
                              _hc.updateComparison(Comparison.City);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DisplayContainer(
                title: 'HDPE',
                titleImage: "assets/hdpe.png",
                unit: 'Kg',
                value: '200',
              ),
              DisplayContainer(
                title: 'PET',
                titleImage: 'assets/pet.png',
                unit: 'Kg',
                value: '10',
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DisplayContainer(
                title: 'PP',
                titleImage: "assets/pp.png",
                unit: 'Kg',
                value: '10',
              ),
              DisplayContainer(
                title: 'LDPE',
                titleImage: 'assets/ldpe.png',
                unit: 'Kg',
                value: '20',
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 15.h),
              child: _buildStackedColumnChart())
        ],
      ));
    });
  }

  SfCartesianChart _buildStackedColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Energy Consumption'),
      legend: Legend(
          isVisible: !isCardView, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: <ChartSeries>[
        // Initialize line series
        LineSeries<ChartData, String>(
            // Enables the tooltip for individual series
            enableTooltip: true,
            dataSource: [
              // Bind data source
              ChartData('Jan', 35),
              ChartData('Feb', 28),
              ChartData('Mar', 34),
              ChartData('Apr', 32),
              ChartData('May', 40)
            ],
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ],
      tooltipBehavior: _tooltipBehavior,
    );
  }

//   dynamic columndata() {
//     if (r1 == "This Week") {
//       return _getStackedColumnSeriesweek();
//     } else if (r1 == "This Month") {
//       return _getStackedColumnSeriesmonth();
//     } else {
//       return _getStackedColumnSeriesyear();
//     }
//   }

//   /// Returns the list of chart serie which need to render
// //   /// on the stacked column chart.
//   List<StackedColumnSeries<ChartSampleData, String>>
//       _getStackedColumnSeriesweek() {
//     List<ChartSampleData> data = [];

//     for (int i = 0; i < 7; i++) {
//       List<dynamic> db = dbdata
//           .where((element) =>
//               DateTime.parse(element["timestamp"]).year == DateTime.now().year)
//           .where((element2) =>
//               DateTime.parse(element2["timestamp"]).month ==
//               DateTime.now().month)
//           .where((element3) =>
//               DateTime.parse(element3["timestamp"]).day ==
//               DateTime.now().subtract(Duration(days: i + 1)).day)
//           .toList();
//       num val = 0;
//       for (var data in db) {
//         if (data != null) {
//           val = val + data["power"];
//         }
//       }
//       if (r2 == "None") {
//         val = val / 1;
//       } else if (r2 == "Neighbors") {
//         if (neighbourController.neighbourUser.length != 0) {
//           val = val / neighbourController.neighbourUser.length;
//         } else {
//           val = val / 1;
//         }
//       } else {
//         if (neighbourController.cityuser.length != 0) {
//           val = val / neighbourController.cityuser.length;
//         } else {
//           val = val / 1;
//         }
//       }

//       data.add(ChartSampleData(
//           x: DateFormat.EEEE()
//               .format(DateTime.now().subtract(Duration(days: i + 1)))
//               .substring(0, 3),
//           y: val,
//           thirdSeriesYValue: 65));
//     }

//     final List<ChartSampleData> chartData = data;
//     return <StackedColumnSeries<ChartSampleData, String>>[
//       StackedColumnSeries<ChartSampleData, String>(
//         dataSource: chartData.reversed.toList(),
//         isTrackVisible: false,
//         name: "",
//         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//         yValueMapper: (ChartSampleData sales, _) => sales.y,
//         color: splashColor,
//       ),
//     ];
//   }

//   List<StackedColumnSeries<ChartSampleData, String>>
//       _getStackedColumnSeriesyear() {
//     List<ChartSampleData> data = [];
//     List<String> months = [
//       'January',
//       'February',
//       'March',
//       'April',
//       'May',
//       'June',
//       'July',
//       'August',
//       'September',
//       'October',
//       'November',
//       'December'
//     ];

//     for (int i = 0; i < 12; i++) {
//       List<dynamic> sortMonthList = dbdata
//           .where((element) =>
//               DateTime.parse(element["timestamp"]).year == DateTime.now().year)
//           .toList();
//       List<dynamic> db = sortMonthList
//           .where((element1) =>
//               DateFormat.MMMM().format(DateTime.parse(element1["timestamp"])) ==
//               months[i])
//           .toList();

//       num val = 0;
//       for (var data in db) {
//         if (data["power"] != null) {
//           val = val + data["power"];
//         }
//       }
//       print(val);
//       if (r2 == "None") {
//         val = val / 1;
//       } else if (r2 == "Neighbors") {
//         if (neighbourController.neighbourUser.length != 0) {
//           val = val / neighbourController.neighbourUser.length;
//         } else {
//           val = val / 1;
//         }
//       } else {
//         if (neighbourController.cityuser.length != 0) {
//           val = val / neighbourController.cityuser.length;
//         } else {
//           val = val / 1;
//         }
//       }

//       data.add(ChartSampleData(
//           x: months[i].substring(0, 3), y: val, thirdSeriesYValue: 65));
//     }

//     final List<ChartSampleData> chartData = data;
//     return <StackedColumnSeries<ChartSampleData, String>>[
//       StackedColumnSeries<ChartSampleData, String>(
//         dataSource: chartData,
//         isTrackVisible: false,
//         name: "",
//         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//         yValueMapper: (ChartSampleData sales, _) => sales.y,
//         color: splashColor,
//       ),
//     ];
//   }

//   List<StackedColumnSeries<ChartSampleData, String>>
//       _getStackedColumnSeriesmonth() {
//     List<ChartSampleData> data = [];

//     for (int i = 0; i < 4; i++) {
//       List<dynamic> db = dbdata
//           .where((element) =>
//               DateTime.parse(element["timestamp"]).month ==
//               DateTime.now().month)
//           .where((element2) =>
//               DateTime.parse(element2["timestamp"]).weekOfMonth == i + 1)
//           .toList();
//       print(db);
//       num val = 0;
//       for (var data in db) {
//         val = val + data["power"];
//       }
//       if (r2 == "None") {
//         val = val / 1;
//       } else if (r2 == "Neighbors") {
//         if (neighbourController.neighbourUser.length != 0) {
//           val = val / neighbourController.neighbourUser.length;
//         } else {
//           val = val / 1;
//         }
//       } else {
//         if (neighbourController.cityuser.length != 0) {
//           val = val / neighbourController.cityuser.length;
//         } else {
//           val = val / 1;
//         }
//       }

//       data.add(
//           ChartSampleData(x: "Week ${i + 1}", y: val, thirdSeriesYValue: 65));
//     }

//     final List<ChartSampleData> chartData = data;
//     return <StackedColumnSeries<ChartSampleData, String>>[
//       StackedColumnSeries<ChartSampleData, String>(
//         dataSource: chartData,
//         isTrackVisible: false,
//         name: "",
//         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//         yValueMapper: (ChartSampleData sales, _) => sales.y,
//         color: splashColor,
//       ),
//     ];
//   }
// }

// class ChartSampleData {
//   /// Holds the datapoint values like x, y, etc.,
//   ChartSampleData(
//       {this.x,
//       this.y,
//       this.xValue,
//       this.yValue,
//       this.secondSeriesYValue,
//       this.thirdSeriesYValue,
//       this.pointColor,
//       this.size,
//       this.text,
//       this.open,
//       this.close,
//       this.low,
//       this.high,
//       this.volume});

//   /// Holds x value of the datapoint
//   final dynamic x;

//   /// Holds y value of the datapoint
//   final num? y;

//   /// Holds x value of the datapoint
//   final dynamic xValue;

//   /// Holds y value of the datapoint
//   final num? yValue;

//   /// Holds y value of the datapoint(for 2nd series)
//   final num? secondSeriesYValue;

//   /// Holds y value of the datapoint(for 3nd series)
//   final num? thirdSeriesYValue;

//   /// Holds point color of the datapoint
//   final Color? pointColor;

//   /// Holds size of the datapoint
//   final num? size;

//   /// Holds datalabel/text value mapper of the datapoint
//   final String? text;

//   /// Holds open value of the datapoint
//   final num? open;

//   /// Holds close value of the datapoint
//   final num? close;

//   /// Holds low value of the datapoint
//   final num? low;

//   /// Holds high value of the datapoint
//   final num? high;

//   /// Holds open value of the datapoint
//   final num? volume;
//
// }
}

class DisplayContainer extends StatelessWidget {
  final String titleImage;
  final String title;
  final String value;
  final String unit;
  const DisplayContainer({
    Key? key,
    required this.titleImage,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 122.w,
        height: 87.h,
        margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        decoration: BoxDecoration(
          color: CustomColors.KlightBlue,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   titleImage, // "assets/volt.png",
                //   width: 20.w,
                //   height: 20.h,
                //   color: CustomColors.KPrimaryColor,
                // ),
                Text(title, //"Voltage",
                    style: TextStyle(color: Colors.black, fontSize: 12.sp))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(value,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold)),
                Text(unit,
                    style: TextStyle(color: Colors.black, fontSize: 12.sp))
              ],
            ),
          ],
        ));
  }
}
