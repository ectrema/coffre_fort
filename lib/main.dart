import 'package:coffre_fort/home/home_view.dart';
import 'package:coffre_fort/home/home_view_controller_bindings.dart';
import 'package:coffre_fort/home/second_view/second_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Coffre fort",
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomeView(),
          binding: HomeViewControllerBingins(),
        ),
        GetPage(
          name: '/second',
          page: () => SecondView(),
        ),
      ],
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
    ),
  );
}
