import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String text) async {
    await _db.add({'text': text});
  }

  Stream<QuerySnapshot> getNotes() {
    return _db.snapshots();
  }

  Future<void> deleteNote(String id) async {
    await _db.doc(id).delete();
  }
}
