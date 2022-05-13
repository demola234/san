// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:santander/core/controller/nav_controller.dart';
import 'package:santander/utils/color.dart';

import '../utils/image_path.dart';
import '../utils/toasts.dart';

class Authentication extends StatefulWidget {
  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = false;

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 80,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(ImagePath.logo),
              )),
            ),
          ),
          Positioned.fill(
            top: 150,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(children: [
                      ProbitasTextFormField(
                        hintText: "UserName",
                        controller: username,
                        inputType: TextInputType.text,
                      ),
                      SizedBox(height: 20),
                      ProbitasTextFormField(
                        hintText: "Password",
                        controller: password,
                        inputType: TextInputType.visiblePassword,
                        obscureText: !visible,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            child: Icon(
                              !visible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            )),
                      ),
                    ]),
                  ),
                  SizedBox(height: 40),
                  SizedBox(height: 150),
                  ProbitasButton(
                      text: "Login",
                      showLoading: isLoading,
                      onTap: () async {
                        if (username.text.isNotEmpty &&
                            password.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavController()));
                        } else {
                          Toasts.showErrorToast(
                              "Username or Password can not be empty!");
                        }
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProbitasTextFormField extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final String? Function(String? input)? validator;
  final Function(String input)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool enableInteractiveSelection;
  final TextAlign textAlign;
  final String? hintText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool enabled;
  final bool? readOnly;
  final void Function()? onTap;

  const ProbitasTextFormField(
      {Key? key,
      this.labelText,
      this.initialValue,
      this.suffixIcon,
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
      this.readOnly = false,
      this.onTap,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText!,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLines: maxLines,
      readOnly: readOnly!,
      focusNode: focusNode,
      initialValue: initialValue,
      keyboardType: inputType,
      textAlign: textAlign,
      enabled: enabled,
      decoration: InputDecoration(
        fillColor: ColorPath.GRAY,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
      ),
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
    );
  }
}

class ProbitasButton extends StatelessWidget {
  const ProbitasButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.showLoading,
  }) : super(key: key);

  final void Function() onTap;
  final String text;
  final bool? showLoading;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60.0),
        child: Container(
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: showLoading != null && showLoading!
                  ? Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                          // size: 30,
                        ),
                      ))
                  : Align(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: GoogleFonts.poppins(color: Colors.white),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
