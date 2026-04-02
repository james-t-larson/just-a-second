class GameResult {
  final Duration elapsedTime;
  final int score;
  final bool passed;
  final int levelNumber;

  const GameResult({
    required this.elapsedTime,
    required this.score,
    required this.passed,
    required this.levelNumber,
  });
}
