import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/weight/providers/archive/weight_provider.dart';
import 'package:paramedic_tests/src/features/weight/weight_model/weight_model.dart';
import 'package:paramedic_tests/src/utils/age_helper.dart';

class Weight extends StateNotifier<WeightModel> {
  Weight({
    required this.delay,
  }) : super(const WeightModel(age: 'Wiek dziecka', weight: '0 kg')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showWeight();
    });
  }
  final int delay;
  late Timer _timer;

  Future<void> showWeight() async {
    final random = Random().nextInt(25);

    state = state.copyWith(age: AgeHelper.convertToAge(random), weight: '-1');
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(weight: getWeight(random));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getWeight(int age) {
    switch (age) {
      case 0:
        return '3 kg';
      case 1:
        return '4 kg';
      case 2:
        return '5 kg';
      case 3:
        return '6 kg';
      case 4:
        return '7 kg';
      case 5:
        return '7 kg';
      case 6:
        return '8 kg';
      case 7:
        return '8 kg';
      case 8:
        return '9 kg';
      case 9:
        return '9 kg';
      case 10:
        return '9 kg';
      case 11:
        return '10 kg';
      case 12:
        return '12 kg';
      case 13:
        return '14 kg';
      case 14:
        return '16 kg';
      case 15:
        return '18 kg';
      case 16:
        return '20 kg';
      case 17:
        return '22 kg';
      case 18:
        return '25 kg';
      case 19:
        return '28 kg';
      case 20:
        return '33 kg';
      case 21:
        return '36 kg';
      case 22:
        return '40 kg';
      case 23:
        return '40 kg';
      case 24: // 11 miesięcy
        return '10 kg';
      default:
        return '-1';
    }
  }
}

final weightProvider =
    StateNotifierProvider.autoDispose<Weight, WeightModel>((ref) {
  final delay = ref.watch(delayProvider);
  return Weight(delay: delay);
});
