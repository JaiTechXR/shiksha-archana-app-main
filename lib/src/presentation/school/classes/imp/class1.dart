// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:shikshaarchana/src/presentation/school/classes/1/firstdetail.dart';
// import 'package:shikshaarchana/src/presentation/school/classes/datamanager.dart';

// import '../nursery/phonetic_sound.dart';

// class first extends StatefulWidget {
//   const first({super.key});

//   @override
//   State<first> createState() => _firstState();
// }

// class _firstState extends State<first> {
//   final List<String> items = [
//     'NUR',
//     'LKG',
//     'UKG',
//     'I',
//     'II',
//     'III',
//     'IV',
//     'V',
//     'VI',
//     'VII',
//     'VIII',
//     'IX',
//     'X',
//     'XI',
//     'XII'
//   ];
//   List classList = [];
//   String? selectedValue;
//   String state = "all";

//   final TextEditingController textEditingController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     fetchDatabaseList();
//   }

//   fetchDatabaseList() async {
//     dynamic resultant = await databasemanager().getUsersList();
//     if (resultant == null) {
//       print("Unable to retrieve");
//     } else {
//       setState(() {
//         classList = resultant;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: 23.w,
//           right: 23.w,
//         ),
//         child: Column(children: [
//           SizedBox(
//             height: 15.h,
//           ),

//           Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(
//                   Icons.arrow_back,
//                   size: 18.sp,
//                 ),
//               ),
//               // SizedBox(
//               //   width: 80.w,
//               // ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Class 1st',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18.sp,
//                       color: Color(0xff25265f),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           // InkWell(
//           //   onTap: () {
//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(
//           //         builder: (context) => PhoneticSound(),
//           //       ),
//           //     );
//           //   },
//           //   child: Container(
//           //     height: 223.h,
//           //     width: double.infinity,
//           //     decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(
//           //         24.sp,
//           //       ),
//           //       image: const DecorationImage(
//           //         image: AssetImage(
//           //           'assets/images/nursery.png',
//           //         ),
//           //         fit: BoxFit.fill,
//           //       ),
//           //     ),
//           //     child: Stack(children: [
//           //       Positioned(
//           //         top: 46.h,
//           //         left: 16.w,
//           //         child: Text(
//           //           "Listen \nPhonetic \nSounds",
//           //           style: TextStyle(
//           //             color: Color(0xfffce3e7),
//           //             fontSize: 22.sp,
//           //             fontWeight: FontWeight.w600,
//           //           ),
//           //         ),
//           //       )
//           //     ]),
//           //   ),

