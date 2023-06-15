
import 'package:Aura/app/app.dart';
import 'package:Aura/app/services/database_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  DatabaseService db = DatabaseService();
  Future<void> addUser(UserModel user) async {
    try {
      var doc = db.userCollection.doc();
      user.uid = doc.id;
      await doc.set(user);
    } on Exception catch (e) {
      showErrorDialog(e.toString());
      return;
    }
  }
}
