import "package:firebase_login/material_setup.dart";
import "package:firebase_login/utils.dart";
import "package:flutter/material.dart";

main(List<String> args) async{
  await setup();
  runApp(const TMaterialAppSetUp());
}

Future<void> setup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseSetUp();
  rigisterService();
  

  // await rigisterService();
}