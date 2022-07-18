import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:house_record/core/theme/text_theme.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/auth_screen.dart';
import 'dependency.dart' as dependency;
import 'dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dependency.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House Record',
      theme: ThemeData(
        textTheme: quicksandTextTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: color1,
        ),
        scaffoldBackgroundColor: color1,
      ),
      home: BlocProvider<HouseCubit>(
        create: (context) => sl<HouseCubit>(),
        child: const AuthScreen(),
      ),
    );
  }
}
