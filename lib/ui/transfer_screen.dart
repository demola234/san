import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:santander/utils/toasts.dart';

import '../utils/image_path.dart';
import 'home_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  var amountController = TextEditingController();
  var commentController = TextEditingController();
  var vaule;

  @override
  void dispose() {
    amountController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Headings(
              name: "New",
              title: "Transfer",
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From".toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(ImagePath.visacard1))),
                      // child: Image(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage(sendmoney[index].img),
                      // ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Credit Card",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "**** **** **** 2122",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Change",
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To".toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Container(
                    //   height: 50,
                    //   width: 50,
                    //   decoration: const BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.0),
                    //       ),
                    //       image: DecorationImage(
                    //           fit: BoxFit.contain,
                    //           image: AssetImage(ImagePath.lccc))),
                    //   // child: Image(
                    //   //   fit: BoxFit.cover,
                    //   //   image: AssetImage(sendmoney[index].img),
                    //   // ),
                    // ),
                    // const SizedBox(width: 10),
                    Flexible(
                      child: ProbitasDropDown(
                        hintText: "Choose Recipient",
                        items: [
                          "Angela James",
                          "Special love child care LLC",
                          "Cable",
                          "Food",
                          "James Douglas"
                        ],
                        value: vaule,
                        onChanged: (value) {
                          setState(() {
                            vaule = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transfer Amount".toUpperCase(),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      controller: amountController,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Amount",
                      ),
                    ),
                  ),
                ]),
            const SizedBox(height: 40),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your comment".toUpperCase(),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 90,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      controller: commentController,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write Comment....",
                      ),
                    ),
                  ),
                ]),
            const SizedBox(height: 50),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (amountController.text.isNotEmpty &&
                      commentController.text.isNotEmpty) {
                    Toasts.showErrorToast("Unable to Complete Transaction");
                  } else if (amountController.text.isEmpty &&
                      commentController.text.isEmpty) {
                    Toasts.showErrorToast(
                        "Amount and Comment can not be empty");
                  }
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      "SEND MONEY",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProbitasDropDown extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final Widget? textFieldIcon;
  final bool enableInteractiveSelection;
  final TextAlign textAlign;
  final String? hintText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextInputType? inputType;
  final String? Function(String? input)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool enabled;
  final List<String> items;
  final String? value;

  const ProbitasDropDown(
      {Key? key,
      this.labelText,
      this.initialValue,
      this.textFieldIcon,
      this.inputType,
      this.onChanged,
      this.onEditingComplete,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.maxLines = 1,
      this.focusNode,
      this.textAlign = TextAlign.start,
      this.obscureText = false,
      this.enableInteractiveSelection = true,
      this.hintText,
      this.prefixIcon,
      this.controller,
      required this.items,
      required this.value,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return DropdownButtonFormField<String>(
        isExpanded: true,
        elevation: 0,
        validator: validator,
        onSaved: onSaved,
        style: GoogleFonts.poppins(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white.withOpacity(0.2),
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: textFieldIcon,
            suffix: Text(
              "Change",
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            hintText: hintText,
            labelText: labelText,
            labelStyle: GoogleFonts.poppins(color: Colors.black),
            hintStyle: GoogleFonts.poppins(color: Colors.black)),
        iconDisabledColor: Colors.white,
        items: items
            .map((e) => DropdownMenuItem<String>(value: e, child: Text("$e")))
            .toList(),
        onChanged: onChanged,
        value: value);
  }
}
