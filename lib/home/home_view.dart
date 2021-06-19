import 'package:coffre_fort/home/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.lock,
              size: 50,
            ),
          ),
          Obx(
            () => !controller.isFirstTime.value
                ? Text('Entrer le code pour accéder au message secret')
                : Text('Rentrer un nouveau code'),
          ),
          SizedBox(
            height: 50,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.codeFromUser.value.length,
                  (index) => Text(
                    '*',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 560,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: [
                        buildRow('7', '8', '9'),
                        buildRow('4', '5', '6'),
                        buildRow('1', '2', '3'),
                        buildRow('*', '0', '#'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (controller.isFirstTime.value &&
                              controller.codeFromUser.value.length == 4)
                            await controller
                                .saveCode(controller.codeFromUser.value);
                          else if (controller.codeFromUser.value ==
                              controller.realCode) Get.toNamed('/second');
                        },
                        child: Text('Valider'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            if (controller.codeFromUser.value.length > 0)
                              controller.codeFromUser.value =
                                  controller.codeFromUser.value.substring(0,
                                      controller.codeFromUser.value.length - 1);
                          },
                          child: Icon(Icons.backspace_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String text, String text1, String text2) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              if (controller.codeFromUser.value.length < 4)
                controller.codeFromUser.value += text;
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(text),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (controller.codeFromUser.value.length < 4)
                controller.codeFromUser.value += text1;
            },
            child: Container(
              height: 90,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(text1),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (controller.codeFromUser.value.length < 4)
                controller.codeFromUser.value += text2;
            },
            child: Container(
              height: 90,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: Text(text2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
