class Order {
  final String orderId;
  final String orderDate;
  final String orderItem;
  final String orderStatus;
  final List<String> orderNotes;
  final int orderQuantity;
  final double orderPrice;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.orderItem,
    required this.orderQuantity,
    required this.orderPrice,
    required this.orderStatus,
    required this.orderNotes,
  });
}
