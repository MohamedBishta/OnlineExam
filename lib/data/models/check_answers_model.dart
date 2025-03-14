class CheckAnswersModel {
  String? message;
  int? correct;
  int? wrong;
  String? total;
  List<WrongQuestions>? wrongQuestions;
  List<CorrectQuestions>? correctQuestions;

  CheckAnswersModel(
      {this.message,
      this.correct,
      this.wrong,
      this.total,
      this.wrongQuestions,
      this.correctQuestions});

  CheckAnswersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    correct = json['correct'];
    wrong = json['wrong'];
    total = json['total'];
    if (json['WrongQuestions'] != null) {
      wrongQuestions = <WrongQuestions>[];
      json['WrongQuestions'].forEach((v) {
        wrongQuestions!.add(WrongQuestions.fromJson(v));
      });
    }
    if (json['correctQuestions'] != null) {
      correctQuestions = <CorrectQuestions>[];
      json['correctQuestions'].forEach((v) {
        correctQuestions!.add(CorrectQuestions.fromJson(v));
      });
    }
  }
}

class WrongQuestions {
  String? qID;
  String? question;
  String? inCorrectAnswer;
  String? correctAnswer;

  WrongQuestions({
    this.qID,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
  });

  WrongQuestions.fromJson(Map<String, dynamic> json) {
    qID = json['QID'];
    question = json['Question'];
    inCorrectAnswer = json['inCorrectAnswer'];
    correctAnswer = json['correctAnswer'];
  }
}

class CorrectQuestions {
  String? qID;
  String? question;
  String? correctAnswer;

  CorrectQuestions({
    this.qID,
    this.question,
    this.correctAnswer,
  });

  CorrectQuestions.fromJson(Map<String, dynamic> json) {
    qID = json['QID'];
    question = json['Question'];
    correctAnswer = json['correctAnswer'];
  }
}
