import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:qibla_finder/presentation/config/args/general_args.dart';
import 'package:qibla_finder/presentation/config/main_theme.dart';
import 'package:qibla_finder/presentation/config/route_config.dart';
import 'package:qibla_finder/presentation/core/app.dart';
import 'package:sailor/sailor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  double _fraction = 0.35;
  double _pageOffset = 0;
  List<String> _names = ["Fajr", "Dzuhr", "Ashr", "Maghrib", "Isya"];
  List<String> _times = ["04:15", "11:31", "14:51", "17:23", "18:34"];

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: 0, viewportFraction: _fraction)
          ..addListener(() {
            setState(() {
              _pageOffset = _pageController.page;
              // print(pageOffset);
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme().primaryColor,
      body: Parent(
        style: ParentStyle()
          ..linearGradient(
            colors: [
              mainTheme().primaryColor.withAlpha(100),
              mainTheme().accentColor.withAlpha(120)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dau",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text("Malang, Indonesia"),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat('dd MMM yyyy').format(DateTime.now()),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            HijriCalendar.now().toFormat("dd MMMM yyyy"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              // Icon(
              //   _currentPage == 2 ? Icons.notifications_off_outlined : Icons.notifications_none,
              //   color: Colors.white,
              // ),
              Container(
                height: 155,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (page) {
                    _currentPage = page;
                  },
                  itemBuilder: (context, position) {
                    double scale = max(
                        1.2, 1 - (_pageOffset - position).abs() + _fraction);
                    double opacity = max(
                        0.4, 0.6 - (_pageOffset - position).abs() + _fraction);

                    return PrayerTime(
                      scale: scale,
                      activated: true,
                      title: _names[position],
                      time: _times[position],
                      opacity: opacity,
                      alignment: Alignment.bottomCenter,
                      pageController: _pageController,
                      offset: position,
                    );
                  },
                  controller: _pageController,
                  itemCount: _names.length,
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, -30, 0),
                child: TextButton(
                  onPressed: () => App.main.router.navigate(
                    RouteName.generalSettings,
                    transitionCurve: Curves.easeInOutQuart,
                    transitionDuration: Duration(milliseconds: 800),
                    transitions: [SailorTransition.fade_in],
                    args: SettingsArgs(_names, _times),
                  ),
                  child: Icon(Icons.settings_outlined),
                  style: TextButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                    primary: Colors.white,
                    backgroundColor: Colors.white24,
                    elevation: 0,
                  ),
                )
              ),
              // RotatedBox(
              //   quarterTurns: 1,
              //   child: Container(
              //     height: 250,
              //     width: MediaQuery.of(context).size.width,
              //     child: ListWheelScrollView(
              //       itemExtent: 70,
              //       offAxisFraction: _fraction,
              //       physics: BouncingScrollPhysics(),
              //       children: List.generate(5, (_) {
              //         return PrayerTime(
              //           scale: 1,
              //           activated: true,
              //           title: "Ashr",
              //           time: "11:31",
              //           opacity: 1,
              //           alignment: Alignment.bottomCenter,
              //         );
              //       }),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayerTime extends StatefulWidget {
  const PrayerTime({
    Key key,
    @required this.scale,
    @required this.title,
    @required this.time,
    @required this.activated,
    @required this.opacity,
    @required this.alignment,
    @required this.pageController,
    @required this.offset,
  }) : super(key: key);

  final double scale;
  final String title;
  final String time;
  final bool activated;
  final double opacity;
  final Alignment alignment;
  final PageController pageController;
  final int offset;

  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 0,
      child: Parent(
        style: ParentStyle()
          ..opacity(widget.opacity)
          ..scale(widget.scale)
          ..padding(top: 55 - (widget.opacity * 35)),
        child: Column(
          children: [
            Icon(
              widget.activated
                  ? Icons.notifications_none
                  : Icons.notifications_off_outlined,
              color: Colors.white,
              size: 18,
            ),
            FlatButton(
              onPressed: () {
                if (widget.offset != widget.pageController.page) {
                  if (widget.offset < widget.pageController.page) {
                    widget.pageController.previousPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeInOutQuad);
                  } else {
                    widget.pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeInOutQuad);
                  }
                }
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Column(
                children: [
                  Text(
                    widget.time,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 3,
            ),
          ],
        ),
      ),
    );
  }
}
