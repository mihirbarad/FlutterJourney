import 'package:get/get.dart';

class MainLogic extends GetxController {
  var count = 1.obs;

  void updateCount() {
    count += 1;
  }
}
