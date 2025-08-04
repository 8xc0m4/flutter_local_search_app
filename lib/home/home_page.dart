import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/detail/detail_page.dart';
import 'package:flutter_local_search_app/home/home_view_model.dart';
import 'package:flutter_local_search_app/write/write_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  //appbar 검색창
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: TextField(),
        ),
        //Write_page로 이동 버튼
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WritePage();
                },
              ),
            );
          },
          child: Icon(Icons.edit),
        ),
        //바디 영역
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '글자가 잘 나오네',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final searchs = ref.watch(homeViewModelProvider);
                  return Expanded(
                    child: ListView.separated(
                      itemCount: searchs.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final search = searchs[index];
                        return item(search);
                      },
                    ),
                  );
                },
              ),

              //게시물 리스트
            ],
          ),
        ),
      ),
    );
  }

  // 게시물 박스
  Widget item(Search search) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailPage(search);
                },
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 120,
            child: Stack(
              children: [
                //
                Positioned(
                  right: 0,
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      search.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(right: 100),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        search.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text(
                        search.content,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        search.createdAt.toIso8601String(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
