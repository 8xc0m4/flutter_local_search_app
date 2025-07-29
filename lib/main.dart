import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:convert';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//---------json을 알아보자
// class Asd {
//   String title, authors;
//   int price, pages;

//   Asd({
//     required this.title,
//     required this.authors,
//     required this.price,
//     required this.pages,
//   });

//   Asd.fromJson(Map<String, dynamic> json)
//     : title = json['title'],
//       authors = json['authors'],
//       price = json['price'],
//       pages = json['pages'];

//   Map<String, dynamic> toJson() => {
//     'title': title,
//     'authors': authors,
//     'price': price,
//     'pages': pages,

//   };
// }

// void main() {
//   String jsonString = '''
//   {
//      "title": "Flutter 완벽(할까?) 가이드",
//     "authors": 35000,
//     "price": "이샘",
//         "김영민",
//         "김영호",
//         "동세진",
//         "문현선",
//         "오재욱",
//         "윤한조",
//         "이상록",
//         "이영상",
//         "임기환",
//         "임우형",
//         "임초희",
//         "정소희",
//         "조민우"
//     "pages": 520
//   }
//   ''';

//   Map<String, dynamic> map = jsonDecode(jsonString);
//   Asd asd = Asd.fromJson(map);
//   print(asd.toJson());

// }

// void main() {
//   String jsonString = '''
//   {
//     "name": "훈훈하니컴퍼니코리아",
//     "employeeCount": 150,
//     "address": {
//       "street": "테헤란로 123",
//       "city": "서울시 강남구",
//       "zipCode": "06234"
//     },
//     "departments": [
//       "대표팀O",
//       "개발팀",
//       "디자인팀",
//       "마케팅팀",
//       "영업팀"
//     ]
//   }
//   ''';

//   Map<String, dynamic> data = jsonDecode(jsonString);

//   String name = data['name'];
//   int employeeCount = data['employeeCount'];
//   String street = data['address']['street'];
//   String city = data['address']['city'];
//   String zipCode = data['address']['zipCode'];

//   List<String> departments = List<String>.from(data['departments']);

//   print('회사명: $name');
//   print('직원 수: ${employeeCount}명');
//   print('주소: $city $street ($zipCode)');
//   print('부서: ${departments.join(', ')}');
// }
// class company {
//   String name;
//   int employeeCount;
//   Address address;
  
// }

// class Address{

// }
// 회사명: 훈훈하니컴퍼니코리아
// 직원 수: 150명
// 주소: 서울시 강남구 테헤란로 123 (06234)
// 부서: 대표팀, 개발팀, 디자인팀, 마케팅팀, 영업팀


// 중괄호 열리고 어떤 클래스를 넣을 수 있을지 어떤 배열을 할 수 있을지 확인