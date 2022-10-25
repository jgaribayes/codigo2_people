
import 'package:codigo2_people/cards_page.dart';
import 'package:codigo2_people/home_page.dart';
import 'package:codigo2_people/item_person_widget.dart';
import 'package:codigo2_people/people_page.dart';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PeopleApp",
      debugShowCheckedModeBanner: false,
      home: CardPage(),
    );
  }
}







