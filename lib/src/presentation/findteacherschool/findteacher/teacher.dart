import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shikshaarchana/src/presentation/findteacherschool/databasemanager.dart';
import 'package:shikshaarchana/src/presentation/findteacherschool/findteacher/teacherdetail.dart';


class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  final List<String> items = [
    'ALL',
    'DL',
    'UP',
    'UK',
    'PB',
    'RJ',
    'BR',
    'JH',
    'GA',
    'TN',
    'KL',
    'KA',
    'OD',
    'WB',
    'JK',
    'PY'
  ];
  List teacherList = [];
  String? selectedValue;
  String state = "all";

  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  Future<void> fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        teacherList = resultant;
      });
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 21.6.sp,
            right: 21.6.sp,
            top: 16.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Find nearby teachers',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Color(0xff25265f),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 16.h,
              ),

              Container(
                padding: EdgeInsets.only(left: 15.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                child: selectState(),
              ),
              //
              //
              SizedBox(
                height: 18.h,
              ),
              // teachers list

              Expanded(
                child: ListView.builder(
                  itemCount: teacherList.length,
                  itemBuilder: (context, index) {
                    final String searchStateCode =
                        teacherList[index]['state-code'];
                    if (state.toLowerCase() == 'all') {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherDetail(
                                name: teacherList[index]['name'],
                                phone: teacherList[index]['phone'],
                                email: teacherList[index]['email'],
                                address: teacherList[index]['address'],
                                city: teacherList[index]['city'],
                                img: teacherList[index]['cover-image'],
                                bio: teacherList[index]['bio'],
                                qualification: teacherList[index]
                                    ['qualification'],
                                experience: teacherList[index]['experience'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.all(16.sp),
                          height: 116.sp,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.sp),
                              color: Color(0xfff4f6ff),
                              boxShadow: [BoxShadow(), BoxShadow()],
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Container(
                                height: 86.sp,
                                width: 86.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  color: Color(0xfff4f6ff),
                                  // image: DecorationImage(image: NetworkImage(teacherList[index]['cover-image'],),fit: BoxFit.cover,),
                                  boxShadow: [BoxShadow()],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/waiting.jpg',
                                    image: teacherList[index]['cover-image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 19.sp,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      teacherList[index]['name'],
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(
                                          0xff25265f,
                                        ),
                                      ),
                                    ),
                                    myText(
                                        'Phone Number: ${teacherList[index]['phone']}'),
                                    myText(
                                        "Email: ${teacherList[index]['email']}"),
                                    myText(
                                        "City: ${teacherList[index]['city']}, India"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else if (state
                        .toLowerCase()
                        .contains(searchStateCode.toLowerCase())) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherDetail(
                                name: teacherList[index]['name'],
                                phone: teacherList[index]['phone'],
                                email: teacherList[index]['email'],
                                address: teacherList[index]['address'],
                                city: teacherList[index]['city'],
                                img: teacherList[index]['cover-image'],
                                bio: teacherList[index]['bio'],
                                qualification: teacherList[index]
                                    ['qualification'],
                                experience: teacherList[index]['experience'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.all(16.sp),
                          height: 116.sp,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.sp),
                              color: Color(0xfff4f6ff),
                              boxShadow: [BoxShadow(), BoxShadow()],
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Container(
                                height: 86.sp,
                                width: 86.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  color: Color(0xfff4f6ff),
                                  // image: DecorationImage(image: NetworkImage(teacherList[index]['cover-image'],),fit: BoxFit.cover,),
                                  boxShadow: [BoxShadow()],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/waiting.jpg',
                                    image: teacherList[index]['cover-image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 19.sp,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      teacherList[index]['name'],
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(
                                          0xff25265f,
                                        ),
                                      ),
                                    ),
                                    myText(
                                        'Phone Number: ${teacherList[index]['phone']}'),
                                    myText(
                                        "Email: ${teacherList[index]['email']}"),
                                    myText(
                                        "City: ${teacherList[index]['city']}, India"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                          // height: 400.h,
                          // width: 300.w,
                          // child: Align(
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     // "No\nTeacher\nAvailable",
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.w700,
                          //       fontSize: 30.sp,
                          //       color: Color(
                          //         0xff25265f,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xff636363),
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget selectState() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Select State',
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
            state = selectedValue.toString();
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 40.h,
          width: 230.w,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 500.h,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 8.sp,
                ),
                hintText: 'Search for an item...',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return (item.value.toString().contains(searchValue));
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
