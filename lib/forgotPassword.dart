import 'package:flutter/material.dart';
import 'package:swiggy_clone/apiService.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ApiService apiService = ApiService();

  bool isReadOnly = false;
  int step = 1;
  TextEditingController email = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String buttonTitle = 'Submit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            step == 1
                ? Text(
                    'Enter your email to reset password',
                    style: TextStyle(fontSize: 18.0),
                  )
                : Container(),
            step == 1 ? SizedBox(height: 20.0) : Container(),
            TextFormField(
              readOnly: isReadOnly,
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            step == 2
                ? TextFormField(
                    controller: otp,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'OTP',
                      border: OutlineInputBorder(),
                    ),
                  )
                : Container(),
            step == 3
                ? TextFormField(
                    controller: newpassword,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(),
                    ),
                  )
                : Container(),
            step == 3 ? SizedBox(height: 20.0) : Container(),
            step == 3
                ? TextFormField(
                    controller: confirmpassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                  )
                : Container(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                if (step == 1) {
                  var res = await apiService
                      .getCall('forgotpassword.php?step=1&email=' + email.text);
                  if (res['status']) {
                    setState(() {
                      isReadOnly = true;
                      step = 2;
                    });
                  } else {
                    popup(res['message']);
                  }
                } else if (step == 2) {
                  var res = await apiService.getCall(
                      'forgotpassword.php?step=2&email=' +
                          email.text +
                          '&otp=' +
                          otp.text);
                  if (res['status']) {
                    setState(() {
                      step = 3;
                      buttonTitle = "Reset Password";
                    });
                  } else {
                    popup(res['message']);
                  }
                } else if (step == 3) {
                  var res = await apiService.getCall(
                      'forgotpassword.php?step=3&email=' +
                          email.text +
                          '&newpassword=' +
                          newpassword.text +
                          '&confirmpassword=' +
                          confirmpassword.text);
                  if (res['status']) {
                    setState(() {
                      isReadOnly = false;
                      step = 1;
                      buttonTitle = "Submit";
                      email.clear();
                      otp.clear();
                      newpassword.clear();
                      confirmpassword.clear();
                    });
                  }
                  popup(res['message']);
                }
              },
              child: Text(buttonTitle),
            ),
          ],
        ),
      ),
    );
  }

  Future popup(message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Reset'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
