class SentAna {
  final String? emotios;
  SentAna({this.emotios});

  factory SentAna.fromJson(Map<String, dynamic> json) {
    return SentAna(emotios: json['emotions_detected'][0]);
  }
}
