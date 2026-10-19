import 'package:edulearn_mobile/edulearn_app.dart';
import 'package:edulearn_mobile/observer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //setup blocObserver
  Bloc.observer = AppBlocObserver();
  runApp(const EdulearnApp());
}
