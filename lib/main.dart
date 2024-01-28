import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/my_bloc_observer.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_application_1/myApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHealper.init();
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}
