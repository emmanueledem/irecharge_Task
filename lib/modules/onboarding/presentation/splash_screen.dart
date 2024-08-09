import 'package:flutter/material.dart';
import 'package:mobile_assessment/common/colors.dart';
import 'package:mobile_assessment/common/navigators/navigators.dart';
import 'package:mobile_assessment/common/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _pageSetup() async {
    final navigator = Navigator.of(context);

    Future.delayed(
        const Duration(seconds: 2),
        () => navigator.pushReplacementNamed(
              RouteName.welcomeScreen,
            ));
  }

  @override
  void initState() {
    _pageSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 1, // Space between underline and text
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3.0,
                  color: AppColors.primaryColor,
                  // Underline thickness
                ),
              ),
            ),
            child: TextBold(
              'XYZ inc.',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
