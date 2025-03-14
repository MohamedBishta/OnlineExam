class GetAllQuestionOnExamModel {
  String? message;
  List<Questions>? questions;

  GetAllQuestionOnExamModel({this.message, this.questions});

  GetAllQuestionOnExamModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  List<Answers>? answers;
  String? type;
  String? sId;
  String? question;
  String? correct;
  Subject? subject;
  Exam? exam;
  String? createdAt;

  Questions(
      {this.answers,
      this.type,
      this.sId,
      this.question,
      this.correct,
      this.subject,
      this.exam,
      this.createdAt});

  Questions.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
    type = json['type'];
    sId = json['_id'];
    question = json['question'];
    correct = json['correct'];
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    exam = json['exam'] != null ? Exam.fromJson(json['exam']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['_id'] = sId;
    data['question'] = question;
    data['correct'] = correct;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    if (exam != null) {
      data['exam'] = exam!.toJson();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}

class Answers {
  String? answer;
  String? key;

  Answers({this.answer, this.key});

  Answers.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer'] = answer;
    data['key'] = key;
    return data;
  }
}

class Subject {
  String? sId;
  String? name;
  String? icon;
  String? createdAt;

  Subject({this.sId, this.name, this.icon, this.createdAt});

  Subject.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['icon'] = icon;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Exam {
  String? sId;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  Exam(
      {this.sId,
      this.title,
      this.duration,
      this.subject,
      this.numberOfQuestions,
      this.active,
      this.createdAt});

  Exam.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['duration'] = duration;
    data['subject'] = subject;
    data['numberOfQuestions'] = numberOfQuestions;
    data['active'] = active;
    data['createdAt'] = createdAt;
    return data;
  }
}
