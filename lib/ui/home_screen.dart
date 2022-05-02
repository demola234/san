// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:santander/core/models/cards.dart';
import 'package:santander/core/models/contacts.dart';
import 'package:santander/ui/transfer_screen.dart';
import 'package:santander/utils/image_path.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../core/models/payment_history.dart';

class HomeScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Headings(
                          title: "Cards",
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            const CircleAvatar(
                              foregroundImage: AssetImage(ImagePath.avatars2),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 15,
                                width: 15,
                                child: Center(
                                    child: Text(
                                  "4",
                                  style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                // Toasts.showErrorToast(
                                //     "Unable to commplete transaction");
                              },
                              child: Container(
                                height: 80,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 90,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cardDetails.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: cardDetails[index].color,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 60,
                                          child: Image(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                  cardDetails[index].card)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  cardDetails[index].cardtype,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: cardDetails[index]
                                                                .color ==
                                                            Colors.red
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 14,
                                                ),
                                                Text(
                                                  "\$${cardDetails[index].ammount}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    color: cardDetails[index]
                                                                .color ==
                                                            Colors.red
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "**** ${cardDetails[index].lastno}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    color: cardDetails[index]
                                                                .color ==
                                                            Colors.red
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                )
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Headings(
                          name: "Send",
                          title: "Money",
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "All Contacts",
                            style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TransferScreen()));
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width - 90,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sendmoney.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFF6F6F6),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    sendmoney[index].img))),
                                        // child: Image(
                                        //   fit: BoxFit.cover,
                                        //   image: AssetImage(sendmoney[index].img),
                                        // ),
                                      ),
                                      Text(
                                        sendmoney[index].text,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Headings(
                          name: "My",
                          title: "Expenses",
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Full history",
                            style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: expenses.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 206, 205, 205),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: AssetImage(
                                                    expenses[index].img))),
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
                                            expenses[index].text,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            timeago.format(DateTime.parse(
                                                expenses[index].date)),
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        " -${expenses[index].ammount} \$",
                                        style: GoogleFonts.poppins(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Headings extends StatelessWidget {
  final String? name;
  final String title;
  // ignore: prefer_const_constructors_in_immutables
  Headings({
    this.name,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name ?? "My",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
