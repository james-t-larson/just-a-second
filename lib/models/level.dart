class Level {
  final int levelNumber;
  final double targetTimeSeconds;
  final int requiredPoints;
  final bool hideButton;
  final String? transitionMessage;

  const Level({
    required this.levelNumber,
    required this.targetTimeSeconds,
    required this.requiredPoints,
    this.hideButton = false,
    this.transitionMessage,
  });
}
