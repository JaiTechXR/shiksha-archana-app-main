// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../onboarding/onboardingscreen.dart';

// class hiscreen extends StatefulWidget {
//   const hiscreen({super.key});

//   @override
//   State<hiscreen> createState() => _hiscreenState();
// }

// class _hiscreenState extends State<hiscreen> {
//   bool? valuefirst = true;
//   var containeropacity = 0.0;
//   var maincontaineropacity = 1.0;
//   bool value = false;
//   @override
//   Widget build(BuildContext context) {
//     double height_variable = MediaQuery.of(context).size.height;
//     double width_varible = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(width_varible * 0.05,
//                 height_variable * 0.02, width_varible * 0.05, 0),
//             height: height_variable * 0.75,
//             width: width_varible * 0.9,
//             child: Column(children: [
//               Container(
//                 child: Column(children: [
//                   Text(
//                     // "Term & Conditions",
//                     AppLocalizations.of(context).terms,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Color.fromRGBO(37, 38, 95, 10),
//                         fontSize: height_variable * 0.03,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ]),
//               ),
//               SizedBox(
//                 height: height_variable * 0.01,
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     Divider(
//                       color: Colors.black,
//                       thickness: height_variable * 0.002,
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: height_variable * 0.015,
//               ),
//               Container(
//                 child: Column(children: [
//                   Text(
//                     "   Lorem Ipsum is simply dummy text of the printing... and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spd. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n    Lorem in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\n   only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n   only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                     textAlign: TextAlign.justify,
//                     style: TextStyle(fontSize: height_variable * 0.015),
//                   )
//                 ]),
//               ),
//               SizedBox(
//                 height: height_variable * 0.05,
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     Text(
//                       "EdFoal",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: height_variable * 0.023,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Container(
//               //     child: Row(
//               //   children: [
//               //     Checkbox(
//               //       value: this.value,
//               //       onChanged: (value) {
//               //         setState(() {
//               //           if (this.value = value!) {
//               //             containeropacity = 1.0;
//               //           } else {
//               //             containeropacity = 0.0;
//               //           }
//               //           // this.value = value!;
//               //         });
//               //       },
//               //     ),
//               //     Text(
//               //       "I agree with the Terms & Condition",
//               //       style: TextStyle(fontSize: height_variable * 0.018),
//               //     )
//               //   ],
//               // ))
//             ]),
//           ),
//           AnimatedOpacity(
//             opacity: maincontaineropacity,
//             duration: Duration(seconds: 1),
//             child: Container(
//               margin: EdgeInsets.fromLTRB(width_varible * 0.05,
//                   height_variable * 0.015, width_varible * 0.05, 0),
//               width: width_varible * 0.9,
//               height: height_variable * 0.17,
//               child: Column(
//                 children: [
//                   Container(
//                       child: Row(
//                     children: [
//                       Checkbox(
//                         value: this.value,
//                         onChanged: (value) {
//                           setState(() {
//                             if (this.value = value!) {
//                               containeropacity = 1.0;
//                             } else {
//                               containeropacity = 0.0;
//                             }
//                             // this.value = value!;
//                           });
//                         },
//                       ),
//                       Text(
//                         "I agree with the Terms & Condition",
//                         style: TextStyle(fontSize: height_variable * 0.018),
//                       )
//                     ],
//                   )),
//                   // Container(
//                   //   child: Row(
//                   //     children: [
//                   //       Checkbox(
//                   //           checkColor: Colors.green,
//                   //           activeColor: Colors.red,
//                   //           value: this.valuefirst,
//                   //           onChanged: (bool? value) {
//                   //             // setState(() {
//                   //             //   valuefirst = value;
//                   //             // });
//                   //           }),
//                   //     ],
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: height_variable * 0.05,
//                   ),
//                   // sized
//                   AnimatedOpacity(
//                     opacity: containeropacity,
//                     duration: Duration(seconds: 1),
//                     child: Container(
//                       margin: EdgeInsets.fromLTRB(
//                           width_varible * 0.03, 0, width_varible * 0.03, 0),
//                       child: Row(
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: width_varible * 0.15,
//                                     vertical: height_variable * 0.01),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(50.0)),
//                                 primary: Color.fromRGBO(37, 38, 95, 10)),
//                             child: Text(
//                               "Quit",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: height_variable * 0.018,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: width_varible * 0.05,
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => onboarding()));
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: width_varible * 0.12,
//                                     vertical: height_variable * 0.01),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(50.0)),
//                                 primary: Color.fromRGBO(37, 38, 95, 10)),
//                             child: Text(
//                               "Continue",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: height_variable * 0.018,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               decoration: BoxDecoration(
//                   // border: Border.all(
//                   //   width: 1.5,
//                   //   color: Colors.black,
//                   // ),
//                   // borderRadius: BorderRadius.all(Radius.circular(10)
//                   // )
//                   ),
//             ),
//           ),
//         ],
//       )),
//     );;
//   }
// }