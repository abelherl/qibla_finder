import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:qibla_finder/presentation/config/args/general_args.dart';
import 'package:qibla_finder/presentation/config/main_theme.dart';
import 'package:qibla_finder/presentation/core/app.dart';
import 'package:sailor/sailor.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> _names;
  List<String> _times;
  bool _24hour = true;

  @override
  Widget build(BuildContext context) {
    final args = Sailor.args<SettingsArgs>(context);

    _names = args.names;
    _times = args.times;

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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.fromLTRB(0, 12, 15, 12),
                          onPressed: () => App.main.router.pop(),
                        ),
                        Text(
                          "Settings",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "24-Hour Clock",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        FlutterSwitch(
                          width: 50,
                          height: 30,
                          value: _24hour,
                          borderRadius: 30,
                          padding: 4,
                          activeColor: Colors.white24,
                          inactiveColor: Colors.black26,
                          duration: Duration(milliseconds: 200),
                          onToggle: (val) {
                            setState(() {
                              _24hour = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Current Location",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Dau, Malang, Indonesia",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Praying Time Convention",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "MWL - Muslim World League",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Reminder",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, position) {
                      return Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                _names[position],
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Spacer(),
                              Text(
                                _times[position],
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(width: 15),
                              Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
