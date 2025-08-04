import 'package:flutter/widgets.dart';
import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/data/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WriteState {
  bool isWriting;
  WriteState(this.isWriting);
}

class WriteViewModel extends AutoDisposeFamilyNotifier<WriteState, Search?> {
  @override
  WriteState build(Search? arg) {
    return WriteState(false);
  }

  Future<bool> insert({
    required String writer,
    required String title,
    required String content,
  }) async {
    final searchRepository = SearchRepository();

    state = WriteState(true);

    if (arg == null) {
      final result = await searchRepository.insert(
        title: title,
        content: content,
        writer: writer,
        imageUrl: 'https://picsum.photos/200',
      );
      state = WriteState(false);
      return result;
    } else {
      final result = await searchRepository.update(
        id: arg!.id,
        title: title,
        content: content,
        writer: writer,
        imageUrl: 'https://picsum.photos/200',
      );
      return result;
    }
  }
}
