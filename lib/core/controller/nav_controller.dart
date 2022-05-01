import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santander/ui/expense_screen.dart';
import 'package:santander/ui/home_screen.dart';
import 'package:santander/ui/operator_screen.dart';
import 'package:santander/ui/settings.dart';
import 'package:santander/utils/color.dart';
import 'package:santander/utils/image_path.dart';

class NavController extends StatefulWidget {
  const NavController({Key? key}) : super(key: key);

  @override
  _NavControllerState createState() => _NavControllerState();
}

class _NavControllerState extends State<NavController> {
  late PageController pageController;
  int _page = 0;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: [
            HomeScreen(),
            OperatorScreen(),
            ExpenseScreen(),
            Settings(),
          ],
          onPageChanged: onPageChanged,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImagePath.home,
                  height: 20,
                  width: 20,
                  allowDrawingOutsideViewBox: true,
                  color: ColorPath.GRAY),
              label: "",
              activeIcon: SvgPicture.asset(ImagePath.home,
                  height: 20,
                  width: 20,
                  allowDrawingOutsideViewBox: true,
                  color: ColorPath.RED),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagePath.card,
                height: 20,
                width: 20,
                allowDrawingOutsideViewBox: true,
                color: ColorPath.GRAY,
              ),
              label: "",
              activeIcon: SvgPicture.asset(ImagePath.card,
                  height: 20,
                  width: 20,
                  allowDrawingOutsideViewBox: true,
                  color: ColorPath.RED),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagePath.chart,
                height: 20,
                width: 20,
                allowDrawingOutsideViewBox: true,
                color: ColorPath.GRAY,
              ),
              label: "",
              activeIcon: SvgPicture.asset(ImagePath.chart,
                  height: 20,
                  width: 20,
                  allowDrawingOutsideViewBox: true,
                  color: ColorPath.RED),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImagePath.setting,
                height: 20,
                width: 20,
                allowDrawingOutsideViewBox: true,
                color: ColorPath.GRAY,
              ),
              label: "",
              activeIcon: SvgPicture.asset(ImagePath.setting,
                  height: 20,
                  width: 20,
                  allowDrawingOutsideViewBox: true,
                  color: ColorPath.RED),
            ),
          ],
          selectedItemColor: ColorPath.RED,
          unselectedItemColor: ColorPath.GRAY,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: navigationTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: _page,
          iconSize: 20,
        ));
  }
}
