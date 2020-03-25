import 'package:flutter_ui_challenges/core/data/firestore_service.dart';
import 'package:flutter_ui_challenges/features/auth/data/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirestoreService {
  static final AuthFirestoreService _practiceTestFirestoreService =
      AuthFirestoreService._internal();
  factory AuthFirestoreService() {
    return _practiceTestFirestoreService;
  }
  AuthFirestoreService._internal();

  Future<void> saveUser(FirebaseUser user) {
    return FirestoreService().updateDocument(
        'users',
        user.uid,
        {
          "name": user.displayName,
          "photo_url": user.photoUrl,
          "email": user.email,
        },
        merge: true);
  }

  Stream<User> getUser(String id) {
    return FirestoreService().getDocument('users', id).map(
          (doc) => User.fromMap({"name":"zx",
            "email":"1222@gmail.com",
            "photo_url":"https://img.vipkidstatic.com/ter/tr/img/6d8f07f8d8a647a4b21377a69eabd02b.png",
          }, "ddd"),
        );
  }

  Future<User> getUserAsync(String id) async {
    var fs = await FirestoreService().getDocumentAsync('users', id);
    if(fs!=null)
      return User.fromMap(fs.data,fs.documentID);
    return null;
  }

  Future<void> updateUserData(String id, Map<String,dynamic> data) {
    return FirestoreService().updateDocument('users', id, data,merge: true);
  }
}
