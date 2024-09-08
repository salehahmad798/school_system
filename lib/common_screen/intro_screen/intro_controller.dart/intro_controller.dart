import 'package:get/get.dart';

class IntroController extends GetxController {
  RxBool introBool = false.obs;
  RxInt innerWidgetVal = 0.obs;

  updateInnerWidgetVal(int val) {
    innerWidgetVal.value = val;
    update();
  }
}
