import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../providers/timer_provider.dart';
import '../utils/level_data.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.watch<GameProvider>();
    final unlockedCount = gameProvider.unlockedLevelCount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Levels', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: allLevels.length,
          itemBuilder: (context, index) {
            final isUnlocked = index < unlockedCount;
            final isCurrent = index == gameProvider.currentLevelIndex;

            return InkWell(
                  onTap: isUnlocked
                      ? () {
                          gameProvider.goToLevel(index);
                          context.read<TimerProvider>().reset();
                          Navigator.pushNamed(context, '/game');
                        }
                      : null,
              child: Container(
                decoration: BoxDecoration(
                  color: isCurrent
                      ? Colors.red
                      : isUnlocked
                          ? Colors.grey.shade200
                          : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${allLevels[index].levelNumber}',
                  style: TextStyle(
                    color: isCurrent || !isUnlocked ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
