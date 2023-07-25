import 'package:bloc/bloc.dart';
import 'package:eticaret/Core/utilis/CachHelper.dart';
import 'package:flutter/material.dart';

import 'Core/utilis/Observer/Observer.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}




