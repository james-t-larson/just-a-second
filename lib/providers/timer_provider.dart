import 'dart:async';
import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  int _elapsedMilliseconds = 0;

  bool get isRunning => _stopwatch.isRunning;
  int get elapsedMilliseconds => _elapsedMilliseconds;
  double get elapsedSeconds => _elapsedMilliseconds / 1000.0;
  
  String get displayTime {
    final seconds = (_elapsedMilliseconds / 1000.0).toStringAsFixed(2);
    return seconds;
  }

  void start() {
    _elapsedMilliseconds = 0; // Reset immediately
    _stopwatch.reset();
    _stopwatch.start();
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      _elapsedMilliseconds = _stopwatch.elapsedMilliseconds;
      notifyListeners();
    });
  }

  void stop() {
    _stopwatch.stop();
    _timer?.cancel();
    _elapsedMilliseconds = _stopwatch.elapsedMilliseconds;
    notifyListeners();
  }

  void reset() {
    _timer?.cancel(); // Stop the periodic updates
    _stopwatch.stop(); // Stop the stopwatch if running
    _stopwatch.reset();
    _elapsedMilliseconds = 0;
    notifyListeners();
  }
}
