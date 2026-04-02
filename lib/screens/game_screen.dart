import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/red_button.dart';
import '../widgets/timer_display.dart';
import '../models/game_result.dart';
import '../utils/scoring.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _isHolding = false;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TimerProvider>().reset();
    });
  }

  void _handleStart() {
    if (_isFinished) return;
    setState(() => _isHolding = true);
    context.read<TimerProvider>().start();
  }

  void _handleEnd() {
    if (!_isHolding || _isFinished) return;
    setState(() {
      _isHolding = false;
      _isFinished = true;
    });

    final timerProvider = context.read<TimerProvider>();
    timerProvider.stop();

    final gameProvider = context.read<GameProvider>();
    final level = gameProvider.currentLevel;

    final elapsedSeconds = timerProvider.elapsedSeconds;
    final score = calculateScore(elapsedSeconds, level.targetTimeSeconds);
    final passed = score >= level.requiredPoints;

    final result = GameResult(
      elapsedTime: Duration(milliseconds: timerProvider.elapsedMilliseconds),
      score: score,
      passed: passed,
      levelNumber: level.levelNumber,
    );

    gameProvider.completeLevel(result);

    // Small delay to let user see the stop if needed, or navigate immediately
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();
    final timerProvider = context.watch<TimerProvider>();
    final level = gameProvider.currentLevel;

    final bool shouldHideUI = level.hideButton && _isHolding;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Visibility(
            visible: !shouldHideUI,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Level ${level.levelNumber}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _isHolding ? '' : 'Press and hold to start',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  TimerDisplay(
                    time: timerProvider.displayTime,
                    isVisible: !_isHolding || !level.hideButton,
                  ),
                  const SizedBox(height: 80),
                  RedButton(
                    label: _isHolding ? 'Holding...' : 'Hold to Start',
                    onLongPressStart: _handleStart,
                    onLongPressEnd: _handleEnd,
                  ),
                ],
              ),
            ),
          ),
          // For invisible level: listen for release anywhere
          if (shouldHideUI)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanEnd: (_) => _handleEnd(),
              onTapUp: (_) => _handleEnd(),
              onLongPressEnd: (_) => _handleEnd(),
              child: Container(color: Colors.white),
            ),
        ],
      ),
    );
  }
}
