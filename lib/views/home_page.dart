import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mevolve_hashtag/base/constants/colors.dart';
import 'package:mevolve_hashtag/extensions/util_extensions.dart';
import 'package:mevolve_hashtag/views/common_screen.dart';
import 'package:mevolve_hashtag/views/content.dart';
import 'package:mevolve_hashtag/views/today_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var today = "";
  late PersistentTabController _controller;
  bool _hideNavBar = false;
  final isDialOpen = ValueNotifier(false);

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: Image.asset(
            "assets/images/insights@1x.png",
            color: AppColors.primary,
          ),
          inactiveIcon: Image.asset(
            "assets/images/insights@1x.png",
            color: AppColors.gray,
          ),
          activeColorSecondary: AppColors.primary,
          inactiveColorSecondary: AppColors.gray,
          title: "Insights",
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            "assets/images/past@1x.png",
            color: AppColors.primary,
          ),
          inactiveIcon: Image.asset(
            "assets/images/past@1x.png",
            color: AppColors.gray,
          ),
          activeColorSecondary: AppColors.primary,
          inactiveColorSecondary: AppColors.gray,
          title: "Past",
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            initialRoute: "/",
            // routes: {

            // },, color: AppColors.primary,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            "assets/images/today@1x.png",
            color: AppColors.primary,
          ),
          inactiveIcon: Image.asset(
            "assets/images/today@1x.png",
            color: AppColors.gray,
          ),
          activeColorSecondary: AppColors.primary,
          inactiveColorSecondary: AppColors.gray,
          title: "Today",
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              // "/first": (final context) => const MainScreen2(),
              // "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            "assets/images/future@1x.png",
            color: AppColors.primary,
          ),
          inactiveIcon: Image.asset(
            "assets/images/future@1x.png",
            color: AppColors.gray,
          ),
          activeColorSecondary: AppColors.primary,
          inactiveColorSecondary: AppColors.gray,
          title: "Future",
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {},
          ),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            "assets/images/ideas@1x.png",
            color: AppColors.primary,
          ),
          inactiveIcon: Image.asset(
            "assets/images/ideas@1x.png",
            color: AppColors.gray,
          ),
          activeColorSecondary: AppColors.primary,
          inactiveColorSecondary: AppColors.gray,
          activeColorPrimary: AppColors.primary,
          inactiveColorPrimary: AppColors.gray,
          title: "Ideas",
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {},
          ),
        ),
      ];

  List<Widget> _buildScreens() => [
        const CommonScreen(number: 1),
        const CommonScreen(number: 2),
        const TodayScreen(),
        const CommonScreen(number: 4),
        const CommonScreen(number: 5),
      ];

  @override
  void initState() {
    super.initState();
    today = DateFormat("d MMM yyyy, EEE").format(DateTime.now());
    _controller = PersistentTabController(initialIndex: 2);
    _hideNavBar = false;
  }

  PreferredSize appbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary,
            )
          ],
        ),
        child: AppBar(
          elevation: 0,
          title: Text(
            today,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: AppColors.primary,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: const Text(
                  "My List",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          ],
          // bottom: const PreferredSize(
          //   preferredSize: Size.fromHeight(5.0),
          //   child: Divider(
          //     color: AppColors.primary,
          //     thickness: 2,
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget fab() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: SpeedDial(
        backgroundColor: AppColors.primary,
        onOpen: () {
          setState(() {
            isDialOpen.value = true;
          });
        },
        onClose: () {
          setState(() {
            isDialOpen.value = false;
          });
        },
        overlayColor: AppColors.gray,
        overlayOpacity: 0.5,
        openCloseDial: isDialOpen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        children: [
          SpeedDialChild(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            labelWidget: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                elevation: 3,
              ),
              onPressed: () {
                setState(() {
                  isDialOpen.value = false;
                });
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: const Content(),
                  ),
                );
              },
              child: const Text(
                "Add Hashtag",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SpeedDialChild(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            labelWidget: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                elevation: 3,
              ),
              onPressed: () {},
              child: const Text(
                "Add Todo",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SpeedDialChild(
            backgroundColor: AppColors.white,
            labelWidget: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  elevation: 3),
              onPressed: () {},
              child: const Text(
                "Setup Habit",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SpeedDialChild(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.primary,
            labelWidget: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  elevation: 3),
              onPressed: () {},
              child: const Text(
                "Setup Journal",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
        child:
            isDialOpen.value ? const Icon(Icons.close) : const Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.hideKeyboard();
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          isDialOpen.value = true;
          return true;
        }
      },
      child: Scaffold(
        appBar: appbar(),
        drawer: const Drawer(),
        floatingActionButton: fab(),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: false,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,

          backgroundColor: Colors.white,
          hideNavigationBar: _hideNavBar,
          decoration:
              const NavBarDecoration(colorBehindNavBar: AppColors.primary),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style3, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
