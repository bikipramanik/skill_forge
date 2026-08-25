import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/app/app.dart';
import 'package:skill_forge_app/core/utils/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set global BlocObserver for logging state transitions
  Bloc.observer = AppBlocObserver();

  runApp(const SkillForgeApp());
}
