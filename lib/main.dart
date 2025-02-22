

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_app/core/services/get_it_service.dart';
import 'package:fruits_app/core/services/supabase_stoarge.dart';
import 'package:fruits_app/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_app/firebase_options.dart';


import 'core/services/custom_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await SupabaseStoargeService.initSupabase();
  await SupabaseStoargeService.createBuckets('fruits_images');
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   setupGetit();
  Bloc.observer = CustomBlocObserver();
 

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
