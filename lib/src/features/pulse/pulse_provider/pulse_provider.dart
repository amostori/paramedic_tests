import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/pulse/pulse_model/pulse_model.dart';
import 'package:paramedic_tests/src/utils/age_helper.dart';

import '../../../utils/providers/delay_provider.dart';

class Pulse extends StateNotifier<PulseModel> {
  final int delay;
  late final Timer _timer;

  Pulse({
    required this.delay,
  }) : super(const PulseModel(
            age: 'Wiek dziecka', pulseRate: 'Częstość akcji serca')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showPulse();
    });
  }

  Future<void> showPulse() async {
    final random = Random().nextInt(25);
    state =
        state.copyWith(age: AgeHelper.convertToAge(random), pulseRate: '-1');
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(pulseRate: setPulseRate(random));
  }

  String setPulseRate(int age) {
    if (age == 0) {
      return 'Tętno 100 - 180/min';
    } else if (age >= 1 && age <= 6) {
      return 'Tętno 110 - 180/min';
    } else if (age >= 7 && age <= 10) {
      return 'Tętno 110 - 170/min';
    } else if (age >= 11 && age <= 12) {
      return 'Tętno 90 - 150/min';
    } else if (age >= 13 && age <= 15) {
      return 'Tętno 70 - 140/min';
    } else if (age >= 16 && age <= 23) {
      return 'Tętno 60 - 130/min';
    } else {
      // 11 miesięcy
      return 'Tętno 110 - 170/min';
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final pulseProvider =
    StateNotifierProvider.autoDispose<Pulse, PulseModel>((ref) {
  final delay = ref.watch(delayProvider);
  return Pulse(delay: delay);
});
