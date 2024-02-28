class ManModel {
  final String patient;
  final String title;
  final String descript;

  const ManModel({
    required this.patient,
    required this.title,
    required this.descript,
  });

  ManModel copyWith({
    String? title,
    String? descript,
    String? patient,
  }) {
    return ManModel(
      patient: patient ?? this.patient,
      title: title ?? this.title,
      descript: descript ?? this.descript,
    );
  }
}
