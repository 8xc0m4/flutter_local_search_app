import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/detail/detail_view_model.dart';
import 'package:flutter_local_search_app/write/write_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  DetailPage(this.search);

  Search search;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(search));

    return Scaffold(
      appBar: AppBar(
        actions: [
          //지우기버튼
          iconButton(Icons.delete, () async {
            print('1');
            final vm = ref.read(detailViewModelProvider(search).notifier);
            final result = await vm.deleteSearch();
            if (result) {
              Navigator.pop(context);
            }
          }),
          //write 바로가기
          iconButton(Icons.edit, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WritePage();
                },
              ),
            );
          }),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 500), // 길어짐
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.network(
              state.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 14),
                Text(
                  state.write,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  state.createdAt.toIso8601String(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 14),
                Text(
                  state.content,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Icon(icon),
      ),
    );
  }
}
