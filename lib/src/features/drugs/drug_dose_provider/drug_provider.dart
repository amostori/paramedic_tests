import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/drugs/drug_model/drug_model.dart';
import 'package:paramedic_tests/src/features/weight/providers/archive/weight_provider.dart';

class Drug extends StateNotifier<DrugModel> {
  final int delay;
  late final Timer _timer;
  Drug({
    required this.delay,
  }) : super(const DrugModel(drugName: 'Nazwa leku', drugDose: 'Dawka leku')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showDrugDoses();
    });
  }
  final List<String> drugList = [
    'Morfina',
    'Fentanyl',
    'Paracetamol',
    'Midazolam - padaczka i.m.'
  ];

  Future<void> showDrugDoses() async {
    final random = Random().nextInt(drugList.length);
    state = state.copyWith(drugName: drugList[random], drugDose: '-1');
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(drugDose: setDrugDose(random));
  }

  String setDrugDose(int drugId) {
    switch (drugId) {
      case 0: // Mf
        return 'Rozcieńcz 10 mg do 10 ml.\nDawka: 0,1 ml/kg';
      case 1: // Fentanyl
        return 'Rozcieńcz 0,1 mg do 10 ml.\nDawka: 0,1 ml/kg';
      case 2: // Paracetamol
        return 'Dziecko <10 kg: Dawka: 0,75 ml/kg\nDziecko >10 kg Dawka: 1,5 '
            'ml/kg';
      case 3: // Midazolam i.m.
        return 'Rozcieńcz 5 mg do 5 ml\n\nDawka: 0,2 ml/kg';
      default:
        return 'nothing hill';
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final drugProvider = StateNotifierProvider.autoDispose<Drug, DrugModel>((ref) {
  final delay = ref.watch(delayProvider);
  return Drug(delay: delay);
});
