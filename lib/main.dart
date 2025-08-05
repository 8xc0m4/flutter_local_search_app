import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/repository/search_repository.dart';
import 'package:flutter_local_search_app/firebase_options.dart';
import 'package:flutter_local_search_app/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final searchRepo = SearchRepository();
  searchRepo.insert(
    title: 'title',
    content: 'content',
    write: 'write',
    imageUrl: 'https://picsum.photos/200/300',
  );
  // print((await repo.getAll()).length);

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
