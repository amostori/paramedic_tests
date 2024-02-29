import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/weight/providers/archive/weight_provider.dart';
import 'package:paramedic_tests/src/features/weight/weight_model/weight_model.dart';
import 'package:paramedic_tests/src/utils/age_helper.dart';

class Weight extends StateNotifier<WeightModel> {
  Weight({
    required this.delay,
  }) : super(const WeightModel(age: 'Wiek dziecka', weight: 0)) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showWeight();
    });
  }
  final int delay;
  late Timer _timer;

  Future<void> showWeight() async {
    final random = Random().nextInt(25);

    state = state.copyWith(age: AgeHelper.convertToAge(random), weight: -1);
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(weight: getWeight(random));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int getWeight(int age) {
    switch (age) {
      case 0:
        return 3;
      case 1:
        return 4;
      case 2:
        return 5;
      case 3:
        return 6;
      case 4:
        return 7;
      case 5:
        return 7;
      case 6:
        return 8;
      case 7:
        return 8;
      case 8:
        return 9;
      case 9:
        return 9;
      case 10:
        return 9;
      case 11:
        return 10;
      case 12:
        return 12;
      case 13:
        return 14;
      case 14:
        return 16;
      case 15:
        return 18;
      case 16:
        return 20;
      case 17:
        return 22;
      case 18:
        return 25;
      case 19:
        return 28;
      case 20:
        return 33;
      case 21:
        return 36;
      case 22:
        return 40;
      case 23:
        return 40;
      case 24: // 11 miesięcy
        return 10;
      default:
        return -1;
    }
  }
}

final weightProvider =
    StateNotifierProvider.autoDispose<Weight, WeightModel>((ref) {
  final delay = ref.watch(delayProvider);
  return Weight(delay: delay);
});
