
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samfost_app/splash_screen.dart';
import 'bottom_nav_screen.dart';
import 'constants/app_constants.dart';
import 'features/onbording/presentation/onbording_screen.dart';
import 'features/profile_settings/update_password/presentation/update_password_screen.dart';
import 'helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/navigation_service.dart';
import 'networks/dio/dio.dart';
import 'networks/internet_checker/internet_checker_controller.dart';



final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final internetController = Get.find<InternetController>();

  bool _isLoading = true;
  bool isFirstTime = false;

  @override
  void initState() {
    super.initState();
    if (internetController.isConnected.value) {
      loadInitialData();
    }
    ever(internetController.isConnected, (value) {
      if (value) {
        loadInitialData();
      }
    });
  }

  loadInitialData() async {
    await Future.delayed(const Duration(seconds: 2));
    await setInitValue();

    bool isLoggedIn = appData.read(kKeyIsLoggedIn) ?? false;
    bool firstTime = appData.read(kKeyIsFirstTime)?? false;
     if (isLoggedIn) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      Navigator.pushReplacement( context ,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    }
     else if (firstTime) {
    Navigator.pushReplacement( context ,
    MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
    }else {
      // Navigate to LoginScreen if not logged in
      NavigationService.navigateToReplacement(Routes.updatePasswordScreen);
    }

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      return appData.read(kKeyIsFirstTime)
          ? OnboardingScreen ()
          : const UpdatePasswordScreen();
    }
  }
}