import 'package:cloud_firestore/cloud_firestore.dart';

class databasemanager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('educational-content');

  Future getUsersList() async {
    List itemsList = [];
    try {
      await profileList.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          itemsList.add(element.data());
        }
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
