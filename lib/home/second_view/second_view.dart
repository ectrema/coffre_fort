import 'package:coffre_fort/home/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondView extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ceci est mon message secret, personne ne doit pouvoir lire ce message'),
          Center(
            child: Container(
              height: 50,
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  await controller.resetCode();
                  Get.back();
                },
                child: Text('Reset le mot de passe'),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                controller.codeFromUser.value = '' ;
                Get.back();
              },
              child: Container(
                height: 50,
                alignment: Alignment.bottomCenter,
                child: Text('Verrouiller'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
