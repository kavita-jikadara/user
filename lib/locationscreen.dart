import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:swiggy_clone/loctionselect.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(0, 0, 0, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  get focusedPinTheme => null;

  get submittedPinTheme => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "OTP Verification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text("We have sent a verification code to"),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "+91 1234567890",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration?.copyWith(
                  color: Color.fromRGBO(234, 239, 243, 1),
                ),
              ),
              validator: (s) {
                return null;
              
                // return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin){
                if (pin=="123456") {
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>select_location()));
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Resend SMS in 16',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     elevation: MaterialStateProperty.all(0),
                  //     backgroundColor: MaterialStateProperty.all(Colors.white),
                  //     padding: MaterialStateProperty.all(
                  //       EdgeInsets.all(10),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: Text(
                  //     "Resend SMS in 16",
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Call Me In 60 ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
