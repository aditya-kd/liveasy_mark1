import 'package:flutter/material.dart';
enum SingingCharacter { lafayette , jefferson }
class LastPage extends StatefulWidget {
  final String title;

  const LastPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
   

 
SingingCharacter? _character = SingingCharacter.lafayette; 
  final middle= Container(child:Center(child:Icon(Icons.local_shipping_outlined)));
final right= Container(child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children:[
  Text("Transporter", style: TextStyle(fontSize: 23)),
  Text("Random text to chek if it ", style: TextStyle(fontSize:15))
]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Please select your profile.", style: myHeadlineStyle),),
           Padding(
               padding: const EdgeInsets.all(8.0),
               child:Container(
             width: 300,
             decoration:BoxDecoration(
             border: Border.all()),
             child:Row(
             mainAxisAlignment: MainAxisAlignment.start,
           children:[
             Padding(padding: const EdgeInsets.all(1.0),child: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
               activeColor: Colors.blue[900],
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),),
             Padding(padding: const EdgeInsets.all(8.0),child:Container(child:Center(child:Icon(Icons.house)))),
             Padding(padding: const EdgeInsets.all(8.0),child:Container(child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
children:[
  Text("Shipper", style: TextStyle(fontSize: 25)),
  Text("Lorem ipsum dolor sit amet, ", style: TextStyle(fontSize:15))]
)))
           ]))),
           Padding(
               padding: const EdgeInsets.all(8.0),
               child:Container(
             width: 300,
             decoration:BoxDecoration(
             border: Border.all()),
             child:Row(
             mainAxisAlignment: MainAxisAlignment.start,
           children:[
             Padding(padding: const EdgeInsets.all(1.0),child: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),),
             Padding(padding: const EdgeInsets.all(8.0),child:middle),
             Padding(padding: const EdgeInsets.all(8.0),child:right)
           ]))),
            //Button
            ElevatedButton(
                style: myBtnStyle,
                onPressed: (){print("Continued with $_character");},
            child: const Text("CONTINUE"),            
            )
            ,ElevatedButton(
          child: const Text('Signout'),
          onPressed: () {
            AuthService().signOut(context);
          },
        )
          ],
        ),
      ),
    );
  }
}