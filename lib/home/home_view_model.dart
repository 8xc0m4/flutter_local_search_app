import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/data/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<List<Search>> {
  @override
  List<Search> build() {
    getAllSearch();
    return [];
  }

  void getAllSearch() async {
    final searchRepo = SearchRepository();
    final searchs = await searchRepo.getAll();
    state = searchs ?? [];
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Search>>(() {
  return HomeViewModel();
});
