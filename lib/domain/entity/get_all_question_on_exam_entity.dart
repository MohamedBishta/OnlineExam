class GetAllQuestionOnExamEntity {
  String? message;
  List<QuestionsEntity>? questions;

  GetAllQuestionOnExamEntity({this.message, this.questions});

  GetAllQuestionOnExamEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['questions'] != null) {
      questions = <QuestionsEntity>[];
      json['questions'].forEach((v) {
        questions!.add(QuestionsEntity.fromJson(v));
      });
    }
  }
}

class QuestionsEntity {
  List<AnswersEntity>? answers;
  String? type;
  String? sId;
  String? question;
  String? correct;
  ExamEntity? exam;

  QuestionsEntity({
    this.answers,
    this.type,
    this.sId,
    this.question,
    this.correct,
    this.exam,
  });

  QuestionsEntity.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <AnswersEntity>[];
      json['answers'].forEach((v) {
        answers!.add(AnswersEntity.fromJson(v));
      });
    }
    type = json['type'];
    sId = json['_id'];
    question = json['question'];
    correct = json['correct'];
    exam = json['exam'] != null ? ExamEntity.fromJson(json['exam']) : null;
  }
}

class AnswersEntity {
  String? answer;
  String? key;

  AnswersEntity({this.answer, this.key});

  AnswersEntity.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    key = json['key'];
  }
}

class ExamEntity {
  int? duration;
  int? numberOfQuestions;

  ExamEntity({
    this.duration,
    this.numberOfQuestions,
  });

  ExamEntity.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    numberOfQuestions = json['numberOfQuestions'];
  }
}
