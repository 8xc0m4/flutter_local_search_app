import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_search_app/data/model/search.dart';

class SearchRepository {
  Future<List<Search>?> getAll() async {
    try {
      final firestore = FirebaseFirestore.instance;
      //
      final CollectionRef = firestore.collection('search');
      //
      final result = await CollectionRef.get();

      final docs = result.docs;
      return docs.map((doc) {
        final map = doc.data();
        final newMap = {
          'id': doc.id,
          ...map,
        };
        return Search.fromJson(newMap);
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
    //
  }

  Future<bool> insert({
    required String title,
    required String content,
    required String writer,
    required String imageUrl,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('search');
      final docRef = collectionRef.doc();

      await docRef.set({
        'title': title,
        'content': content,
        'writer': writer,
        'imageUrl': imageUrl,
        'createdAt': DateTime.now().toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> delete(String id) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('search');
      final docRef = collectionRef.doc(id);
      await docRef.delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void update({
    required id,
    required String title,
    required String content,
    required String writer,
    required imageUrl,
  }) {}
}
