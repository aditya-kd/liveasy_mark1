import 'package:flutter/material.dart';
import 'package:liveasy_mark1/newcode/authservice.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Signout'),
          onPressed: () {
            AuthService().signOut(context);
          },
        )
      )
    );
  }
}