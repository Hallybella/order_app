import 'package:order_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;

final navigationService = locator<NavigationService>();
final clientOptions = ably.ClientOptions(
    key: '1M7dBg.Qa7BKQ:7K6d7lJgxEQEYUb9q8fW7Vum9x3PrNXV0d47KJTep_M');
final realtimeInstance = ably.Realtime(options: clientOptions);
final channel = realtimeInstance.channels.get('order-app');
