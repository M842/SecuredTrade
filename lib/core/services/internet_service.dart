import 'dart:io';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetService {
  final checker = InternetConnectionChecker.instance;
  static final InternetService _instance = InternetService._internal();
  factory InternetService() => _instance;
  InternetService._internal();

  // slow internet threshold (ms)
  static const int slowThreshold = 800;

  // Start monitoring
  void startMonitoring(BuildContext context) {
    checker.onStatusChange.listen((InternetConnectionStatus status) async {
      if (status == InternetConnectionStatus.disconnected) {
        _showSnackBar(context, "🚫 No internet connection!", Colors.red);
        return;
      }

      // If connected → check speed
      bool slow = await _isInternetSlow();
      if (slow) {
        _showSnackBar(context, "⚠️ Your internet is very slow", Colors.orange);
      }
    });
  }

  // Detect slow internet by checking response time
  Future<bool> _isInternetSlow() async {
    final url = Uri.parse("https://google.com/favicon.ico");
    final stopwatch = Stopwatch()..start();

    try {
      final request = await HttpClient().getUrl(url);
      final response = await request.close();
      await response.drain();
    } catch (e) {
      return true; // treat as slow or no internet
    }

    stopwatch.stop();
    return stopwatch.elapsedMilliseconds > slowThreshold;
  }

  void _showSnackBar(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
