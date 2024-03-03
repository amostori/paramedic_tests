import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/utils/drugs_helper.dart';

import '../man_model/man_model.dart';

class Man extends StateNotifier<ManModel> {
  Man()
      : super(const ManModel(
          age: 'Wiek dziecka',
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
  int waga = 0;
  String wiek = 'Brak danych';
  void showPatient(String age, String weight) {
    if (age != 'Brak danych' && weight == 'Brak danych') {
      waga = DrugHelper.getWeight(age);
      state = state.copyWith(
        age: age,
        weight: waga,
        breathingRate: DrugHelper.getBreathingRate(age),
        pulseRate: DrugHelper.getPulseRate(age),
        bloodPressure: DrugHelper.getPressure(age),
        glucoseLevel: DrugHelper.getGlucoseLevel(age),
        ambuMask: DrugHelper.getAmbu(age),
        tube: DrugHelper.getTube(age),
        laryngoscope: DrugHelper.getLyzka(age),
        laryngMask: DrugHelper.getMaskaKrtaniowa(waga),
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
    } else if (weight == 'Brak danych' && age == 'Brak danych') {
      return;
    } else if (age == 'Brak danych' && weight != 'Brak danych') {
      age = DrugHelper.getAge(weight);
      waga = int.parse(weight.split(' ')[0]);
      state = state.copyWith(
        age: age,
        weight: DrugHelper.getWeight(age),
        breathingRate: DrugHelper.getBreathingRate(age),
        pulseRate: DrugHelper.getPulseRate(age),
        bloodPressure: DrugHelper.getPressure(age),
        glucoseLevel: DrugHelper.getGlucoseLevel(age),
        ambuMask: DrugHelper.getAmbu(age),
        tube: DrugHelper.getTube(age),
        laryngoscope: DrugHelper.getLyzka(age),
        laryngMask: DrugHelper.getMaskaKrtaniowa(waga),
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
    } else if (age != 'Brak danych' && weight != 'Brak danych') {
      waga = int.parse(weight.split(' ')[0]);
      wiek = DrugHelper.getAge(weight);
      state = state.copyWith(
        age: age,
        weight: waga,
        breathingRate: DrugHelper.getBreathingRate(age),
        pulseRate: DrugHelper.getPulseRate(age),
        bloodPressure: DrugHelper.getPressure(age),
        glucoseLevel: DrugHelper.getGlucoseLevel(age),
        ambuMask: DrugHelper.getAmbu(age),
        tube: DrugHelper.getTube(age),
        laryngoscope: DrugHelper.getLyzka(age),
        laryngMask: DrugHelper.getMaskaKrtaniowa(waga),
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
    }
  }
}

final manProvider = StateNotifierProvider<Man, ManModel>((ref) {
  return Man();
});
