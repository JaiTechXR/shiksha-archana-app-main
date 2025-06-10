class userdetail {
  String? firstname;
  String? lastname;
  int? dateofbirth;
  String? gender;
  String? disability;
  String? schoolname;
  int? classes;
  String? mothername;
  String? fathername;
  int? phonenumber;
  // String? secondName;

  userdetail(
      {this.firstname,
      this.lastname,
      this.dateofbirth,
      this.gender,
      this.disability,
      this.schoolname,
      this.classes,
      this.mothername,
      this.fathername,
      this.phonenumber});

  // receiving data from server
  factory userdetail.fromMap(map) {
    return userdetail(
      firstname: map['firstname'],
      lastname: map['lastname'],
      dateofbirth: map['uid'],
      gender: map['email'],
      disability: map['fullName'],
      schoolname: map['link'],
      classes: map['class'],
      mothername: map['secondName'],
      fathername: map['secondName'],
      phonenumber: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'dateofbirth': dateofbirth,
      'gender': gender,
      'disability': disability,
      'schoolname': schoolname,
      'class': classes,
      'mothername': mothername,
      'fathername': fathername,
      'phonenumber': phonenumber,
      // 'secondName': secondName,
    };
  }
}
