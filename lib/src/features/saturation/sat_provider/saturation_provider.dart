import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/weight/providers/weight_provider.dart';

class SaturationState extends StateNotifier<AsyncValue<String>> {
  SaturationState(this.delay, {required this.time})
      : super(const AsyncData('Saturacja noworodka'));
  final int delay;
  final int time;

  String setSaturation(int time) {
    switch (time) {
      case 0:
        return 'Saturacja 60%';
      case 1:
        return 'Saturacja 70%';
      case 2:
        return 'Saturacja 80%';
      case 3:
        return 'Saturacja 85%';
      case 4:
        return 'Saturacja 90%';
      default:
        return 'Hej saturacja nieokreślona';
    }
  }

  Future<void> showSaturation() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: delay));
      return setSaturation(time);
    });
  }
}

final saturationStateProvider =
    StateNotifierProvider.family<SaturationState, AsyncValue<String>, int>(
        (ref, random) {
  final delay = ref.watch(delayProvider);
  return SaturationState(delay, time: random);
});
