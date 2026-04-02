import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/red_button.dart';

class TransitionScreen extends StatelessWidget {
  const TransitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();
    final level = gameProvider.currentLevel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                level.transitionMessage ?? "Good job!",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80),
              RedButton(
                label: 'Continue',
                onTap: () {
                  gameProvider.nextLevel();
                  context.read<TimerProvider>().reset();
                  Navigator.pushReplacementNamed(context, '/game');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
