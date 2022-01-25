class QuestionModel {
  String question = "";
  QuestionModel({
    required this.question,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] ?? '',
    );
  }

  @override
  String toString() => 'QuestionModel(question: $question)';
}
