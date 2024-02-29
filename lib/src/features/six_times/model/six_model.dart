class SixModel {
  SixModel(
      {required this.mainNr, required this.multiplyNr, required this.nuller});
  final int mainNr;
  final int multiplyNr;
  final String nuller;

  SixModel copyWith({
    int? mainNr,
    int? multiplyNr,
    String? nuller,
  }) {
    return SixModel(
      mainNr: mainNr ?? this.mainNr,
      multiplyNr: multiplyNr ?? this.multiplyNr,
      nuller: nuller ?? this.nuller,
    );
  }
}
