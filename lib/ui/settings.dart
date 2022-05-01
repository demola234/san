import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:santander/core/models/settings.dart';

import 'home_screen.dart';

class Settings extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(children: [
                  Row(
                    children: [
                      Headings(
                        title: "Settings",
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ])),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: settings.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 20),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              settings[index].img,
                              color: Colors.red,
                            ),
                            SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  settings[index].text,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
