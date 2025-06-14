import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class GetUserDetail extends StatelessWidget {
  // const GetUserDetail({super.key});
  final String documentId;
  const GetUserDetail({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference userDetail =
        FirebaseFirestore.instance.collection('userDetail');

    return FutureBuilder<DocumentSnapshot>(builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text("Name");
      }
      return Text("Name");
    }), future: null,);
  }
}
// class DataController extends Getontroller {}
