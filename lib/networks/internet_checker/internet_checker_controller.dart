import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samfost_app/helpers/all_routes.dart';
import 'package:samfost_app/helpers/navigation_service.dart';
import 'internet_checher_popup.dart';


class InternetController extends GetxController {
  final Connectivity connectivity = Connectivity();

  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> resultList) {
      if (resultList.isNotEmpty) {
        isConnected(true);
        internetStatus(resultList.first);
      } else {
        isConnected(false);
        internetStatus(ConnectivityResult.none);
      }
    });
  }

  void internetStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationService.navigateTo(Routes.offlineScreen);
      });
      print("not Connected");
    } else {
      print("Connected");
      NavigationService.popAndReplace(Routes.loadingScreen);
    }
  }

  void retryConnection() {
    connectivity.checkConnectivity().then((resultList) {
      if (resultList.isNotEmpty) {
        internetStatus(resultList.first);
      } else {
        internetStatus(ConnectivityResult.none);
      }
    });
  }
}
