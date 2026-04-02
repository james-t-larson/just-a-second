import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../providers/timer_provider.dart';
import '../widgets/red_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/levels'),
            child: const Text('Levels', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Just a Second',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 100),
            RedButton(
              label: 'Press to Start',
              isLarge: true,
              onTap: () {
                final gameProvider = context.read<GameProvider>();
                context.read<TimerProvider>().reset();
                Navigator.pushNamed(context, '/game');
              },
            ),
          ],
        ),
      ),
    );
  }
}
