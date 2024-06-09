import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:body_boost/firebase/models/cloud_gender_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CloudGenderModel>> getCollectionWithSubcollections(
      String collectionPath, String subcollectionPath) async {
    var snapshot = await _db.collection(collectionPath).get();
    var futures = snapshot.docs.map((doc) async {
      var subCollectionSnapshot =
          await doc.reference.collection(subcollectionPath).get();
      var subItems = subCollectionSnapshot.docs.map((subDoc) {
        return SubItem.fromMap(subDoc.data());
      }).toList();
      return CloudGenderModel.fromMap(doc.data(), subItems);
    }).toList();

    return Future.wait(futures);
  }
}
