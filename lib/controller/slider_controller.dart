import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  CarouselController controller = CarouselController();

  RxInt index = 0.obs;
  void onpageScroll(val) {
    index.value = val;
  }
}
