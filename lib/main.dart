import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'newcode/authservice.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(  MyApp());
}

class MyApp extends StatelessWidget{
  MyApp ({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Liveasy Mark-1",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  AuthService().handleAuth(),
    );
  }
}