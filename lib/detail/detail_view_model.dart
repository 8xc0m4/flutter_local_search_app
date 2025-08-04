import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/data/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewModel extends AutoDisposeFamilyNotifier<Search, Search> {
  @override
  Search build(Search arg) {
    return arg;
  }

  Future<bool> deleteSearch() async {
    final searchRepository = SearchRepository();
    return await searchRepository.delete(arg.id);
  }
}

final detailViewModelProvider = NotifierProvider.autoDispose
    .family<DetailViewModel, Search, Search>(
      () {
        return DetailViewModel();
      },
    );
