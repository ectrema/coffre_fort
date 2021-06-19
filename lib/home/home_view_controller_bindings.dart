import 'package:coffre_fort/home/home_view_controller.dart';
import 'package:get/get.dart';

class HomeViewControllerBingins extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeViewController(),
    );
  }
}
