import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shikshaarchana/Constant/Constants.dart';
import 'package:shikshaarchana/CustomWidget.dart';
import 'package:shikshaarchana/preferences.dart';
import 'package:shikshaarchana/src/BottomNavBar.dart';
import 'package:shikshaarchana/src/presentation/onboarding/model.dart';

import '../dashboard/dashboard.dart';
import '../otpscreen/otpscreen.dart';
import '../profile/profilescreen.dart';

class EditProfileScreen extends StatefulWidget {
  String number;
  String name = '';
  String dob;
  String email;
  String gender;
  String school;
  String clas;
  String motherName;
  String fatehrName;
  String typeOfDisab;
  String id;
  String image;

  EditProfileScreen(
      {super.key,
      required this.number,
      required this.clas,
      required this.dob,
      required this.email,
      required this.fatehrName,
      required this.gender,
      required this.motherName,
      required this.name,
      required this.school,
      required this.typeOfDisab,
      required this.image,
      required this.id});
  static String verify = "";

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState(phone: number, id: id, name: name);
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String id;
  String name;
  var phone = "+911111111111";
  _EditProfileScreenState(
      {required this.phone, required this.id, required this.name});
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  late Stream<QuerySnapshot<Map<String, dynamic>>> firestore = FirebaseFirestore
      .instance
      .collection('userDetail')
      .orderBy('date', descending: true)
      .snapshots();
  late CollectionReference<Map<String, dynamic>> ref =
      FirebaseFirestore.instance.collection('userDetail');

  String? selectedValue;
  int ta = 1;
  final _formKey = GlobalKey<FormState>();

  TextEditingController countryCode = TextEditingController();

  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final dateofBirthEditingController = new TextEditingController();
  final genderEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();

  final disabilityEditingController = new TextEditingController();
  final schoolEditingController = new TextEditingController();
  final classEditingController = new TextEditingController();
  final motherNameEditingController = new TextEditingController();
  final fatherNameEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  void initState() {
    countryCode.text = widget.number;
    // getId();

    setState(() {
      firstNameEditingController.text = widget.name;
      motherNameEditingController.text = widget.motherName;
      fatherNameEditingController.text = widget.fatehrName;
      classEditingController.text = widget.clas;
      genderEditingController.text = widget.gender;
      schoolEditingController.text = widget.school;
      disabilityEditingController.text = widget.typeOfDisab;
      dateofBirthEditingController.text = widget.dob;
      emailEditingController.text = widget.email;
    });
    super.initState();
  }

  // Future<void> getId() async {
  //   id = await SessionManager().getString("userid");
  // }

  final _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  // final _auth = FirebaseAuth.instance;
  File? photo = File('');
  int photochoosen = 0;
  late DateTime _selectedDate;
  String dob = "Date of Birth";

