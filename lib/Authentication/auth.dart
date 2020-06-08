import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Stream<String> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged.map(
            (FirebaseUser user) => user?.uid,
      );
  Future<String> updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName=name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;
  }

  //covert
  Future convertUserWIthEmail(String email, String password,String name)async{
    final currentuser = await _firebaseAuth.currentUser();
    final credential= EmailAuthProvider.getCredential(email: email,password: password);
    await currentuser.linkWithCredential(credential);
    await updateUserName(name, currentuser);
  }

}





