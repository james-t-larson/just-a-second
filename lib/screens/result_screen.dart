import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/red_button.dart';
import '../utils/level_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();
    final result = gameProvider.lastResult;
    final level = gameProvider.currentLevel;

    if (result == null) {
      return const Scaffold(body: Center(child: Text('No result')));
    }

    final double seconds = result.elapsedTime.inMilliseconds / 1000.0;
    final String timeStr = seconds.toStringAsFixed(3);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
          child: const Text('Menu', style: TextStyle(color: Colors.black)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Text(
              timeStr,
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              '${result.score} points!',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: result.passed ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            if (!result.passed)
              Text(
                'You needed ${level.requiredPoints} points',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 80),
            if (result.passed)
              RedButton(
                label: 'Continue',
                onTap: () {
                  if (level.transitionMessage != null) {
                    Navigator.pushReplacementNamed(context, '/transition');
                  } else {
                    gameProvider.nextLevel();
                    Navigator.pushReplacementNamed(context, '/game');
                  }
                },
              )
            else
              RedButton(
                label: 'Try Again',
                onTap: () {
                  context.read<TimerProvider>().reset();
                  Navigator.pushReplacementNamed(context, '/game');
                },
              ),
          ],
        ),
      ),
    );
  }
}
