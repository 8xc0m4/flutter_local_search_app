import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_search_app/data/model/search.dart';

class SearchRepository {
  Future<List<Search>> getAll() async {
    //
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
  }
}
