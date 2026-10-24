import 'package:edulearn_mobile/core/storage/storage_shared_preferences.dart';
import 'package:edulearn_mobile/edulearn_app.dart';
import 'package:edulearn_mobile/observer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //setup blocObserver
  Bloc.observer = AppBlocObserver();
  await StorageSharedPreferences.storage.init();
  runApp(const EdulearnApp());
}
