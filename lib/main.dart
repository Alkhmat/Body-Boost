import 'package:body_boost/firebase/options/firebase_options.dart';

import 'package:body_boost/view/start/home_start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BodyBoost());
}

class BodyBoost extends StatelessWidget {
  const BodyBoost({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeStart(),
    );
  }
}
