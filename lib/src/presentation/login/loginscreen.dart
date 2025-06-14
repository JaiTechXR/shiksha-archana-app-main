import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Applocalization/Apptranslation.dart';
import '../otpscreen/otpscreen.dart';
import '../../../../CustomWidget.dart';

class login extends StatefulWidget {
  const login({super.key});
  static String verify = "";

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final phoneNumberEditingController = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  var mes = 'e';
  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  int? _resendToken;
  @override
  Widget build(BuildContext context) {
    final phoneNumberField = TextFormField(
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23.sp,
            letterSpacing: 0.2.sp),
        autofocus: false,
        controller: countryCode,
        keyboardType: TextInputType.number,
        validator: (value) {
          RegExp regex = RegExp(r'/^(?:[+0]9)?[0-9]{10}$/');
          if (value!.isEmpty) {
            return ("Phone Number cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Phone number ");
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            phone = value;
          });
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(25, 15, 20, 15),
          hintText: "Phone Number",
        ));
    double heightVariable = MediaQuery.of(context).size.height;
    double widthVarible = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //----
            Container(
              // height: 100.h,

              // height: double.infinity,
              width: double.infinity,
              // color: Colors.blue,
              margin: EdgeInsets.fromLTRB(widthVarible * 0.05,
                  heightVariable * 0.05, widthVarible * 0.05, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 445.h,
                  ),
                  Container(
                    child: Column(
                      children: [
                        phoneNumberField,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightVariable * 0.04,
                  ),
                  Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Center(
                            //   child: Container(
                            //     height: 25.h,
                            //     width: 25.w,
                            //     child: CircularProgressIndicator(
                            //       color: Colors.red,
                            //     )),
                            // );
                            CustomWidget().showProgress(context: context);
                            print(phone);
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              timeout: const Duration(seconds: 60),
                              phoneNumber: phone,
                              verificationCompleted: (PhoneAuthCredential
                                  phoneAuthCredential) async {
                                print('inside verification');

                                // adduser();
                                // await auth.signInWithCredential(credential);
                                // CustomWidget().hidProgress(context: context);
                              },
                              verificationFailed: (FirebaseAuthException e) {
                                print(e);
                                if (e.code == 'invalid-phone-number') {
                                  print(
                                      'The provided phone number is not valid.');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please Enter valid Phone number !!")));
                                }
                                print('inside verification failedf');
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$e')));
                                // CustomWidget().hidProgress(context: context);
                                Navigator.pop(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => login()));
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                login.verify = verificationId;
                                _resendToken = resendToken;
                                print('login verification====${login.verify}');
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            otp(number: phone)));
                              },
                              forceResendingToken: _resendToken,
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                print(verificationId);
                              },
                            );

                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => otp()));
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              backgroundColor: Color.fromRGBO(37, 38, 95, 10)),
                          child: Text(
                            LanguageTranslation.of(context)!.value("Continue"),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: heightVariable * 0.025),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF25265F),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.sp),
                  bottomRight: Radius.circular(60.sp),
                ),
              ),
            ),
            Positioned(
              top: 120.h,
              child: Container(
                padding: EdgeInsets.only(left: 113.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.sp),
                      height: 122.h,
                      width: 122.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Color(0xFF25265F),
                      ),
                      child: Container(
                        height: 89.h,
                        width: 89.w,
                        decoration: const BoxDecoration(
                          // color: Color(0xFF25265F),
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.64.h,
                    ),
                    // siksha archana
                    Text(
                      "Shiksha Archana",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2.sp,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      "Education For One n All",
                      style: TextStyle(
                        color: Color(0xFFE3E3E3),
                        letterSpacing: 1.2.sp,
                        fontSize: 12.42.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Applocalization/Apptranslation.dart';
import '../otpscreen/otpscreen.dart';
import '../../../../CustomWidget.dart';
class login extends StatefulWidget {
  const login({super.key});
  static String verify = "";

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final phoneNumberEditingController = new TextEditingController();
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }
int? _resendToken ;
  Widget build(BuildContext context) {
    final phoneNumberField = TextFormField(
        autofocus: false,
        controller: countryCode,
        keyboardType: TextInputType.number,
        validator: (value) {
          RegExp regex = new RegExp(r'/^(?:[+0]9)?[0-9]{10}$/');
          if (value!.isEmpty) {
            return ("Phone Number cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Phone number ");
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            phone = value;
          });
        },
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(25, 15, 20, 15),
          hintText: "Phone Number",

        ));
    double height_variable = MediaQuery.of(context).size.height;
    double width_varible = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height_variable * 0.55,
              width: width_varible * 1,
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png',
                      width: width_varible * 0.5,
                      height: height_variable * 0.5),
                ],
              ),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(37, 38, 95, 10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/welcomeimage.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width_varible * 0.05,
                  height_variable * 0.05, width_varible * 0.05, 0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        phoneNumberField,
                        // TextField(
                        //   controller: countryCode,
                        //   keyboardType: TextInputType.number,
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height_variable * 0.04,
                  ),
                  Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            CustomWidget().showProgress(context: context);
                            print(phone);
                             await FirebaseAuth.instance.verifyPhoneNumber(
                               timeout: const Duration(seconds: 60),
                              phoneNumber:  phone,

                              verificationCompleted:
                                  (PhoneAuthCredential phoneAuthCredential) async {
                                print('inside verification');

                                // adduser();
                               // await auth.signInWithCredential(credential);
                                // CustomWidget().hidProgress(context: context);

                                  },
                              verificationFailed: (FirebaseAuthException e) {
                                print('inside verification failedf');
                                // CustomWidget().hidProgress(context: context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login()));
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {

                                login.verify = verificationId;
                                _resendToken = resendToken;
                                print('login verification====${login.verify}');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => otp(number: phone)));
                              },
                               forceResendingToken: _resendToken,

                               codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                print(verificationId);
                                  },
                            );

                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => otp()));
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              primary: Color.fromRGBO(37, 38, 95, 10)),
                          child: Text(
                            LanguageTranslation.of(context)!.value("Continue"),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height_variable * 0.025),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
