import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wallet/provider/appData.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late TextStyle headerTextStyleBlack;
  late TextStyle headerTextStyleWhite;
  late TextStyle normalTextStyle;
  late TextStyle normalHighLightTextStyle;
  late AppData appData;

  void getData(BuildContext context) {
    appData = Provider.of<AppData>(context, listen: false);
    headerTextStyleBlack = appData.headerTextStyleBlack;
    headerTextStyleWhite = appData.headerTextStyleWhite;
    normalTextStyle = appData.normalTextStyle;
    normalHighLightTextStyle = appData.normalHighLightTextStyle;
  }

  void triggerSplashScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 3200));
    Navigator.pushReplacementNamed(
      context,
      HomePage.routeName,
    );
  }

  @override
  void initState() {
    getData(context);
    triggerSplashScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 2,
              // color: Colors.green,
              child: Lottie.asset(
                'asset/lottieAnimations/lottieSplashScreen.json',
                fit: BoxFit.fill
              ),
            ),
            Text(
              'MY WALLET',
              style: headerTextStyleWhite,
            )
          ],
        ),
      ),
    );
  }
}
