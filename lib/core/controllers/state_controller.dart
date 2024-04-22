import 'package:get/get.dart';
import 'package:order_app/core/models/order_model.dart';

class StateController extends GetxController {
  var messages = <Order>[].obs;

  static StateController get stateController => Get.find<StateController>();
}
