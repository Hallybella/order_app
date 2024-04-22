import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsCard extends StatelessWidget {
  final String orderId;
  final DateTime orderDate;
  final String item;
  final int quantity;
  final double price;

  const OrderDetailsCard({
    Key? key,
    required this.orderId,
    required this.orderDate,
    required this.item,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order ID: $orderId",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Order Date: ${formatDate(orderDate)}"),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Text(
              "Item: $item",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Quantity: $quantity"),
            Text("Price: \$ ${price.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('MMMM d, y')
        .format(date); // You can customize the format here
  }
}
