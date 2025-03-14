class CheckAnswersInputModel {
  List<AnswersInputModel>? answers;
  int? time;

  CheckAnswersInputModel({this.answers, this.time});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['time'] = time;
    return data;
  }
}

class AnswersInputModel {
  String? questionId;
  String? correct;

  AnswersInputModel({this.questionId, this.correct});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionId'] = questionId;
    data['correct'] = correct;
    return data;
  }
}
