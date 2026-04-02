import 'package:flutter_test/flutter_test.dart';
import 'package:just_a_second/utils/scoring.dart';

void main() {
  group('Scoring Logic Tests (1.00s Target)', () {
    const target = 1.00;

    test('Exact 1.00s should give 100 points', () {
      expect(calculateScore(1.000, target), 100);
    });

    test('0.50s should give 50 points', () {
      expect(calculateScore(0.500, target), 50);
    });

    test('0.05s should give 5 points', () {
      expect(calculateScore(0.050, target), 5);
    });

    test('1.01s should give 0 points (over target)', () {
      expect(calculateScore(1.010, target), 0);
    });

    test('0.99s should give 99 points', () {
      expect(calculateScore(0.990, target), 99);
    });
  });

  group('Scoring Logic Tests (5.00s Target)', () {
    const target = 5.00;

    test('Exact 5.00s should give 500 points', () {
      expect(calculateScore(5.000, target), 500);
    });

    test('2.50s should give 250 points', () {
      expect(calculateScore(2.500, target), 250);
    });

    test('5.01s should give 0 points (over target)', () {
      expect(calculateScore(5.010, target), 0);
    });
  });
}
