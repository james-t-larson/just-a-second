import '../models/level.dart';

const List<Level> allLevels = [
  // Levels 1-5 (Standard 1.00s)
  Level(levelNumber: 1, targetTimeSeconds: 1.00, requiredPoints: 60),
  Level(levelNumber: 2, targetTimeSeconds: 1.00, requiredPoints: 70),
  Level(levelNumber: 3, targetTimeSeconds: 1.00, requiredPoints: 80),
  Level(levelNumber: 4, targetTimeSeconds: 1.00, requiredPoints: 90),
  Level(levelNumber: 5, targetTimeSeconds: 1.00, requiredPoints: 100, 
    transitionMessage: "Good job! Looks like you've gotten the hang of it, let's make things a little harder"),

  // Levels 6-10 (Invisible 1.00s)
  Level(levelNumber: 6, targetTimeSeconds: 1.00, requiredPoints: 60, hideButton: true),
  Level(levelNumber: 7, targetTimeSeconds: 1.00, requiredPoints: 70, hideButton: true),
  Level(levelNumber: 8, targetTimeSeconds: 1.00, requiredPoints: 80, hideButton: true),
  Level(levelNumber: 9, targetTimeSeconds: 1.00, requiredPoints: 90, hideButton: true),
  Level(levelNumber: 10, targetTimeSeconds: 1.00, requiredPoints: 100, hideButton: true,
    transitionMessage: "You're getting the hang of it! But how are you at multitasking?"),

  // Levels 11-15 (Standard 5.00s)
  Level(levelNumber: 11, targetTimeSeconds: 5.00, requiredPoints: 60),
  Level(levelNumber: 12, targetTimeSeconds: 5.00, requiredPoints: 70),
  Level(levelNumber: 13, targetTimeSeconds: 5.00, requiredPoints: 80),
  Level(levelNumber: 14, targetTimeSeconds: 5.00, requiredPoints: 90),
  Level(levelNumber: 15, targetTimeSeconds: 5.00, requiredPoints: 100),
];
