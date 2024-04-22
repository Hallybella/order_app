import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:order_app/app/app.logger.dart';

class AblyService {
  final log = getLogger("AblyService");
  void createAblyRealtimeInstance() async {
    // Connect to Ably with your API key
    final realtimeInstance = ably.Realtime(
        key: '1M7dBg.Qa7BKQ:7K6d7lJgxEQEYUb9q8fW7Vum9x3PrNXV0d47KJTep_M');
    realtimeInstance.connection
        .on(ably.ConnectionEvent.connected)
        .listen((ably.ConnectionStateChange stateChange) async {
      log.v('New state is: ${stateChange.current}');
      switch (stateChange.current) {
        case ably.ConnectionState.connected:
          log.v('Connected to Ably!');
          break;
        case ably.ConnectionState.failed:
          log.v('The connection to Ably failed.');
          // Failed connection
          break;

        case ably.ConnectionState.initialized:
        // TODO: Handle this case.
        case ably.ConnectionState.connecting:
        // TODO: Handle this case.
        case ably.ConnectionState.disconnected:
        // TODO: Handle this case.
        case ably.ConnectionState.suspended:
        // TODO: Handle this case.
        case ably.ConnectionState.closing:
        // TODO: Handle this case.
        case ably.ConnectionState.closed:
        // TODO: Handle this case.
      }

      // Create a channel called 'get-started' and register a listener to subscribe to all messages with the name 'first'
      final channel = realtimeInstance.channels.get('get-started');
      channel.subscribe().listen((message) {
        log.v('Message received: ${message.data}');
      });

      // Publish a message with the name 'first' and the contents 'Here is my first message!'
      await channel.publish(name: 'first', data: "Here is my first message!");

      // Close the connection to Ably
      realtimeInstance.connection.close();
      realtimeInstance.connection
          .on(ably.ConnectionEvent.closed)
          .listen((ably.ConnectionStateChange stateChange) async {
        log.v('New state is: ${stateChange.current}');
        switch (stateChange.current) {
          case ably.ConnectionState.closed:
            log.v('Closed connection to Ably.');
            break;
          case ably.ConnectionState.failed:
            break;
          case ably.ConnectionState.initialized:
          // TODO: Handle this case.
          case ably.ConnectionState.connecting:
          // TODO: Handle this case.
          case ably.ConnectionState.connected:
          // TODO: Handle this case.
          case ably.ConnectionState.disconnected:
          // TODO: Handle this case.
          case ably.ConnectionState.suspended:
          // TODO: Handle this case.
          case ably.ConnectionState.closing:
          // TODO: Handle this case.
        }
      });
    });
  }
}
