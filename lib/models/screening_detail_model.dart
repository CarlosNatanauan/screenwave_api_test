// screening_detail_model.dart
class ScreeningDetail {
  final int totalAttend;
  final int totalTarget;
  final String text;
  final String status;

  ScreeningDetail({
    required this.totalAttend,
    required this.totalTarget,
    required this.text,
    required this.status,
  });

  factory ScreeningDetail.fromJson(Map<String, dynamic> json) {
    return ScreeningDetail(
      totalAttend: json['total_attend'],
      totalTarget: json['total_target'],
      text: json['text'],
      status: json['status'],
    );
  }
}
