import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/utils/drugs_helper.dart';

import '../man_model/man_model.dart';

class Man extends StateNotifier<ManModel> {
  Man()
      : super(const ManModel(
          age: '',
          weight: 0,
          breathingRate: '',
          pulseRate: '',
          bloodPressure: '',
          glucoseLevel: '',
          ambuMask: '',
          tube: '',
          laryngoscope: ''
              '',
          laryngMask: '',
          defibrillation: '',
          cardioversion: '',
          adenosine: '',
          adrenalin: '',
          adrenalinAnafilaksja: '',
          adrenalinWlew: '',
          amiodaron: '',
          atropina: '',
          clonazepam: '',
          deksametazon: '',
          diazepam: '',
          diazepamPr: '',
          fentanyl: '',
          furosemid: '',
          glukagon: '',
          glucose20: '',
          hydrokortyzon: '',
          ibuprofen: '',
          magnez: '',
          midazolam: '',
          morfina: '',
          natriumBicarbonicum: '',
          nalokson: '',
          paracetamolCzopek: '',
          paracetamolWlew: '',
          plyn: '',
          salbutamol: '',
        ));
  late final int waga;
  void showPatient(String age, String weight) {
    if (age != 'Brak danych' && weight == 'Brak danych') {
      switch (age) {
        case 'Noworodek':
          waga = 3;
          state = state.copyWith(
            age: 'Noworodek',
            weight: 3,
            breathingRate: '30 - 60/min',
            pulseRate: '100 - 180/min',
            bloodPressure: '60/40 mmHg',
            glucoseLevel: '40 - 90 mg/dl',
            ambuMask: 'nr 1',
            tube: '3.0 na 9 cm',
            laryngoscope: 'łyżka prosta 0',
            laryngMask: 'nr 1',
            defibrillation: '${waga * 4} J',
            cardioversion: 'I dawka: $waga, II dawka ${waga * 2}',
            adenosine: DrugHelper.getAdenozine(waga),
            adrenalin: DrugHelper.getAdrenaline(waga),
            adrenalinAnafilaksja: DrugHelper.getAdrenalineAnafilaksja(waga),
            adrenalinWlew: DrugHelper.getAdrenalinPompa(waga),
            amiodaron: DrugHelper.getAmiodaron(waga),
            atropina: DrugHelper.getAtropine(waga),
            clonazepam: DrugHelper.getClonazepam(),
            deksametazon: DrugHelper.getDeksametazon(waga),
            diazepam: DrugHelper.getDiazepam(waga),
            diazepamPr: DrugHelper.getDiazepamPr(waga),
            fentanyl: DrugHelper.getFentanyl(waga),
            furosemid: DrugHelper.getFurosemid(waga),
            glukagon: DrugHelper.getGlukoza(waga),
            glucose20: DrugHelper.getGlukoza(waga),
            hydrokortyzon: DrugHelper.getHydrokortyzon(waga),
            ibuprofen: DrugHelper.getIbuprofen(waga),
            magnez: DrugHelper.getMagnez(waga),
            midazolam: DrugHelper.getMidazolam(waga),
            morfina: DrugHelper.getMorfina(waga),
            natriumBicarbonicum: DrugHelper.getNahco3(waga),
            nalokson: DrugHelper.getNalokson(waga),
            paracetamolCzopek: DrugHelper.getParacetamolCzopek(waga),
            paracetamolWlew: DrugHelper.getParacetamol(waga),
            plyn: DrugHelper.getPlyn(waga),
            salbutamol: DrugHelper.getSalbutamol(waga),
          );
          break;
        default:
          return;
      }
    } else if (weight == 'Brak danych' && age == 'Brak danych') {
      return;
    } else if (age == 'Brak danych' && weight != 'Brak danych') {
      switch (weight) {
        case '2 kg':
          waga = 2;
          state = state.copyWith(
            age: 'Noworodek',
            weight: waga,
            breathingRate: '30 - 60/min',
            pulseRate: '100 - 180/min',
            bloodPressure: '60/40 mmHg',
            glucoseLevel: '40 - 90 mg/dl',
            ambuMask: 'nr 1',
            tube: '3.0 na 9 cm',
            laryngoscope: 'łyżka prosta 0',
            laryngMask: 'nr 1',
            defibrillation: '${waga * 4} J',
            cardioversion: 'I dawka: $waga, II dawka ${waga * 2}',
            adenosine: DrugHelper.getAdenozine(waga),
            adrenalin: DrugHelper.getAdrenaline(waga),
            adrenalinAnafilaksja: DrugHelper.getAdrenalineAnafilaksja(waga),
            adrenalinWlew: DrugHelper.getAdrenalinPompa(waga),
            amiodaron: DrugHelper.getAmiodaron(waga),
            atropina: DrugHelper.getAtropine(waga),
            clonazepam: DrugHelper.getClonazepam(),
            deksametazon: DrugHelper.getDeksametazon(waga),
            diazepam: DrugHelper.getDiazepam(waga),
            diazepamPr: DrugHelper.getDiazepamPr(waga),
            fentanyl: DrugHelper.getFentanyl(waga),
            furosemid: DrugHelper.getFurosemid(waga),
            glukagon: DrugHelper.getGlukoza(waga),
            glucose20: DrugHelper.getGlukoza(waga),
            hydrokortyzon: DrugHelper.getHydrokortyzon(waga),
            ibuprofen: DrugHelper.getIbuprofen(waga),
            magnez: DrugHelper.getMagnez(waga),
            midazolam: DrugHelper.getMidazolam(waga),
            morfina: DrugHelper.getMorfina(waga),
            natriumBicarbonicum: DrugHelper.getNahco3(waga),
            nalokson: DrugHelper.getNalokson(waga),
            paracetamolCzopek: DrugHelper.getParacetamolCzopek(waga),
            paracetamolWlew: DrugHelper.getParacetamol(waga),
            plyn: DrugHelper.getPlyn(waga),
            salbutamol: DrugHelper.getSalbutamol(waga),
          );
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
