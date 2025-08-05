import 'dart:async';

import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/data/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<List<Search>> {
  HomeViewModel();

  @override
  List<Search> build() {
    getAllSearch();
    return [];
  }

  void getAllSearch() async {
    final searchRepo = SearchRepository();
    // final searchs = await searchRepo.getAll();
    // state = searchs ?? [];
    final stream = searchRepo.searchListStream();
    final streamSubscription = stream.listen((searchs) {
      state = searchs;
    });
    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Search>>(() {
  return HomeViewModel();
});
