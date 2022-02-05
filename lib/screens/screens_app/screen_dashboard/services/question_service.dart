import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionService {
  QuestionService._private();

  static final QuestionService _instance = QuestionService._private();
  factory QuestionService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getQuestion() async {
    var querySnapshot = await _firestore.collection("question").get();
    var questionModel = querySnapshot.docs;

    return questionModel[0].data()['question'];
  }
}
