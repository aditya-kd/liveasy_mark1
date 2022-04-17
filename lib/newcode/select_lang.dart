
import 'package:flutter/material.dart';

import 'enter_phone.dart';
import 'uitheme.dart';
String currVal = 'English';
class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please select your language',
              style: myHeadlineStyle,
            ),
            Text(
              'You can change it later',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(left:100, right: 100, top: 20, bottom: 20),
              child: Center(
        child: DecoratedBox(
        decoration: BoxDecoration(
        border: Border.all(color:Colors.black),),
        child: Padding(padding:const EdgeInsets.only(
        left:30, right: 30),
        child: MyDropDown())))),

              
              
            
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, ),
              child: ElevatedButton(
                
                style: myBtnStyle,
                child: const Text('NEXT'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const EnterPhone()));
                  print('Button Pressed');
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(currVal + " selected")));
                },
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key}) : super(key: key);
  @override
  _MyDropState createState() => _MyDropState();
}

class _MyDropState extends State<MyDropDown> {
  String dropValue = 'English';
  final List<DropdownMenuItem<String>>? items = <String>[
    'English',
    'Hindi',
    'German'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      
      items: items,
      value: currVal,
      isExpanded: true,
      underline:Container(),
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      onChanged: (String? newVal) {
        setState(() {
          currVal = newVal!;
        });
      },
      style: const TextStyle(color: Colors.black54, fontSize: 16),
  
    );
  }
}
