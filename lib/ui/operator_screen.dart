import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:santander/ui/home_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../core/models/operators.dart';

class OperatorScreen extends StatefulWidget {
  OperatorScreen({Key? key}) : super(key: key);

  @override
  State<OperatorScreen> createState() => _OperatorScreenState();
}

class _OperatorScreenState extends State<OperatorScreen> {
  var searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Headings(
                          title: "Operations",
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Filters",
                            style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          searchController.clear();
                        },
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.search)),
                            hintText: "Search"),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 1.56,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemCount: operators.length,
                                itemBuilder: (context, index) {
                                  bool isSameDate = true;
                                  final String dateString =
                                      operators[index].time;
                                  final DateTime date =
                                      DateTime.parse(dateString);
                                  final item = operators[index];
                                  if (index == 0) {
                                    isSameDate = false;
                                  } else {
                                    final String prevDateString =
                                        operators[index - 1].time;
                                    final DateTime prevDate =
                                        DateTime.parse(prevDateString);
                                    isSameDate = date.isSameDate(prevDate);
                                  }
                                  if (index == 0 || !(isSameDate)) {
                                    return SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              timeago.format(DateTime.parse(
                                                  operators[index].time)),
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 15),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(10.0),
                                                        ),
                                                        image: DecorationImage(
                                                            fit: BoxFit.contain,
                                                            image: AssetImage(
                                                                operators[index]
                                                                    .img))),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        operators[index].text,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        DateTime.parse(
                                                                operators[index]
                                                                    .time)
                                                            .formatTime()
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "- ${operators[index].amount}\$",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFE1DFDF),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        operators[index].img))),
                                            // child: Image(
                                            //   fit: BoxFit.cover,
                                            //   image: AssetImage(sendmoney[index].img),
                                            // ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                operators[index].text,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                DateTime.parse(
                                                        operators[index].time)
                                                    .formatTime()
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            "- ${operators[index].amount}\$",
                                            style: GoogleFonts.poppins(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

const String dateFormatter = 'MMMM dd, y';
const String dateTime = 'jm';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  String formatTime() {
    final formatter = DateFormat(dateTime);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
