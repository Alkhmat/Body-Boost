import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:body_boost/firebase/models/cloud_gender_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CloudGenderModel>> getCollectionWithSubcollections(
      String collectionPath,
      String subcollectionPath,
      String subsubcollectionPath) async {
    var snapshot = await _db.collection(collectionPath).get();
    var futures = snapshot.docs.map((doc) async {
      var subCollectionSnapshot =
          await doc.reference.collection(subcollectionPath).get();
      var subItems =
          await Future.wait(subCollectionSnapshot.docs.map((subDoc) async {
        var subSubCollectionSnapshot =
            await subDoc.reference.collection(subsubcollectionPath).get();
        var subSubItems = subSubCollectionSnapshot.docs.map((subSubDoc) {
          return SubSubItem.fromMap(subSubDoc.data());
        }).toList();
        return SubItem.fromMap(subDoc.data(), subSubItems);
      }).toList());
      return CloudGenderModel.fromMap(doc.data(), subItems);
    }).toList();

    return Future.wait(futures);
  }
}
