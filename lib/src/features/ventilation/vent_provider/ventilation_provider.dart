import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/ventilation/ventilation_model/ventilation_model.dart';
import 'package:paramedic_tests/src/utils/age_helper.dart';

import '../../../utils/providers/delay_provider.dart';

class Ventilation extends StateNotifier<VentilationModel> {
  final int delay;
  late final Timer _timer;

  Ventilation({
    required this.delay,
  }) : super(const VentilationModel(
            age: 'Wiek dziecka',
            ventilationRate: 'Często'
                'ść '
                'wentylacji')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showVentilationRate();
    });
  }

  Future<void> showVentilationRate() async {
    final random = Random().nextInt(25);
    state = state.copyWith(
        age: AgeHelper.convertToAge(random), ventilationRate: '-1');
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(ventilationRate: setVentilationRate(random));
  }

  String setVentilationRate(int age) {
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final ventilationProvider =
    StateNotifierProvider.autoDispose<Ventilation, VentilationModel>((ref) {
  final delay = ref.watch(delayProvider);
  return Ventilation(delay: delay);
});
