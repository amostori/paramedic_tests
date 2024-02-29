class MaskModel {
  final String age;
  final String maskNr;

  const MaskModel({
    required this.age,
    required this.maskNr,
  });

  MaskModel copyWith({
    String? age,
    String? maskNr,
  }) {
    return MaskModel(
      age: age ?? this.age,
      maskNr: maskNr ?? this.maskNr,
    );
  }
}
