import 'package:flutter/foundation.dart';
import '../models/game_result.dart';
import '../models/level.dart';
import '../utils/level_data.dart';

class GameProvider with ChangeNotifier {
  int _currentLevelIndex = 0;
  int _unlockedLevelCount = 1;
  GameResult? _lastResult;

  int get currentLevelIndex => _currentLevelIndex;
  int get unlockedLevelCount => _unlockedLevelCount;
  GameResult? get lastResult => _lastResult;
  Level get currentLevel => allLevels[_currentLevelIndex];

  void nextLevel() {
    if (_currentLevelIndex < allLevels.length - 1) {
      _currentLevelIndex++;
      if (_currentLevelIndex + 1 > _unlockedLevelCount) {
        _unlockedLevelCount = _currentLevelIndex + 1;
      }
      notifyListeners();
    }
  }

  void goToLevel(int index) {
    if (index >= 0 && index < _unlockedLevelCount) {
      _currentLevelIndex = index;
      notifyListeners();
    }
  }

  void completeLevel(GameResult result) {
    _lastResult = result;
    if (result.passed) {
      if (_currentLevelIndex + 1 > _unlockedLevelCount) {
        _unlockedLevelCount = _currentLevelIndex + 1;
      }
    }
    notifyListeners();
  }
}
