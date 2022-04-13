import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_mark1/newcode/authservice.dart';
import 'uitheme.dart';

String? currNum='';
class Verify extends StatefulWidget{
  Verify(String? newNum, {Key? key}) : super(key: key)
  {
    currNum= newNum;
  }
  @override
  _VerifyState createState()=> _VerifyState();
}

class _VerifyState extends State<Verify>{
  String phoneNo='',verificationId='', smsCode='';
  bool codeSent=false;
  TextEditingController otpController = TextEditingController();
@override
void initState(){
  super.initState();
  verifyPhone(currNum);
}
final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  
@override
Widget build(BuildContext context)
{
  return Scaffold(
    body: Center(
      
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Verify Phone',
                style: myHeadlineStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0, bottom: 16.0),
              child: Text(
                "Code is sent to $currNum",
                style: mySubHeadingStyle,
              ),
            ),
            Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_fieldOne, true),
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false),
              OtpInput(_fieldFive, false),
              OtpInput(_fieldSix, false)
            ],
          )]),
            // TextField(
            //   controller: otpController,
            //   onChanged:(val){
            //     setState(() {
            //       smsCode = val;
            //     });
            //   }
            //  ,
            // ), 
            const Text("Didn't recieve the code? Request Again",
            ),

            Center(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: myBtnStyle,
                child: const Text('VERIFY AND CONTINUE'),
                onPressed: (){
                  smsCode=_fieldOne.text +
                        _fieldTwo.text +
                        _fieldThree.text +
                        _fieldFour.text;
                  print('Entered OTP $smsCode');
                  print('CodeSent at verify $codeSent');
                 AuthService().signInWithOTP(smsCode, verificationId, context);
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LastPage()));
                 
                }
              ),
            ))
            
            ]
            )));
}
Future<void> verifyPhone(phoneNo) async{
    final PhoneVerificationCompleted verified=((AuthCredential authResult) {
      AuthService().signIn(authResult);
      ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Phone Verified.')));
    });
 
final PhoneVerificationFailed verificationfailed = ((FirebaseAuthException authException)
    {
      print('Verification Failed, Aditya: ${authException.message}');
      ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Invalid code entered.')));
    });
  
final PhoneCodeSent smsSent = ((verificationId, forceResendingToken) {
      this.verificationId = verificationId;
      ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('SMS code sent to your number.')));
      setState(() {
        codeSent=true;
      });
    });

    final PhoneCodeAutoRetrievalTimeout autoTimeout = ((verificationId) {
      this.verificationId=verificationId;
    });
    
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verified,
      verificationFailed: verificationfailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout

    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        
        decoration: const InputDecoration(
           fillColor: Color(0xff93D2F3),
           filled: true,

            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
