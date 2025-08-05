import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/search.dart';
import 'package:flutter_local_search_app/write/write_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WritePage extends ConsumerStatefulWidget {
  WritePage(this.search);
  Search? search;
  @override
  ConsumerState<WritePage> createState() => _WritePageState();
}

class _WritePageState extends ConsumerState<WritePage> {
  //제목, 작성자, 내용
  late TextEditingController writeController = TextEditingController(
    text: widget.search?.write ?? '',
  );
  late TextEditingController titleController = TextEditingController(
    text: widget.search?.title ?? '',
  );
  late TextEditingController contentController = TextEditingController(
    text: widget.search?.content ?? '',
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    writeController.dispose();
    titleController.dispose();
    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final writeState = ref.watch(writeViewModelProvider(widget.search));
    if (writeState.isWriting) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () async {
                final result = formKey.currentState?.validate() ?? false; //
                if (result) {
                  final vm = ref.read(
                    writeViewModelProvider(widget.search).notifier,
                  );
                  final insertResult = await vm.insert(
                    writer: writeController.text,
                    title: titleController.text,
                    content: contentController.text,
                  );
                  if (insertResult) {
                    Navigator.pop(context);
                  }
                }
              },

              //완료버튼
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  '완료',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              //1번 째 줄 -작성자
              TextFormField(
                controller: writeController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: '작성자'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return '작성자를 입력해 주세요';
                  }
                  //유효성 검사 성공
                  return null;
                },
              ),
              //2번 째 줄 - 제목
              TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: '제목'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return '제목를 입력해 주세요';
                  }
                  //유효성 검사 성공
                  return null;
                },
              ),
              //3번 째 줄 - 내용, textformfield를 sizedbox로 감싸줌 + expands
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: contentController,
                  maxLines: null, // 반드시 null로 해야한다
                  expands: true, // 디폴트 늘어남
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(hintText: '내용'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return '내용를 입력해 주세요';
                    }
                    //유효성 검사 성공
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //사진 버튼
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Icon(Icons.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
