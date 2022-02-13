import 'package:avatar_glow/avatar_glow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:my_wallet/model/transaction.dart';
import 'package:my_wallet/model/userData.dart';
import 'package:my_wallet/page/addTransaction.dart';
import 'package:my_wallet/page/dashboard.dart';
import 'package:my_wallet/provider/appData.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;
  late CarouselController carouselSliderController;
  late TabController tabController;

  void getData(BuildContext context) {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
    carouselSliderController = CarouselController();
    tabController = TabController(length: 4, vsync: this);
    userData = Provider.of<UserData>(context, listen: false);
    userData.updateData("Khondakar Afridi", '52000', '12000', '15000', []);
    userData.addTransaction(Transaction.name(false, '1200', 'Haircut', ''));
    userData.addTransaction(Transaction.name(false, '460', 'Birdfood', ''));
  }

  late UserData userData;
  @override
  void initState() {
    getData(context);
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey,
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 6,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            scaffoldStateKey.currentState!.openDrawer();
          },
          icon: Icon(
            FontAwesomeIcons.bars,
            color: appData.customWhite,
            size: 20,
          ),
        ),
        title: Text(
          'MY WALLET',
          style: headerTextStyleWhite,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.search,
              color: appData.customWhite,
              size: 20,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.pink,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: 200,
                        // color: Colors.blue,
                        child: CarouselSlider.builder(
                          itemCount: 3,
                          carouselController: carouselSliderController,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return getCard(itemIndex);
                          },
                          options: CarouselOptions(
                            // onPageChanged: updatePageIndicator(),
                            autoPlay: false,
                            viewportFraction: .80,
                            aspectRatio: 19 / 9,
                            initialPage: 1,
                            enlargeCenterPage: true,
                            reverse: false,
                            enableInfiniteScroll: false,
                            scrollPhysics: const BouncingScrollPhysics(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Transaction History',
                          style: headerTextStyleWhite,
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
                                style: normalTextStyle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Weekly',
                                style: normalTextStyle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Monthly',
                                  style: normalTextStyle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Yearly',
                                style: normalTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          itemCount: userData.userTransactions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int itemIndex) {
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Card(
                                elevation: 6,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                color: Theme.of(context).colorScheme.background,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.shoppingBag,
                                            color: appData.customWhite,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 5,
                                        child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  userData
                                                      .userTransactions[
                                                          itemIndex]
                                                      .title,
                                                  style: headerTextStyleWhite,
                                                ),
                                                Text(
                                                  '13th January',
                                                  style: normalTextStyle,
                                                )
                                              ],
                                            )),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: 1,
                                        color: appData.customWhite,
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${userData.userTransactions[itemIndex].isIncome ? '+' : '-'}${userData.userTransactions[itemIndex].amount}TK',
                                            style: normalTextStyle.copyWith(
                                                color: userData
                                                        .userTransactions[
                                                            itemIndex]
                                                        .isIncome
                                                    ? Colors.green
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              // color: Colors.yellow,
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            FontAwesomeIcons.wallet,
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
                  SizedBox(
                    width: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AddTransaction.routeName);
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
                  Container(
                    width: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Dashboard.routeName);
                      },
                      child: Icon(
                        FontAwesomeIcons.chartBar,
                        color: appData.customWhite,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCard(int itemIndex) {
    late String title;
    late String subtitle;
    late String amount;
    if (itemIndex == 0) {
      title = 'Personal Expenses';
      subtitle = 'Total Spendings:';
      amount = userData.userExpenses;
    }
    if (itemIndex == 1) {
      title = 'Personal Wallet';
      subtitle = 'Current Balance:';
      amount = userData.userWallet;
    }
    if (itemIndex == 2) {
      title = 'Personal Saving';
      subtitle = 'Total Saving:';
      amount = userData.userSaving;
    }
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 3,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
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
                    'asset/cardBackground/color (${itemIndex + 1}).jpg',
                    fit: BoxFit.fill,
                  )),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 0,
              child: Text(
                title,
                style: headerTextStyleWhite.copyWith(fontSize: 25),
              ),
            ),
            Positioned(
              bottom: 35,
              left: 20,
              right: 0,
              child: Text(
                subtitle,
                style: headerTextStyleWhite.copyWith(fontSize: 20),
              ),
            ),
            Positioned(
              bottom: 14,
              left: 20,
              right: 0,
              child: Text(
                '${amount}TK',
                style: headerTextStyleWhite.copyWith(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
