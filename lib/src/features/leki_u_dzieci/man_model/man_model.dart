class ManModel {
  final String age;
  final int weight;
  final String breathingRate;
  final String pulseRate;
  final String bloodPressure;
  final String glucoseLevel;
  final String ambuMask;
  final String tube;
  final String laryngoscope;
  final String laryngMask;
  final String defibrillation;
  final String cardioversion;
  final String adenosine;
  final String adrenalin;
  final String adrenalinAnafilaksja;
  final String adrenalinWlew;
  final String amiodaron;
  final String atropina;
  final String clonazepam;
  final String deksametazon;
  final String diazepam;
  final String diazepamPr;
  final String fentanyl;
  final String furosemid;
  final String glukagon;
  final String glucose20;
  final String hydrokortyzon;
  final String ibuprofen;
  final String magnez;
  final String midazolam;
  final String morfina;
  final String natriumBicarbonicum;
  final String nalokson;
  final String paracetamolCzopek;
  final String paracetamolWlew;
  final String plyn;
  final String salbutamol;

  const ManModel({
    required this.age,
    required this.weight,
    required this.breathingRate,
    required this.pulseRate,
    required this.bloodPressure,
    required this.glucoseLevel,
    required this.ambuMask,
    required this.tube,
    required this.laryngoscope,
    required this.laryngMask,
    required this.defibrillation,
    required this.cardioversion,
    required this.adenosine,
    required this.adrenalin,
    required this.adrenalinAnafilaksja,
    required this.adrenalinWlew,
    required this.amiodaron,
    required this.atropina,
    required this.clonazepam,
    required this.deksametazon,
    required this.diazepam,
    required this.diazepamPr,
    required this.fentanyl,
    required this.furosemid,
    required this.glukagon,
    required this.glucose20,
    required this.hydrokortyzon,
    required this.ibuprofen,
    required this.magnez,
    required this.midazolam,
    required this.morfina,
    required this.natriumBicarbonicum,
    required this.nalokson,
    required this.paracetamolCzopek,
    required this.paracetamolWlew,
    required this.plyn,
    required this.salbutamol,
  });

  ManModel copyWith({
    bool? isAgeSet,
    bool? isWeightSet,
    String? age,
    int? weight,
    String? breathingRate,
    String? pulseRate,
    String? bloodPressure,
    String? glucoseLevel,
    String? ambuMask,
    String? tube,
    String? laryngoscope,
    String? laryngMask,
    String? defibrillation,
    String? cardioversion,
    String? adenosine,
    String? adrenalin,
    String? adrenalinAnafilaksja,
    String? adrenalinWlew,
    String? amiodaron,
    String? atropina,
    String? clonazepam,
    String? deksametazon,
    String? diazepam,
    String? diazepamPr,
    String? fentanyl,
    String? furosemid,
    String? glukagon,
    String? glucose20,
    String? hydrokortyzon,
    String? ibuprofen,
    String? magnez,
    String? midazolam,
    String? morfina,
    String? natriumBicarbonicum,
    String? nalokson,
    String? paracetamolCzopek,
    String? paracetamolWlew,
    String? plyn,
    String? salbutamol,
  }) {
    return ManModel(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      breathingRate: breathingRate ?? this.breathingRate,
      pulseRate: pulseRate ?? this.pulseRate,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      glucoseLevel: glucoseLevel ?? this.glucoseLevel,
      ambuMask: ambuMask ?? this.ambuMask,
      tube: tube ?? this.tube,
      laryngoscope: laryngoscope ?? this.laryngoscope,
      laryngMask: laryngMask ?? this.laryngMask,
      defibrillation: defibrillation ?? this.defibrillation,
      cardioversion: cardioversion ?? this.cardioversion,
      adenosine: adenosine ?? this.adenosine,
      adrenalin: adrenalin ?? this.adrenalin,
      adrenalinAnafilaksja: adrenalinAnafilaksja ?? this.adrenalinAnafilaksja,
      adrenalinWlew: adrenalinWlew ?? this.adrenalinWlew,
      amiodaron: amiodaron ?? this.amiodaron,
      atropina: atropina ?? this.atropina,
      clonazepam: clonazepam ?? this.clonazepam,
      deksametazon: deksametazon ?? this.deksametazon,
      diazepam: diazepam ?? this.diazepam,
      diazepamPr: diazepamPr ?? this.diazepamPr,
      fentanyl: fentanyl ?? this.fentanyl,
      furosemid: furosemid ?? this.furosemid,
      glukagon: glukagon ?? this.glukagon,
      glucose20: glucose20 ?? this.glucose20,
      hydrokortyzon: hydrokortyzon ?? this.hydrokortyzon,
      ibuprofen: ibuprofen ?? this.ibuprofen,
      magnez: magnez ?? this.magnez,
      midazolam: midazolam ?? this.midazolam,
      morfina: morfina ?? this.morfina,
      natriumBicarbonicum: natriumBicarbonicum ?? this.natriumBicarbonicum,
      nalokson: nalokson ?? this.nalokson,
      paracetamolCzopek: paracetamolCzopek ?? this.paracetamolCzopek,
      paracetamolWlew: paracetamolWlew ?? this.paracetamolWlew,
      plyn: plyn ?? this.plyn,
      salbutamol: salbutamol ?? this.salbutamol,
    );
  }
}
