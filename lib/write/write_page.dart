import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  //제목, 작성자, 내용
  TextEditingController writeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                final result = formKey.currentState?.validate() ?? false; //
              },
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
