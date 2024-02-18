import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../weight/providers/weight_provider.dart';

class Pulse extends StateNotifier<AsyncValue<String>> {
  Pulse(this.delay, {required this.age}) : super(const AsyncData(''));
  final int age;
  final int delay;

  Future<void> showPulse() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: delay));
      return setHeartRate(age);
    });
  }

  String setHeartRate(int age) {
    if (age == 0) {
      return 'Tętno 100 - 180/min';
    } else if (age >= 1 && age <= 6) {
      return 'Tętno 110 - 180/min';
    } else if (age >= 7 && age <= 10) {
      return 'Tętno 110 - 170/min';
    } else if (age >= 11 && age <= 12) {
      return 'Tętno 90 - 150/min';
    } else if (age >= 13 && age <= 16) {
      return 'Tętno 70 - 140/min';
    } else if (age >= 17 && age <= 23) {
      return 'Tętno 60 - 130/min';
    } else {
      // 11 miesięcy
      return 'Tętno 110 - 170/min';
    }
  }
}

final pulseProvider =
    StateNotifierProvider.family<Pulse, AsyncValue<String>, int>((ref, age) {
  final delay = ref.watch(delayProvider);
  return Pulse(delay, age: age);
});
