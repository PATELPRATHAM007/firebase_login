import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/firebase_options.dart';
import 'package:firebase_login/services/firebase_auth_service.dart';
import 'package:get/get.dart';


Future<void> firebaseSetUp() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("firebase was initialized perfectly");
  } catch (e) {
    print(e);
  }
}

void rigisterService(){
  try {
  Get.put<FirebaseAuthService>(FirebaseAuthService());
  print("Firebase Auth Service was initialized perfectly"); 
  } catch (e) {
    print(e);
  }
}

