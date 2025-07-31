import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/write/write_page.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //
          iconButton(Icons.delete, () {
            print('1');
          }),
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
        padding: EdgeInsets.only(bottom: 500),
        children: [
          Image.asset(
            'assets/images/henesys.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'henesys',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 14),
                Text(
                  '로키키',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '2025.07.30',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 14),
                Text(
                  '멋진 궁수가 되겠습니다.' * 10,
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
