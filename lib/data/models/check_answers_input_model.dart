class CheckAnswersInputModel {
  List<AnswersInputModel>? answers;
  int? time;

  CheckAnswersInputModel({this.answers, this.time});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['time'] = time;
    return data;
  }

  // Create object from a map
  factory CheckAnswersInputModel.fromJson(Map<String, dynamic> json) {
    return CheckAnswersInputModel(
      answers: json['answers'] != null
          ? (json['answers'] as List)
              .map((v) => AnswersInputModel.fromJson(v))
              .toList()
          : null,
      time: json['time'],
    );
  }
}

class AnswersInputModel {
  String? questionId;
  String? correct;

  AnswersInputModel({this.questionId, this.correct});

  // Convert object to a map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionId'] = questionId;
    data['correct'] = correct;
    return data;
  }

  // Create object from a map
  factory AnswersInputModel.fromJson(Map<String, dynamic> json) {
    return AnswersInputModel(
      questionId: json['questionId'],
      correct: json['correct'],
    );
  }
}