  @override
  Widget build(BuildContext context) {
    if (widget.dob.isNotEmpty) {
      dob = widget.dob;
    }

    double height_variable = MediaQuery.of(context).size.height;
    double width_varible = MediaQuery.of(context).size.width;
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "What's your name ?",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.sp),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ));

    final dateofBirthField = GestureDetector(
      onTap: () {
        _pickDateDialog();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            14.sp,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2.sp, 15.sp, 20.sp, 15.sp),

          // padding: EdgeInsets.all(8.0.sp),
          child: Row(
            children: [
              // Icon(Icons.calendar_today),
              SizedBox(width: 20.sp),
              Text(
                dob,
                style: TextStyle(
                    color: dob == "Date of Birth" ? Colors.grey : Colors.black),
              )
            ],
          ),
        ),
      ),
    );

    final emailFiled = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Email cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "Email Address",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.sp),
            // borderSide: BorderSide.none,
          ),
        ));
    final genderField = DropdownButtonFormField2(
      decoration: InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.sp),
        ),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: Text(
        genderEditingController.text.toString(),
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
      ),
      items: genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      validator: (genderEditingController) {
        if (genderEditingController == null) {
          return 'Please select gender.';
        }
        return null;
      },
      onChanged: (value) {
        genderEditingController.text = value.toString();
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        genderEditingController.text = value.toString();
      },
      buttonStyleData: ButtonStyleData(
        height: 49.h,
        padding: EdgeInsets.only(left: 3.w, right: 10.w),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final disabilityField = TextFormField(
        autofocus: false,
        controller: disabilityEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Disability cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          disabilityEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.health_and_safety),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "Type of Disability",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.sp),
            // borderSide: BorderSide.none
          ),
        ));

    final schoolField = TextFormField(
        autofocus: false,
        controller: schoolEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("School Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          schoolEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "School Name",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.sp),
            // borderSide: BorderSide.none,
          ),
        ));

    final classField = TextFormField(
        autofocus: false,
        controller: classEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          RegExp regex = new RegExp(r'/^(?:[+0]9)?[0-9]{3}$/');
          if (value!.isEmpty) {
            return ("Class cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Class ");
          }
          return null;
        },
        onSaved: (value) {
          classEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.book),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "Class",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.sp),
            // borderSide: BorderSide.
          ),
        ));

    final motherNameField = TextFormField(
        autofocus: false,
        controller: motherNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Mother Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          motherNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.girl),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "Mother's Name",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.sp),
            // borderSide: BorderSide.none,
          ),
        ));

    final fatherNameField = TextFormField(
        autofocus: false,
        controller: fatherNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Father Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          fatherNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.boy),
          contentPadding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 15.sp),
          hintText: "Father's Name",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.sp),
            // borderSide: BorderSide.none,
          ),
        ));

    final phoneNumberField = TextFormField(
        enableInteractiveSelection: false,
        enabled: false,
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
        onChanged: (val) {
          setState(() {
            phone = val;
          });
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.sp),
              borderSide: BorderSide(width: 2.sp)),
        ));

    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 2.sp),
          child: StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.sp, vertical: 4.sp),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff0D0B4E),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 21.h,
                    ),
                    Text(
                      'Let\' sign up.',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      'Welcome\nto new member!',
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: ta == 1
                                ? DecorationImage(
                                    image: MemoryImage(
                                      Base64Decoder().convert(widget.image),
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: FileImage(photo!),
                                    fit: BoxFit.cover,
                                  ),
                            borderRadius: BorderRadius.circular(18.sp),
                            border: Border.all(
                              color: Color(0xff25265ff),
                            ),
                            // image: DecorationImage(image: )
                          ),
                          width: width_varible * 0.3,
                          height: height_variable * 0.12,
                          // child: photo == null
                          //     ? null
                          //     : Container(
                          //       // padding: EdgeInsets.all(10.sp),
                          //       child: Image.file(
                          //           photo!,
                          //           fit: BoxFit.fill,
                          //         ),
                          //     ),
                        ),
                        SizedBox(
                          width: 34.w,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              ta = 0;
                            });
                            pickImageFromgallery();
                          },
                          child: Container(
                            height: 56.h,
                            width: 175.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.sp),
                              color: Color(0xff25265f),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Upload from Gallery",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.sp,
                                ),
                                Icon(
                                  Icons.upload_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height_variable * 0.03,
                    ),
                    Container(
                      child: Column(
                        children: [
                          firstNameField,
                          SizedBox(
                            height: 14.h,
                          ),
                          phoneNumberField,

                          SizedBox(
                            height: 14.h,
                          ),
                          dateofBirthField,
                          SizedBox(
                            height: 14.h,
                          ),
                          genderField,
                          SizedBox(
                            height: 14.h,
                          ),
                          disabilityField,
                          SizedBox(
                            height: 14.h,
                          ),
                          schoolField,
                          SizedBox(
                            height: 14.h,
                          ),
                          classField,
                          SizedBox(
                            height: 14.h,
                          ),
                          fatherNameField,
                          SizedBox(
                            height: 14.h,
                          ),
                          motherNameField,
                          SizedBox(
                            height: 14.h,
                          ),
                          emailFiled
                          // SizedBox(
                          //   height: 20,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(14.sp),
                            color: Color(0xff25265f),
                            child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () async {
                                firstNameEditingController.text.isNotEmpty &&
                                        dob != "Date of Birth" &&
                                        emailEditingController
                                            .text.isNotEmpty &&
                                        genderEditingController
                                            .text.isNotEmpty &&
                                        disabilityEditingController
                                            .text.isNotEmpty &&
                                        schoolEditingController
                                            .text.isNotEmpty &&
                                        classEditingController
                                            .text.isNotEmpty &&
                                        motherNameEditingController
                                            .text.isNotEmpty &&
                                        fatherNameEditingController
                                            .text.isNotEmpty
                                    ? {
                                        Center(
                                          child: CircularProgressIndicator(
                                            color: Color(0xff25265f),
                                          ),
                                        ),
                                        ref.doc(id).update({
                                          "image": ta != 1
                                              ? base64Encode(
                                                  photo!.readAsBytesSync())
                                              : widget.image,
                                          "name":
                                              firstNameEditingController.text,
                                          // "lastname": lastNameEditingController.text,
                                          "email": emailEditingController.text,
                                          "dateofbirth": dob,
                                          "gender":
                                              genderEditingController.text,
                                          "disability":
                                              disabilityEditingController.text,
                                          "schoolname":
                                              schoolEditingController.text,
                                          "classes":
                                              classEditingController.text,
                                          "mothername":
                                              motherNameEditingController.text,
                                          "fathername":
                                              fatherNameEditingController.text,
                                          "phonenumber": phone,
                                        }).then((value) {
                                          // SessionManager().setString(Constant.userID, );
                                          SnackBar(
                                            content: Text(
                                              "Profile details updated",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.sp),
                                            ),
                                            backgroundColor: Color(0xff25265f),
                                          );
                                          CustomWidget()
                                              .hidProgress(context: context);
                                          print('\n\nEnter the then block');
                                          // SessionManager().setString(
                                          // Constant.isRegistered, '1');
                                          // Navigator.pop(context);
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  profile(number: phone),
                                            ),
                                          );
                                          // Navigator.of(context,
                                          //         rootNavigator: true)
                                          //     .pop();
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(
                                          //   SnackBar(
                                          //     content: Text('Snackbar Message'),
                                          //     // duration: Duration(seconds: 3),
                                          //   ),
                                          // );
                                        }).catchError((error) =>
                                            print("Error adding data: $error"))
                                      }
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text(
                                                'Please enter all details')));
                              },
                              child: Text(
                                "Save",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height_variable * 0.026,
                    ),
                  ],
                );
              }),
        ),
      )),
    );
  }

  Future<String> uploadPic(File file) async {
    //Get the file from the image picker and store it

    //Create a reference to the location you want to upload to in firebase
    Reference reference = _storage.ref().child("images/");

    //Upload the file to firebase
    UploadTask uploadTask = reference.putFile(file);

    // Waits till the file is uploaded then stores the download url
    TaskSnapshot location = await uploadTask.whenComplete(() => null);
    String url = await location.ref.getDownloadURL();

    //returns the download url
    return url;
  }

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
        dob =
            '${_selectedDate.day.toString().padLeft(2, "0")}/${_selectedDate.month.toString().padLeft(2, "0")}/'
            '${_selectedDate.year.toString()} ';
        //  dateofBirthEditingController.text == _selectedDate.toString();
      });
    });
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

//compress the picked image in KB
  Future<File> customCompressed(
      {required File imagaePathToCompress,
      quality = 100,
      precentage = 10}) async {
    var path = FlutterNativeImage.compressImage(
      imagaePathToCompress.absolute.path,
      quality: 100,
      percentage: 10,
    );
    return path;
  }

  Future pickImageFromgallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      File compressedImage =
          await customCompressed(imagaePathToCompress: imageTemp);
      final sizeInKb = compressedImage.lengthSync() / 1024;
      if (sizeInKb <= 1024) {
        print("\nimage size is: " + sizeInKb.toString());
        setState(() => photo = compressedImage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image size should be less than 1 MB'),
          ),
        );
        print("\nimage size is: " + sizeInKb.toString());
      }
      // setState(() => photo = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      File compressedImage =
          await customCompressed(imagaePathToCompress: imageTemp);
      final sizeInKb = compressedImage.lengthSync() / 1024;
      if (sizeInKb <= 1024) {
        print("\nimage size is: " + sizeInKb.toString());
        setState(() => photo = compressedImage);
      } else {
        print("\nimage size is: " + sizeInKb.toString());
      }
      // setState(() => photo = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
