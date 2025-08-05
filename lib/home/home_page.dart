import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/detail/detail_page.dart';
import 'package:flutter_local_search_app/home/home_view_model.dart';
import 'package:flutter_local_search_app/write/write_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // 검색창 텍스트 컨트롤러
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // 메모리 누수 방지 위해 컨트롤러 해제
    _searchController.dispose();
    super.dispose();
  }

  // 검색어 입력 후 엔터 누르면 호출되는 콜백
  void _onSearchSubmitted(String query) {
    // TODO: 네이버 지역 검색 API 연동 및 ViewModel에 검색어 전달
    print('검색어 입력됨: $query');
    // 예시) ref.read(homeViewModelProvider.notifier).search(query);
  }

  @override
  Widget build(BuildContext context) {
    // Riverpod으로 HomeViewModel 상태(검색 결과 리스트) 구독
    final searchs = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: TextField(
          controller: _searchController, // 검색어 입력 컨트롤러 연결
          decoration: InputDecoration(
            hintText: '검색어를 입력하세요',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.search,
          onSubmitted: _onSearchSubmitted, // 엔터 입력시 호출
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 작성 페이지로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WritePage(null)),
          );
        },
        child: Icon(Icons.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: searchs.isEmpty
            ? Center(child: Text('검색 결과가 없습니다.'))
            : ListView.separated(
                itemCount: searchs.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final search = searchs[index];
                  return _item(search);
                },
              ),
      ),
    );
  }

  // 게시물 아이템 위젯
  Widget _item(Search search) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            // 상세 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(search)),
            );
          },
          child: Container(
            width: double.infinity,
            height: 120,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
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
