import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_app/core/controllers/state_controller.dart';
import 'package:order_app/core/state/loader_view.dart';
import 'package:order_app/modules/user/order/order_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:timelines/timelines.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = StateController.stateController;
    return ViewModelBuilder<OrderViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => OrderViewModel(),
      builder: (context, model, child) => LoaderView(
        loading: model.isBusy,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Delivery Tracking'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => Timeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    connectorTheme: const ConnectorThemeData(
                      thickness: 2.0,
                    ),
                  ),
                  builder: TimelineTileBuilder.connected(
                    itemCount: controller.messages.length < 6
                        ? controller.messages.length
                        : 6, // Number of delivery status
                    contentsBuilder: (_, index) {
                      // Return widgets for each delivery status
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(controller.messages[index].orderStatus),
                          subtitle: Text(
                              controller.messages[index].orderNotes[index]),
                          trailing: Text(controller.messages[index].orderDate),
                        ),
                      );
                    },
                    connectorBuilder: (_, index, __) {
                      // Return connector line between status nodes
                      if (index > 0) {
                        return const SolidLineConnector(color: Colors.grey);
                      }
                      return null;
                    },
                    indicatorBuilder: (_, index) {
                      // Return the circle indicators for each status
                      return const OutlinedDotIndicator(
                        color: Colors.green,
                        backgroundColor: Colors.green,
                      );
                    },
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
