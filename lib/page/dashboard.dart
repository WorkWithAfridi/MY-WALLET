import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_wallet/page/temp.dart';
import 'package:my_wallet/provider/appData.dart';
import 'package:provider/provider.dart';

import 'addTransaction.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  late TabController tabController;

  void getData(BuildContext context) {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void initState() {
    getData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 6,
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     FontAwesomeIcons.bars,
        //     color: appData.customWhite,
        //     size: 20,
        //   ),
        // ),
        title: Text(
          'DASHBOARD',
          style: normalTextStyle.copyWith(
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.bell,
              color: appData.customWhite,
              size: 20,
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(right: 2),
                            height: double.infinity,
                            width: double.infinity,
                            // color: Colors.grey,
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 6,
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            'asset/cardBackground/color (1).jpg',
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 20,
                                      right: 0,
                                      child: Container(
                                        // height: 30,
                                        // color: Colors.red,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Income',
                                              style: headerTextStyleWhite,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 14,
                                      left: 20,
                                      right: 0,
                                      child: Text(
                                        '12000Tk',
                                        style: headerTextStyleWhite.copyWith(
                                            fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(right: 2),
                            height: double.infinity,
                            width: double.infinity,
                            // color: Colors.grey,
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 6,
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            'asset/cardBackground/color (2).jpg',
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 20,
                                      right: 0,
                                      child: Container(
                                        // height: 30,
                                        // color: Colors.red,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Expenses',
                                              style: headerTextStyleWhite,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 14,
                                      left: 20,
                                      right: 0,
                                      child: Text(
                                        '27000Tk',
                                        style: headerTextStyleWhite.copyWith(
                                            fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Stats',
                      style: normalTextStyle.copyWith(fontSize: 25, height: .5),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    // color: Theme.of(context).colorScheme.background,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TabBar(
                      isScrollable: true,
                      controller: tabController,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      tabs: [
                        Tab(
                          child: Text(
                            'Daily',
                            style: normalTextStyle.copyWith(fontSize: 20),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Weekly',
                            style: normalTextStyle.copyWith(fontSize: 20),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Monthly',
                            style: normalTextStyle.copyWith(fontSize: 20),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Yearly',
                            style: normalTextStyle.copyWith(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: LineChartSample2(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Report',
                      style: normalTextStyle.copyWith(fontSize: 25, height: .5),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(right: 2),
                            height: double.infinity,
                            width: double.infinity,
                            // color: Colors.grey,
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 6,
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          height: double.infinity,
                                          width: double.infinity,
                                          // color: Colors.red,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                // color: Colors.red,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '71%',
                                                  style: headerTextStyleWhite
                                                      .copyWith(
                                                          fontSize: 30,
                                                          height: .8),
                                                ),
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '+ 17000Tk',
                                                    style: normalTextStyle
                                                        .copyWith(
                                                            fontSize: 25,
                                                            color: Colors.green,
                                                            height: .8),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: .8,
                                          width: double.infinity,
                                          color: Colors.white.withOpacity(.5),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          height: double.infinity,
                                          width: double.infinity,
                                          // color: Colors.green,
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "This week you saved 50% from the budget.",
                                            style: normalTextStyle.copyWith(
                                              fontSize: 25,
                                              height: .7,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(right: 2),
                            height: double.infinity,
                            width: double.infinity,
                            // color: Colors.grey,
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 6,
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          height: double.infinity,
                                          width: double.infinity,
                                          // color: Colors.red,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                // color: Colors.red,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '50%',
                                                  style: headerTextStyleWhite
                                                      .copyWith(
                                                          fontSize: 30,
                                                          height: .8),
                                                ),
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '- 33000Tk',
                                                    style: normalTextStyle
                                                        .copyWith(
                                                            fontSize: 25,
                                                            color: Colors.red,
                                                            height: .8),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: .8,
                                          width: double.infinity,
                                          color: Colors.white.withOpacity(.5),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          height: double.infinity,
                                          width: double.infinity,
                                          // color: Colors.green,
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "This week you spent significantly more than the previous.",
                                            style: normalTextStyle.copyWith(
                                              fontSize: 25,
                                              height: .7,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                color: Theme.of(context).colorScheme.onBackground,
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          FontAwesomeIcons.wallet,
                          color: appData.customWhite,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(AddTransaction.routeName);
                        },
                        child: AvatarGlow(
                          endRadius: 50,
                          glowColor: Colors.red,
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: double.infinity,
                      width: 40,
                      // color: Colors.red,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              FontAwesomeIcons.chartBar,
                              color: appData.customWhite,
                              size: 30,
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 10,
                            right: 10,
                            child: Container(
                              height: 2,
                              width: double.infinity,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
