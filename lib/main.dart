// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habit_tracker/calendar_screen.dart';
import 'package:habit_tracker/core/utils/theme.dart';
import 'package:habit_tracker/screens/home/bloc/habit_bloc.dart';
import 'package:habit_tracker/screens/home/model/habit_model.dart';
import 'package:habit_tracker/screens/home/presentation/home_page.dart';
import 'package:habit_tracker/screens/home/presentation/home_screen.dart';
import 'package:habit_tracker/screens/splash/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/services/localStorage/app_local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppLocalStorage.init();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitModelAdapter());
  await Hive.openBox<HabitModel>('habits');
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabitBloc(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('ar')],
        locale: Locale('ar'),
        theme: AppThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // home: SplashScreen(),
      ),
    );
  }
}
