import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_picker/picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/presentation/widgets/one_row.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/presentation/widgets/one_row_paint.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/providers/man_provider.dart';

import '../utils/my_painter.dart';

class DrawingScreen extends ConsumerStatefulWidget {
  const DrawingScreen({super.key});

  @override
  ConsumerState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends ConsumerState<DrawingScreen> {
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
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
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
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                const OneRowPaint(
                                  title: 'AVPU:',
                                  descript: '',
                                ),
                                OneRowPaint(
                                  title: 'Częstość oddechu: ',
                                  descript: man.breathingRate,
                                ),
                                const OneRowPaint(
                                  title: 'Saturacja: ',
                                  descript: '',
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
        "Brak danych",
        "Noworodek",
        "1 m.ż.",
        "2 m.ż.",
        "3 m.ż.",
        "4 m.ż.",
        "5 m.ż.",
        "6 m.ż.",
        "7 m.ż.",
        "8 m.ż.",
        "9 m.ż.",
        "10 m.ż.",
        "11 m.ż.",
        "12 m.ż.",
        "18 m.ż.",
        "2 r.ż.",
        "3 r.ż.",
        "4 r.ż.",
        "5 r.ż.",
        "6 r.ż.",
        "7 r.ż.",
        "8 r.ż.",
        "9 r.ż.",
        "10 r.ż.",
        "11 r.ż.",
        "12 r.ż."
    ],
    [
        "Brak danych",
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        textStyle: const TextStyle(color: Colors.white),
        title: const Text("Wybierz wiek i/lub wagę pacjenta"),
        cancelText: 'Anuluj',
        confirmText: 'Zatwierdź',
        onConfirm: (Picker picker, List value) {
          final age = picker.getSelectedValues()[0].toString();
          final weight = picker.getSelectedValues()[1].toString();
          ref.read(manProvider.notifier).showPatient(age, weight);
        }).showDialog(context);
  }
}