//           //   // document
//           // ),
//           // for(int i = 0; i< classList[index]['subjects'].length; )
//           //document sectioni
//           SizedBox(
//             height: 14.h,
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: classList.length,
//               itemBuilder: (context, index) {
//                 final String searchclass = classList[index]['class'];
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => firstdetail(
//                           classes: classList[index]['class'],
//                           subjects: classList[index]['subjects'],
//                           nosubjects: classList[index]['nosubjects'],
//                           title1: classList[index]['title1'],
//                           title2: classList[index]['title2'],
//                         ),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       for (int i = 1; i <= classList[index]['nosubjects']; i++)
//                         Container(
//                           margin: EdgeInsets.only(bottom: 10.h),
//                           padding: EdgeInsets.all(16.sp),
//                           height: 116.sp,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25.sp),
//                               color: Color(0xfff4f6ff),
//                               boxShadow: [BoxShadow(), BoxShadow()],
//                               border: Border.all(color: Colors.grey)),
//                           child: Row(
//                             children: [
//                               // Container(
//                               //   height: 86.sp,
//                               //   width: 86.sp,
//                               //   decoration: BoxDecoration(
//                               //     borderRadius: BorderRadius.circular(14.sp),
//                               //     color: Color(0xfff4f6ff),
//                               //     // image: DecorationImage(image: NetworkImage(teacherList[index]['cover-image'],),fit: BoxFit.cover,),
//                               //     boxShadow: [BoxShadow()],
//                               //   ),
//                               //   // child: ClipRRect(
//                               //   //   borderRadius: BorderRadius.circular(14.sp),
//                               //   //   child: FadeInImage.assetNetwork(
//                               //   //     placeholder: 'assets/images/waiting.jpg',
//                               //   //     image: teacherList[index]['cover-image'],
//                               //   //     fit: BoxFit.cover,
//                               //   //   ),
//                               //   // ),
//                               // ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 19.sp,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       classList[index]['class'],
//                                       style: TextStyle(
//                                         fontSize: 15.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: const Color(
//                                           0xff25265f,
//                                         ),
//                                       ),
//                                     ),
//                                     Text("Shubham")
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       // boxFile(
//                       //     "ABC book.doc",
//                       //     "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
//                       //     "assets/images/word.png"),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           boxFile(
//               "ABC book.doc",
//               "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
//               "assets/images/word.png"),
//           SizedBox(
//             height: 14.h,
//           ),
//           boxFile(
//               "ABC book.ppt",
//               "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
//               "assets/images/ppt.png"),
//           SizedBox(
//             height: 14.h,
//           ),
//           boxFile(
//               "ABC book.xls",
//               "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
//               "assets/images/excel.png"),
//           SizedBox(
//             height: 14.h,
//           ),
//           boxFile(
//               "ABC book.pdf",
//               "Lorem ipsum dolor sit amet consectetur. Volutpat elit sed risus a sit nunc quis. Quis cursus cursus pharetra est varius nisl quam lacus.Lorem ipsum dolor sit amet.",
//               "assets/images/pdf.png"),
//         ]),
//       ),
//     ));
//   }

//   Widget boxFile(String title, String content, String image) {
//     return Container(
//       padding: EdgeInsets.all(13.sp),
//       height: 100.h,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24.sp),
//         color: Color.fromARGB(255, 237, 237, 237),
//       ),
//       child: Row(children: [
//         Container(
//           height: 72.h,
//           width: 75.w,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   image,
//                 ),
//                 fit: BoxFit.fill,
//               ),
//               borderRadius: BorderRadius.circular(11.sp),
//               color: Colors.white),
//         ),
//         Container(
//           width: 230.w,
//           padding: EdgeInsets.only(
//             left: 9.w,
//             right: 9.w,
//           ),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(
//               title,
//               style: TextStyle(
//                   color: Color(0xff25265f),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12.sp),
//             ),
//             SizedBox(
//               height: 3.h,
//             ),
//             Text(
//               content,
//               style: TextStyle(
//                 color: Color(0xff636363),
//                 fontSize: 8.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             SizedBox(
//               height: 5.h,
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 height: 22.h,
//                 width: 99.w,
//                 decoration: BoxDecoration(
//                   color: Color(
//                     0xff25265f,
//                   ),
//                   borderRadius: BorderRadius.circular(
//                     4.sp,
//                   ),
//                 ),
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Icon(
//                     Icons.download,
//                     color: Colors.white,
//                     size: 10.sp,
//                   ),
//                   Text(
//                     "Download",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   )
//                 ]),
//               ),
//             )
//           ]),
//         ),
//       ]),
//     );
//   }

//   Widget selectState() {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(
//         isExpanded: true,
//         hint: Text(
//           'Select Class',
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Theme.of(context).hintColor,
//           ),
//         ),
//         items: items
//             .map((item) => DropdownMenuItem(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                     ),
//                   ),
//                 ))
//             .toList(),
//         value: selectedValue,
//         onChanged: (value) {
//           setState(() {
//             selectedValue = value as String;
//             state = selectedValue.toString();
//           });
//         },
//         buttonStyleData: ButtonStyleData(
//           height: 40.h,
//           width: 230.w,
//         ),
//         dropdownStyleData: DropdownStyleData(
//           maxHeight: 500.h,
//         ),
//         menuItemStyleData: MenuItemStyleData(
//           height: 40.h,
//         ),
//         dropdownSearchData: DropdownSearchData(
//           searchController: textEditingController,
//           searchInnerWidgetHeight: 50,
//           searchInnerWidget: Container(
//             height: 50,
//             padding: const EdgeInsets.only(
//               top: 8,
//               bottom: 4,
//               right: 8,
//               left: 8,
//             ),
//             child: TextFormField(
//               expands: true,
//               maxLines: null,
//               controller: textEditingController,
//               decoration: InputDecoration(
//                 isDense: true,
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 10.sp,
//                   vertical: 8.sp,
//                 ),
//                 hintText: 'Search for an item...',
//                 hintStyle: const TextStyle(fontSize: 12),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//           searchMatchFn: (item, searchValue) {
//             return (item.value.toString().contains(searchValue));
//           },
//         ),
//         //This to clear the search value when you close the menu
//         onMenuStateChange: (isOpen) {
//           if (!isOpen) {
//             textEditingController.clear();
//           }
//         },
//       ),
//     );
//   }

//   Widget bookbox(String title, String des) {
//     return Container(
//         margin: EdgeInsets.fromLTRB(0, 0, 0, 15.sp),
//         width: 350.sp,
//         height: 120.sp,
//         child: Row(
//           children: [
//             Padding(padding: EdgeInsets.fromLTRB(12.sp, 0, 0, 0)),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 90.sp,
//                   width: 90.sp,
//                   // color: Colors.white,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14.sp),
//                       color: Color.fromARGB(255, 255, 255, 255)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/images/apple.png",
//                         width: 80.sp,
//                         height: 80.sp,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               width: 230.sp,
//               // color: Colors.yellow,
//               padding: EdgeInsets.fromLTRB(15.sp, 15.sp, 0, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style:
//                         TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     des,
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                     ),
//                   ),
//                   Container(
//                     width: 210.sp,
//                     // color: Colors.orange,
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         button(100.sp, "Download", () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => ClassRecord(),
//                           //   ),
//                           // );
//                           // _showToast();
//                         }),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14.sp),
//             color: Color.fromARGB(255, 161, 167, 196)));
//   }

//   Widget button(double width, String title, Function()? onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 30.h,
//         width: width.h,
//         decoration: BoxDecoration(
//           color: Color(0xff25265f),
//           // boxShadow: [BoxShadow()],
//           borderRadius: BorderRadius.circular(10.sp),
//           border: Border.all(width: 1.sp),
//         ),
//         child: Align(
//           alignment: Alignment.center,
//           child: Text(
//             title,
//             style: TextStyle(
//               // fontWeight: FontWeight.w600,
//               fontSize: 15.sp,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
