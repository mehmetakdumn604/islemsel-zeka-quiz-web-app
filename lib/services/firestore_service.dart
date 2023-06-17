import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class DataService {
  static DataService _instance = DataService._init();

  static DataService get instance => _instance;
  DataService._init();

  Future<List> getQuestions() async {
    final QuerySnapshot questionsMap = await _db.collection('questions').get();
    return questionsMap.docs.map((e) => e.data()).toList();
  }
}
