class QuestionModel {
  String question = "";
  QuestionModel({required this.question});

  Map<String, dynamic> toMap() => {'question': question};

  factory QuestionModel.fromMap(Map<String, dynamic> map) =>
      QuestionModel(question: map['question'] ?? '');

  @override
  String toString() => 'QuestionModel(question: $question)';
}
