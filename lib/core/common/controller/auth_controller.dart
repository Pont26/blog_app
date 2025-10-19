import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  bool get isLoggedIn => firebaseUser.value != null; 

}