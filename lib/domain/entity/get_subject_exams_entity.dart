class GetSubjectExams {
  String? message;
  Metadata? metadata;
  List<Exams>? exams;

  GetSubjectExams({this.message, this.metadata, this.exams});

  GetSubjectExams.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['exams'] != null) {
      exams = <Exams>[];
      json['exams'].forEach((v) {
        exams!.add(new Exams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.exams != null) {
      data['exams'] = this.exams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['numberOfPages'] = this.numberOfPages;
    data['limit'] = this.limit;
    return data;
  }
}

class Exams {
  String? sId;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  Exams(
      {this.sId,
      this.title,
      this.duration,
      this.subject,
      this.numberOfQuestions,
      this.active,
      this.createdAt});

  Exams.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['subject'] = this.subject;
    data['numberOfQuestions'] = this.numberOfQuestions;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return 'Exams(sId: $sId, title: $title, duration: $duration, subject: $subject,numberOfQuestions:$numberOfQuestions )';
  }
}
