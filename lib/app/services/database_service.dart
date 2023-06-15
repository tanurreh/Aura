import 'package:Aura/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference<UserModel?> get userCollection => _firestore
          .collection('users')
          .withConverter(fromFirestore: (snapshot, options) {
        return snapshot.exists ? UserModel.fromMap(snapshot.data()!) : null;
      }, toFirestore: (object, options) {
        return object!.toMap();
      });
}
