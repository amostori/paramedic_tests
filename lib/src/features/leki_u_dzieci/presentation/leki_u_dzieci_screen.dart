import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/presentation/widgets/one_row.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/presentation/widgets/one_row_paint.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/providers/man_provider.dart';
import 'package:paramedic_tests/src/utils/strings_manager.dart';

import '../utils/my_painter.dart';

class LekiUDzieciScreen extends ConsumerStatefulWidget {
  const LekiUDzieciScreen({super.key});

  @override
  ConsumerState createState() => _LekiUDzieciScreenState();
}

class _LekiUDzieciScreenState extends ConsumerState<LekiUDzieciScreen> {
  final offsets = <Offset?>[];
  final ThemeData specialThemeData = ThemeData(
    brightness: Brightness.light,
  );
  @override
  Widget build(BuildContext context) {
    final man = ref.watch(manProvider);
    return Theme(
      data: specialThemeData,
      child: Scaffold(
          appBar: AppBar(
            title: Text('${man.age}, waga: ${man.weight}'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showPickerNumber(context, ref);
            },
            child: Icon(Icons.scale,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.black12,
                width: double.infinity,
                child: GestureDetector(
                  onPanDown: (details) {
                    setState(() {
                      offsets.add(details.localPosition);
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      offsets.add(details.localPosition);
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      offsets.add(null);
                    });
                  },
                  child: Center(
                    child: CustomPaint(
                      painter: MyPainter(offsets: offsets),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              OneRowPaint(
                                title: 'Częstość oddechu: ',
                                descript: man.breathingRate,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Saturacja:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Temp:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              OneRowPaint(
                                title: 'Akcja serca: ',
                                descript: man.pulseRate,
                              ),
                              OneRowPaint(
                                title: 'Minimalne ciśnienie: ',
                                descript: man.bloodPressure,
                              ),
                              OneRowPaint(
                                title: 'Glukoza: ',
                                descript: man.glucoseLevel,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          OneRow(
                            title: 'Maska twarzowa: ',
                            descript: man.ambuMask,
                          ),
                          OneRow(
                            title: 'Rurka intubacyjna: ',
                            descript: man.tube,
                          ),
                          OneRow(
                            title: 'Łyżka laryngoskopu: ',
                            descript: man.laryngoscope,
                          ),
                          OneRow(
                            title: 'Maska krtaniowa: ',
                            descript: man.laryngMask,
                          ),
                          OneRow(
                            title: 'Defibrylacja: ',
                            descript: man.defibrillation,
                          ),
                          OneRow(
                            title: 'Kardiowersja: ',
                            descript: man.cardioversion,
                          ),
                          OneRow(
                            title: 'Adenozyna: ',
                            descript: man.adenosine,
                          ),
                          OneRow(
                            title: 'Adrenalina RKO: ',
                            descript: man.adrenalin,
                          ),
                          OneRow(
                            title: 'Adrenalina anafilaksja: ',
                            descript: man.adrenalinAnafilaksja,
                          ),
                          OneRow(
                            title: 'Adrenalina wlew: ',
                            descript: man.adrenalinWlew,
                          ),
                          OneRow(
                            title: 'Amiodaron: ',
                            descript: man.amiodaron,
                          ),
                          OneRow(
                            title: 'Atropina: ',
                            descript: man.atropina,
                          ),
                          OneRow(
                            title: 'Clonazepam: ',
                            descript: man.clonazepam,
                          ),
                          OneRow(
                            title: 'Deksametazon: ',
                            descript: man.deksametazon,
                          ),
                          OneRow(
                            title: 'Diazepam: ',
                            descript: man.diazepam,
                          ),
                          OneRow(
                            title: 'Diazepam p.r.: ',
                            descript: man.diazepamPr,
                          ),
                          OneRow(
                            title: 'Fentanyl: ',
                            descript: man.fentanyl,
                          ),
                          OneRow(
                            title: 'Furosemid: ',
                            descript: man.furosemid,
                          ),
                          OneRow(
                            title: 'Glukagon: ',
                            descript: man.glukagon,
                          ),
                          OneRow(
                            title: 'Glukoza 20%: ',
                            descript: man.glucose20,
                          ),
                          OneRow(
                            title: 'Hydrokortyzon: ',
                            descript: man.hydrokortyzon,
                          ),
                          OneRow(
                            title: 'Ibuprofen: ',
                            descript: man.ibuprofen,
                          ),
                          OneRow(
                            title: 'Magnez 20%: ',
                            descript: man.magnez,
                          ),
                          OneRow(
                            title: 'Midazolam: ',
                            descript: man.midazolam,
                          ),
                          OneRow(
                            title: 'Morfina: ',
                            descript: man.morfina,
                          ),
                          OneRow(
                            title: 'Natrium Bicarbonicum: ',
                            descript: man.natriumBicarbonicum,
                          ),
                          OneRow(
                            title: 'Nalokson: ',
                            descript: man.nalokson,
                          ),
                          OneRow(
                            title: 'Paracetamol p.r.: ',
                            descript: man.paracetamolCzopek,
                          ),
                          OneRow(
                            title: 'Paracetamol i.v.: ',
                            descript: man.paracetamolWlew,
                          ),
                          OneRow(
                            title: 'Płyn wieloelektrolitowy: ',
                            descript: man.plyn,
                          ),
                          OneRow(
                            title: 'Salbutamol: ',
                            descript: man.salbutamol,
                          ),
                          const OneRowPaint(
                            title: '',
                            descript: '',
                          ),
                          const OneRowPaint(
                            title: '',
                            descript: '',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  var pickerData = '''
[
    [
        "${StringsManager.noData.tr()}",
        "${StringsManager.newborn.tr()}",
        "${StringsManager.month1.tr()}",
        "${StringsManager.month2.tr()}",
        "${StringsManager.month3.tr()}",
        "${StringsManager.month4.tr()},
        "${StringsManager.month5.tr()},
        "${StringsManager.month6.tr()},
        "${StringsManager.month7.tr()},
        "${StringsManager.month8.tr()},
        "${StringsManager.month9.tr()},
        "${StringsManager.month10.tr()}",
        "${StringsManager.month11.tr()}",
        "${StringsManager.month12.tr()}",
        "${StringsManager.month18.tr()}",
        "${StringsManager.year2.tr()}",
        "${StringsManager.year3.tr()}",
        "${StringsManager.year4.tr()}",
        "${StringsManager.year5.tr()}",
        "${StringsManager.year6.tr()}",
        "${StringsManager.year7.tr()}",
        "${StringsManager.year8.tr()}",
        "${StringsManager.year9.tr()}",
        "${StringsManager.year10.tr()}",
        "${StringsManager.year11.tr()}",
        "${StringsManager.year12.tr()}",
    ],
    [
        "${StringsManager.noData.tr()}",
        "2 kg",
        "3 kg",
        "4 kg",
        "5 kg",
        "6 kg",
        "7 kg",
        "8 kg",
        "9 kg",
        "10 kg",
        "11 kg",
        "12 kg",
        "13 kg",
        "14 kg",
        "15 kg",
        "16 kg",
        "17 kg",
        "18 kg",
        "19 kg",
        "20 kg",
        "21 kg",
        "22 kg",
        "23 kg",
        "24 kg",
        "25 kg",
        "26 kg",
        "27 kg",
        "28 kg",
        "29 kg",
        "30 kg",
        "31 kg",
        "32 kg",
        "33 kg",
        "34 kg",
        "35 kg",
        "36 kg",
        "38 kg",
        "39 kg",
        "40 kg"
    ]
]
    ''';
  void showPickerNumber(BuildContext context, WidgetRef ref) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: const JsonDecoder().convert(pickerData), isArray: true),
        hideHeader: true,
        changeToFirst: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Wybierz wiek i/lub wagę pacjenta"),
        cancelText: 'Anuluj',
        confirmText: 'Zatwierdź',
        onConfirm: (Picker picker, List value) {
          final weight = picker.getSelectedValues()[1].toString();
          final age = picker.getSelectedValues()[0].toString();

          ref.read(manProvider.notifier).showPatient(age, weight);
        }).showDialog(context);
  }
}
