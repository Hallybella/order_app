import 'package:ably_flutter/ably_flutter.dart';
import 'package:order_app/app/app.logger.dart';
import 'package:order_app/app/app.router.dart';
import 'package:order_app/core/controllers/state_controller.dart';
import 'package:order_app/core/models/order_model.dart';
import 'package:order_app/core/shared/shared.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  final log = getLogger("AuthViewModel");
  final controller = StateController.stateController;
  var myRandomClientId = '';

  List<Order> _messages = [];
  List<Order> get messages => _messages;

  init() async {
    // await createAblyRealtimeInstance();
    // await publishOrderUpdate();
  }

  createAblyRealtimeInstance() async {
    try {
      channel.subscribe().listen(
        (event) {
          log.v("New message arrived ${event.data}");
          updateOrderStatus(event);
          notifyListeners();
        },
      );
    } catch (error) {
      log.v('Error creating Ably Realtime Instance: $error');
      rethrow;
    }
  }

  void updateOrderStatus(Message event) {
    // Update order status variable with the new status
    var hoursIn12HrFormat = event.timestamp!.hour > 12
        ? (event.timestamp!.hour - 12)
        : (event.timestamp!.hour);
    var timeOfDay = event.timestamp!.hour < 12 ? ' AM' : ' PM';
    var msgTime =
        "$hoursIn12HrFormat:${event.timestamp!.minute}${event.timestamp!.second}$timeOfDay";
    final newOrderMsg = Order(
        orderId: "12345",
        orderDate: msgTime,
        orderItem: "Sample Item",
        orderQuantity: 1,
        orderPrice: 19.99,
        orderStatus: event.data.toString(),
        orderNotes: []);
    messages.insert(0, newOrderMsg);
    controller.messages.value = messages;
    log.v("Message length ${messages.length}");
    log.v("New Order Msg $newOrderMsg");
    notifyListeners();
  }

  publishOrderUpdate() {
    var currTime = DateTime.now();
    var hoursIn12HrFormat =
        currTime.hour > 12 ? (currTime.hour - 12) : (currTime.hour);
    var timeOfDay = currTime.hour < 12 ? ' AM' : ' PM';
    var timeStamp = "$hoursIn12HrFormat:${currTime.minute}$timeOfDay";
    channel.publish(
        message: Message(data: {
      "orderId": "12345",
      "orderDate": timeStamp,
      "orderItem": "Sample Item",
      "orderNotes": "",
      "orderQuantity": 1,
      "orderPrice": 19.99,
      "orderStatus": "Order placed"
    }));
  }

  gotoOrder() {
    navigationService.navigateToOrderView();
  }
}
