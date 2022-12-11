import 'package:flutter/material.dart';
import 'package:initial_test/utils/constants.dart';
import 'package:initial_test/widgets/customWidgets.dart';

import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 2000),
    //     () => {LoginScreen.navigateToLogin(context)});
    Future.delayed(const Duration(milliseconds: 2000),
        () => {DashboardScreen.navigateToDashboard(context)});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const LogoImage(),
                    const HeaderTextField(
                      text: StringConstants.appName,
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
