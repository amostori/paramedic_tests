import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../weight/providers/weight_provider.dart';

class MaskProvider extends StateNotifier<AsyncValue<String>> {
  MaskProvider(this.delay, {required this.age}) : super(const AsyncData(''));
  final int delay;
  final int age;

  Future<void> showMask() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: delay));
      return setMask(age);
    });
  }

  String setMask(int age) {
    if (age >= 0 && age <= 10) {
      return 'Maska 1';
    } else if (age == 11) {
      return 'Maska 2';
    } else if (age >= 12 && age <= 17) {
      return 'Maska 4';
    } else if (age >= 18 && age <= 19) {
      return 'Maska 5';
    } else if (age >= 20 && age <= 23) {
      return 'Maska 5 - 6';
    } else if (age == 24) {
      return 'Maska 1';
    } else if (age >= 25 && age <= 27) {
      return 'Maska 2';
    } else if (age >= 28 && age <= 31) {
      return 'Maska 3';
    } else {
      return 'Poza skalą';
    }
  }
}

final maskProvider =
    StateNotifierProvider.family<MaskProvider, AsyncValue<String>, int>(
        (ref, age) {
  final delay = ref.watch(delayProvider);
  return MaskProvider(delay, age: age);
});
