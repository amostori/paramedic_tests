class DrugModel {
  final String drugName;
  final String drugDose;

  const DrugModel({
    required this.drugName,
    required this.drugDose,
  });

  DrugModel copyWith({
    String? drugName,
    String? drugDose,
  }) {
    return DrugModel(
      drugName: drugName ?? this.drugName,
      drugDose: drugDose ?? this.drugDose,
    );
  }
}
