import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../weight/providers/weight_provider.dart';

class Ventilation extends StateNotifier<AsyncValue<String>> {
  Ventilation(this.delay, {required this.age})
      : super(const AsyncData('Częstość wentylacji'));
  final int delay;
  final int age;

  Future<void> showVent() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: delay));
      return setVentilation(age);
    });
  }

  String setVentilation(int age) {
    if (age == 0) {
      return '30/min, co 2 sek';
    } else if (age >= 1 && age <= 11) {
      return '25/min, co 2,5 sek';
    } else if (age >= 12 && age <= 18) {
      return '20/min, co 3 sek';
    } else if (age >= 19 && age <= 23) {
      return '15/min, co 4 sek';
    } else {
      // 11 miesięcy
      return '25/min, co 2,5 sek';
    }
  }
}

final ventProvider =
    StateNotifierProvider.family<Ventilation, AsyncValue<String>, int>(
        (ref, age) {
  final delay = ref.watch(delayProvider);
  return Ventilation(delay, age: age);
});
