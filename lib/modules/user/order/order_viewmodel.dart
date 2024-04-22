import 'package:ably_flutter/ably_flutter.dart';
import 'package:order_app/app/app.logger.dart';
import 'package:order_app/core/controllers/state_controller.dart';
import 'package:order_app/core/models/order_model.dart';
import 'package:order_app/core/shared/shared.dart';
import 'package:stacked/stacked.dart';

class OrderViewModel extends BaseViewModel {
  final log = getLogger("AuthViewModel");
  final controller = StateController.stateController;
  var myRandomClientId = '';

  List<Order> _messages = [];
  List<Order> get messages => _messages;

  init() async {
    if (realtimeInstance.channels.isNotEmpty) {
      log.v('Ably Realtime Instance already created');
      return;
    }
    await createAblyRealtimeInstance();

    await publishOrderUpdate();
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
    var msgTime = "$hoursIn12HrFormat:${event.timestamp!.minute}$timeOfDay";
    Order newOrderMsg = Order(
        orderId: "12345",
        orderDate: msgTime,
        orderItem: "Sample Item",
        orderQuantity: 1,
        orderPrice: 19.99,
        orderStatus: event.data.toString(),
        orderNotes: [
          "Waiting for vendor to accept",
          "Your order is being prepared",
          "A rider is on the way to pick up your order",
          "Your order is coming your way",
          "Order has arrived",
          "Enjoy!"
        ]);
    _messages.insert(0, newOrderMsg);
    controller.messages.add(newOrderMsg);
    notifyListeners();
    log.v("Message length ${_messages.length}");
    log.v("New Order Msg $newOrderMsg");
    notifyListeners();
  }

  publishOrderUpdate() {
    channel.publish(message: Message(data: "Order Placed"));
  }
}
