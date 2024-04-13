import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future adduserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getuserbyEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: email)
        .get();
  }

  Future<QuerySnapshot> Search(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("Search Key", isEqualTo: username.substring(0, 1).toUpperCase())
        .get();
  }
}
