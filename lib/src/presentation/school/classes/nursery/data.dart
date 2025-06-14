import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserDetail extends StatelessWidget {
  final String documentId;
  const GetUserDetail({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference userDetail =
    FirebaseFirestore.instance.collection('userDetail');

    return FutureBuilder<DocumentSnapshot>(
      future: userDetail.doc(documentId).get(), // ✅ this is required
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Better feedback for loading
        }

        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.hasData && snapshot.data!.exists) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text("Name: ${data['name']}");
        }

        return Text("No Data Found");
      },
    );
  }
}
