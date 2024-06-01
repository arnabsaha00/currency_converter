import 'package:currency_conver/screens/Home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
   title: 'Currency Converter',
   theme: ThemeData(
     primarySwatch: Colors.pink,

   ),
   debugShowCheckedModeBanner: false,
   home: Home(),
 );
  }

}