import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shikshaarchana/CustomWidget.dart';
import 'package:shikshaarchana/preferences.dart';
import 'package:shikshaarchana/src/BottomNavBar.dart';
import '../../../Applocalization/Apptranslation.dart';
import '../../../Constant/Constants.dart';
import '../login/loginscreen.dart';

import '../onboarding/onboardingscreen.dart';

class otp extends StatefulWidget {
  final String number;
  const otp({super.key, required this.number});

  @override
  State<otp> createState() => _otpState(number: number);
}

class _otpState extends State<otp> {
  int resendOn = 0;
  String number;
  int? _resendToken;
  _otpState({required this.number});
  late bool isRegistered;
  final otpEditingController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    _getUserName(widget.number);
    startTimer();
    super.initState();
    // _checkIfRegistered();
  }

  // _checkIfRegistered() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   isRegistered = prefs.getBool('isRegistered') ?? false;
  //   if (isRegistered) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => dashboard()));
  //   }
  // }
  var code = "";
  int start = 59;
  bool wait = false;
  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          resendOn = 1;
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextFormField otpField = TextFormField(
        autofocus: false,
        controller: otpEditingController,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            code = value;
            print(code);
          });
        },
        validator: (value) {
          RegExp regex = RegExp(r'/^(?:[+0]9)?[0-9]{6}$/');
          if (value!.isEmpty) {
            return ("OTP cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid OTP ");
          }
          return null;
        },
        onSaved: (value) {
          otpEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.code),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "OTP",
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          // ),
        ));
    double heightVariable = MediaQuery.of(context).size.height;
    double widthVarible = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 738.h,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(
                          Icons.arrow_back,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(widthVarible * 0.05,
                        heightVariable * 0.05, widthVarible * 0.05, 0),
                    child: Column(
                      children: [
                        Text(
                          'Verify your Phone Number',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 71.h,
                          width: 314.w,
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              'We sent you a 6 digit code to verify your phone number (${widget.number.substring(3, 8)}XXXX${widget.number.substring(10, 13)}).\n  Enter in the field below.',
                              style: TextStyle(
                                fontSize: 16.sp,
                                // fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 102.h,
                        ),
                        SizedBox(
                          width: 230.w,
                          child: Column(
                            children: [
                              otpField,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Didn’t get the code?',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            InkWell(
                              onTap: resendOn == 1
                                  ? () async {
                                      setState(() {
                                        start = 59;
                                        resendOn = 0;
                                      });
                                      CustomWidget()
                                          .showProgress(context: context);

                                      await FirebaseAuth.instance
                                          .verifyPhoneNumber(
                                        timeout: const Duration(seconds: 60),
                                        phoneNumber: number,
                                        verificationCompleted:
                                            (PhoneAuthCredential
                                                phoneAuthCredential) async {
                                          Navigator.pop(context);
                                          print('inside verification');

                                          // adduser();
                                          // await auth.signInWithCredential(credential);
                                          // CustomWidget().hidProgress(context: context);
                                        },
                                        verificationFailed:
                                            (FirebaseAuthException e) {
                                          Navigator.pop(context);
                                          print('inside verification failed');
                                          // showDialog(context: context, builder: {})
                                          // CustomWidget().hidProgress(context: context);

                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => login()));
                                        },
                                        codeSent: (String verificationId,
                                            int? resendToken) {
                                          Navigator.pop(context);
                                          startTimer();
                                          login.verify = verificationId;
                                          _resendToken = resendToken;
                                          print(
                                              'login verification====${login.verify}');
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             otp(number: number)));
                                        },
                                        forceResendingToken: _resendToken,
                                        codeAutoRetrievalTimeout:
                                            (String verificationId) {
                                          print(verificationId);
                                        },
                                      );
                                    }
                                  : () {},
                              child: Text(
                                ' Resend',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w800,
                                    color: resendOn == 1
                                        ? Color(0xff25265f)
                                        : Colors.grey),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 10.sp,
                        ),
                        start >= 10
                            ? Text('Expires in 00:$start')
                            : Text('Expires in 00:0$start'),
                        //     SizedBox(height: 60.h,),
                        // Container(
                        //   // width: 250.w,
                        //   child: Column(
                        //     children: [
                        //       SizedBox(
                        //         width: 341.7.w,
                        //         height: 59.h,
                        //         child: ElevatedButton(
                        //           onPressed: () async {
                        //             try {
                        //               CustomWidget().showProgress(context: context);
                        //               print(
                        //                   'login verification at otp====${login.verify}');
                        //               print('Code-----$code');

                        //               PhoneAuthCredential credential =
                        //                   PhoneAuthProvider.credential(
                        //                       verificationId: login.verify,
                        //                       smsCode: code);
                        //               //
                        //               // Sign the user in (or link) with the credential
                        //               await auth
                        //                   .signInWithCredential(credential)
                        //                   .whenComplete(() => CustomWidget()
                        //                       .hidProgress(context: context));
                        //               SessionManager()
                        //                   .setString(Constant.isLogin, 'true');
                        //               SessionManager().setString(
                        //                   Constant.userNumber, widget.number);

                        //               await doesNameAlreadyExist(widget.number)
                        //                   ? Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                           builder: (context) => BottomNavBar(
                        //                               index: 0, num: widget.number)))
                        //                   : Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                           builder: (context) =>
                        //                               onboarding()));
                        //             } catch (e) {
                        //               print(e);
                        //               //print('Wrong Otp');
                        //               ScaffoldMessenger.of(context).showSnackBar(
                        //                   const SnackBar(
                        //                       content: Text(
                        //                           "Wrong OTP Please enter correct OTP")));
                        //             }
                        //           },
                        //           style: ElevatedButton.styleFrom(
                        //               padding: EdgeInsets.symmetric(
                        //                   horizontal: 50.0.sp, vertical: 10.0.sp),
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius: BorderRadius.circular(10.sp)),
                        //               primary: Color.fromRGBO(37, 38, 95, 10)),
                        //           child: Text(
                        //             LanguageTranslation.of(context)!
                        //                 .value("Continue"),
                        //             style: TextStyle(
                        //                 color: Colors.white, fontSize: 18.sp),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              // width: 250.w,
              child: Column(
                children: [
                  SizedBox(
                    width: 341.7.w,
                    height: 59.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          CustomWidget().showProgress(context: context);
                          print('login verification at otp====${login.verify}');
                          print('Code-----$code');

                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: login.verify, smsCode: code);
                          //
                          // Sign the user in (or link) with the credential
                          await auth
                              .signInWithCredential(credential)
                              .whenComplete(() =>
                                  CustomWidget().hidProgress(context: context));
                          SessionManager().setString(Constant.isLogin, 'true');
                          SessionManager()
                              .setString(Constant.userNumber, widget.number);

                          await doesNameAlreadyExist(widget.number)
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavBar(
                                          index: 0, num: widget.number)))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => onboarding(
                                            number: number,
                                          )));
                        } catch (e) {
                          print(e);
                          //print('Wrong Otp');
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Wrong OTP Please enter correct OTP")));
                        }
                      },
                      // onPressed: () async {
                      //   try {
                      //     // Center(child: CircularProgressIndicator());
                      //     print('login verification at otp====${login.verify}');
                      //     print('Code-----$code');

                      //     PhoneAuthCredential credential =
                      //         PhoneAuthProvider.credential(
                      //             verificationId: login.verify, smsCode: code);
                      //     //
                      //     // Sign the user in (or link) with the credential
                      //     await auth
                      //         .signInWithCredential(credential)
                      //         .whenComplete(() =>
                      //             CustomWidget().hidProgress(context: context));
                      //     SessionManager().setString(Constant.isLogin, 'true');
                      //     SessionManager()
                      //         .setString(Constant.userNumber, widget.number);

                      //     await doesNameAlreadyExist(widget.number)
                      //         ? Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => BottomNavBar(
                      //                     index: 0, num: widget.number),),)
                      //         : Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => onboarding(),),);
                      //   } catch (e) {
                      //     print(e);
                      //     //print('Wrong Otp');
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content: Text(
                      //                 "Wrong OTP Please enter correct OTP")));
                      //   }
                      // },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.0.sp, vertical: 10.0.sp),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp)),
                          backgroundColor: Color.fromRGBO(37, 38, 95, 10)),
                      child: Text(
                        LanguageTranslation.of(context)!.value("Continue"),
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<bool> doesNameAlreadyExist(String name) async {
    print(name);
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('userDetail')
        .where('phonenumber', isEqualTo: name)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    //print(result.docs);
    return documents.length == 1;
  }

  Future<void> _getUserName(String no) async {
    await FirebaseFirestore.instance
        .collection('userDetail')
        .where('phonenumber', isEqualTo: "+919899880626")
        .limit(1)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print("-------------${document.data()}");
              //docIDs.add(document.reference.id);
            }));
  }
}
