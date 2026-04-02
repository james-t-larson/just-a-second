import 'dart:math';

int calculateScore(double elapsedSeconds, double targetSeconds) {
  if (elapsedSeconds > targetSeconds) {
    return 0;
  }
  
  // score = max(0, round(targetTime * 100 - abs(targetTime * 100 - elapsedTime * 100)))
  // This simplifies to max(0, 100 * targetTime - 100 * abs(targetTime - elapsedTime))
  
  final targetMs = (targetSeconds * 1000).round();
  final elapsedMs = (elapsedSeconds * 1000).round();
  
  // Points are given following the requirement: 
  // 1.00 exactly = 100 points
  // 0.50 exactly = 50 points
  // 0.05 exactly = 5 points
  
  // For 5 second target:
  // 5.00 exactly = 500 points
  
  final diffMs = (targetMs - elapsedMs).abs();
  final score = (targetMs - diffMs) ~/ 10;
  
  return max(0, score);
}
