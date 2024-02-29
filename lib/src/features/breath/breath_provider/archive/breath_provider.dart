import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../weight/providers/archive/weight_provider.dart';

class Breath extends StateNotifier<AsyncValue<String>> {
  Breath(this.delay, {required this.age})
      : super(const AsyncData('Częstość '
            'oddechu'));
  final int delay;
  final int age;

  Future<void> showBreath() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: delay));
      return setBreath(age);
    });
  }

  String setBreath(int age) {
    if (age == 0) {
      return 'Oddech 30 - 60/min';
    } else if (age >= 1 && age <= 11) {
      return 'Oddech 30 - 50/min';
    } else if (age >= 12 && age <= 15) {
      return 'Oddech 24 - 40/min';
    } else if (age >= 16 && age <= 22) {
      return 'Oddech 20 - 30/min';
    } else if (age == 23) {
      return 'Oddech 12 - 30/min';
    } else {
      // 11 miesięcy
      return 'Oddech 30 - 50/min';
    }
  }
}

final breathProvider =
    StateNotifierProvider.family<Breath, AsyncValue<String>, int>((ref, age) {
  final delay = ref.watch(delayProvider);
  return Breath(delay, age: age);
});
