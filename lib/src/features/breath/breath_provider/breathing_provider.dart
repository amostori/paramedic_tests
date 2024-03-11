import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/breath/breathing_model/breathing_model.dart';
import 'package:paramedic_tests/src/utils/age_helper.dart';

import '../../../utils/providers/delay_provider.dart';

class Breathing extends StateNotifier<BreathingModel> {
  Breathing({
    required this.delay,
  }) : super(const BreathingModel(
            age: 'Wiek dziecka',
            breathingRate: 'Częstość '
                'oddechu')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showBreathingRate();
    });
  }

  final int delay;
  late final Timer _timer;

  Future<void> showBreathingRate() async {
    final random = Random().nextInt(25);
    state = state.copyWith(
        age: AgeHelper.convertToAge(random), breathingRate: '-1');
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(breathingRate: setBreathingRate(random));
  }

  String setBreathingRate(int random) {
    if (random == 0) {
      return 'Oddech 30 - 60/min';
    } else if (random >= 1 && random <= 11) {
      return 'Oddech 30 - 50/min';
    } else if (random >= 12 && random <= 15) {
      return 'Oddech 24 - 40/min';
    } else if (random >= 16 && random <= 22) {
      return 'Oddech 20 - 30/min';
    } else if (random == 23) {
      return 'Oddech 12 - 30/min';
    } else {
      // 11 miesięcy
      return 'Oddech 30 - 50/min';
    }
  }
}

final breathingProvider =
    StateNotifierProvider.autoDispose<Breathing, BreathingModel>((ref) {
  final delay = ref.watch(delayProvider);
  return Breathing(delay: delay);
});
