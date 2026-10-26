import 'package:edulearn_mobile/core/storage/storage_shared_preferences.dart';
import 'package:edulearn_mobile/edulearn_app.dart';
import 'package:edulearn_mobile/observer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/di/injection_container.dart';

void main() async {
  await dotenv.load(fileName: "assets/env/.env");
  WidgetsFlutterBinding.ensureInitialized();
  //load env file
  //setup blocObserver
  Bloc.observer = AppBlocObserver();
  await Future.wait([
    StorageSharedPreferences.storage.init(),
    setupDependencies(),
  ]);
  runApp(const EdulearnApp());
}
