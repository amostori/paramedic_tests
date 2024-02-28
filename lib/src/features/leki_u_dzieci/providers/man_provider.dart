import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../man_model/man_model.dart';

class Man extends StateNotifier<ManModel> {
  Man()
      : super(const ManModel(
            patient: 'Pacjent', title: 'Oddech', descript: 'Tętno'));

  void showPatient(String age, String weight) {
    if (age != 'Brak danych' && weight == 'Brak danych') {
      switch (age) {
        case 'Noworodek':
          state = state.copyWith(
              patient: 'Noworodek',
              title: 'Oddech 30 - 60/min',
              descript: 'Tętn'
                  'o 100 - 180/min');
          break;
        default:
          return;
      }
    } else if (weight == 'Brak danych' && age == 'Brak danych') {
      return;
    } else if (age == 'Brak danych' && weight != 'Brak danych') {
      switch (weight) {
        case '2 kg':
          state = state.copyWith(
              patient: 'Noworodek',
              title: 'Oddech 30 - 60/min',
              descript: 'Tętn'
                  'o 100 - 180/min');
          break;
        default:
          return;
      }
    }
  }
}

final manProvider = StateNotifierProvider<Man, ManModel>((ref) {
  return Man();
});
