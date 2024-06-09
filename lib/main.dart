import 'package:body_boost/firebase/options/firebase_options.dart';

import 'package:body_boost/view/start/start_pages/home_start.dart';
import 'package:body_boost/view/start/start_cubit/start_click.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClickCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeStart(),
      ),
    );
  }
}
