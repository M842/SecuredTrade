import 'dart:async';
import 'dart:convert';
import 'package:securedtrade/config/path_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CurrencyWebsocketService {
  static final CurrencyWebsocketService instance =
      CurrencyWebsocketService.internal();
  factory CurrencyWebsocketService() => instance;
  CurrencyWebsocketService.internal();

  WebSocketChannel? channel;
  StreamSubscription? subscription;

  final ValueNotifier<double?> price = ValueNotifier(null);

  Future<void> call(String url, String symbol) async {
    try {
      channel = WebSocketChannel.connect(Uri.parse(url));

      print("🔗 WS Connected → $url");
      // reconnectAttempt = 0;

      _listenStream(symbol);
    } catch (e) {
      //AppUtils.showExceptionSnackbar("❌ WS Connection Error: $e");
      //_scheduleReconnect();
    } finally {
      // isConnecting = false;
    }
  }

  Future<void> executeTradingBot(String url, String symbol) async {
    try {
      channel = WebSocketChannel.connect(Uri.parse(url));

      print("🔗 WS Connected → $url");
      // reconnectAttempt = 0;

      _listenBotStream(symbol);
    } catch (e) {
      //AppUtils.showExceptionSnackbar("❌ WS Connection Error: $e");
      //_scheduleReconnect();
    } finally {
      // isConnecting = false;
    }
  }

  void _listenStream(String symbol) {
    subscription?.cancel();

    subscription = channel!.stream.listen(
      (event) async {
        try {
          final json = jsonDecode(event);

          price.value = double.parse(json['c']);

          // final l = json['data'] as List<dynamic>;
          // for (final item in l) {
          //   if (item['s'] == symbol) {
          //     price = double.parse(item['c']);
          //     print("$symbol  ${price}");
          //   }
          // }

          /// Use isolate only if JSON is heavy (>5KB)
        } catch (e) {
          print("❌ WS JSON Error: $e");
        }
      },
      onError: (e) => print('❌ WS Error: $e'),
      onDone: () => print('🔌 WS Closed'),

      cancelOnError: true,
    );
  }

  void disconnect() {
    channel!.sink.close();
  }

  void _listenBotStream(String symbol) {
    subscription?.cancel();

    subscription = channel!.stream.listen(
      (event) async {
        try {
          final json = jsonDecode(event);
          print(json);

          // final l = json['data'] as List<dynamic>;
          // for (final item in l) {
          //   if (item['s'] == symbol) {
          //     price = double.parse(item['c']);
          //     print("$symbol  ${price}");
          //   }
          // }

          /// Use isolate only if JSON is heavy (>5KB)
        } catch (e) {
          print("❌ WS JSON Error: $e");
        }
      },
      onError: (e) => print('❌ WS Error: $e'),
      onDone: () => print('🔌 WS Closed'),

      cancelOnError: true,
    );
  }
}
