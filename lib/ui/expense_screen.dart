import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/models/detailed_expenditure.dart';
import 'home_screen.dart';

class ExpenseScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;

  late List<BarChartGroupData> showingBarGroups;
  String? _chosenValue;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Headings(
                    title: "Expenses",
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        border: Border.all(
                            width: 0.5, color: Colors.grey.withOpacity(0.8))),
                    child: DropdownButton<String>(
                      value: _chosenValue,

                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      underline: const SizedBox(),
                      //elevation: 5,
                      style: const TextStyle(color: Colors.black),
                      items: <String>[
                        'Today',
                        'Tomorrow',
                        '3 days ago',
                        'A week ago',
                        'A month ago',
                        '3 months ago',
                        '1 Year',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "Pick Date",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _chosenValue = value!;
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "\$ 2222.12",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ 170,368.00",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.green,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              barChart(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 4,
                        width: 15.0,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Income",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 4,
                        width: 15.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Spent",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    "Detailed expenses",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: detailedExpenditure.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            color: detailedExpenditure[index].color,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailedExpenditure[index].expenditure,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "\$ ${detailedExpenditure[index].ammount}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: SvgPicture.asset(
                                      detailedExpenditure[index].icon,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget barChart() {
    return SizedBox(
      height: 250,
      child: Expanded(
        child: BarChart(
          BarChartData(
            maxY: 20,
            barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.grey,
                  getTooltipItem: (_a, _b, _c, _d) => null,
                ),
                touchCallback: (FlTouchEvent event, response) {
                  if (response == null || response.spot == null) {
                    setState(() {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                    });
                    return;
                  }

                  touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                  setState(() {
                    if (!event.isInterestedForInteractions) {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                      return;
                    }
                    showingBarGroups = List.of(rawBarGroups);
                    if (touchedGroupIndex != -1) {
                      var sum = 0.0;
                      for (var rod
                          in showingBarGroups[touchedGroupIndex].barRods) {
                        sum += rod.toY;
                      }
                      final avg = sum /
                          showingBarGroups[touchedGroupIndex].barRods.length;

                      showingBarGroups[touchedGroupIndex] =
                          showingBarGroups[touchedGroupIndex].copyWith(
                        barRods: showingBarGroups[touchedGroupIndex]
                            .barRods
                            .map((rod) {
                          return rod.copyWith(toY: avg);
                        }).toList(),
                      );
                    }
                  });
                }),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                  reservedSize: 42,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  interval: 1,
                  getTitlesWidget: leftTitles,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: showingBarGroups,
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: Colors.red,
        width: width,
      ),
      BarChartRodData(
        toY: y2,
        color: Colors.green,
        width: width,
      ),
    ]);
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return Text(text, style: style);
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          'Mon',
          style: style,
        );
        break;
      case 1:
        text = const Text(
          'Tue',
          style: style,
        );
        break;
      case 2:
        text = const Text(
          'Wed',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          'Thu',
          style: style,
        );
        break;
      case 4:
        text = const Text(
          'Fri',
          style: style,
        );
        break;
      case 5:
        text = const Text(
          'Sat',
          style: style,
        );
        break;
      case 6:
        text = const Text(
          'Sun',
          style: style,
        );
        break;
      default:
        text = const Text(
          '',
          style: style,
        );
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 20), child: text);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
