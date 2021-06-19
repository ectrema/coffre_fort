import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeViewController extends GetxController {
  RxBool isFirstTime = true.obs;
  RxString codeFromUser = ''.obs;
  String realCode = '';
  @override
  Future<void> onReady() async {
    await GetStorage.init('firstTime');
    GetStorage box = GetStorage('firstTime');
    isFirstTime.value = box.read('firstTime') ?? true;
    if (!isFirstTime.value) realCode = box.read('code');
    super.onReady();
  }

  Future<void> saveCode(String code) async {
    GetStorage box = GetStorage('firstTime');
    isFirstTime.value = false;
    await box.write('firstTime', false);
    await box.write('code', code);
    realCode = box.read('code');
    codeFromUser.value = '';
  }

  Future<void> resetCode() async {
    GetStorage box = GetStorage('firstTime');
    isFirstTime.value = true;
    await box.write('firstTime', true);
    codeFromUser.value = '';
    realCode = '';
  }
}
