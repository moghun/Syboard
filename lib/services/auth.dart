import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:syboard/models/user_obj.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _userFromFirebase(User? user) {
    return user;
  }

  Stream<User?> get user {
    return _auth.userChanges().map(_userFromFirebase);
  }

  UserObj? getCurrentUser(){
    if(_auth.currentUser == null) return null;
    UserObj tempUser = UserObj(uid: _auth.currentUser!.uid, name: _auth.currentUser?.displayName, email: _auth.currentUser?.email);
    return tempUser;
  }

  Future changePassword(String newPassword) async {
    try{
      _auth.currentUser?.updatePassword(newPassword);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> loginUser(String email, String password) async {

    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<void> signUpUser(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<void> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future googleSignIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
    User user = result.user!;
    await user.updatePhotoURL("https://i.ibb.co/4Vw6XL0/logo-JPGblue-removebg.png");
    return _userFromFirebase(user);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updatePassword(String oldPass, String newPass) async {
    AuthCredential cred = EmailAuthProvider.credential(
        email: _auth.currentUser!.email!, password: oldPass);
    try {
      await _auth.currentUser!.reauthenticateWithCredential(cred);
      await _auth.currentUser!.updatePassword(newPass);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future updateName(String newName) async {
    try {
      await _auth.currentUser!.updateDisplayName(newName);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future updateMail(String newMail, String pass) async {
    AuthCredential cred = EmailAuthProvider.credential(
        email: _auth.currentUser!.email!, password: pass);
    try {
      await _auth.currentUser!.reauthenticateWithCredential(cred);
      await _auth.currentUser!.updateEmail(newMail);
      return true;
    } catch (e) {
      return null;
    }
  }
}