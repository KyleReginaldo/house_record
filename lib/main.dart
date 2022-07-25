import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:house_record/core/theme/text_theme.dart';
import 'package:house_record/data/model/suggestion_model.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/auth_screen.dart';
import 'dependency.dart' as dependency;
import 'dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dependency.init();
  await Hive.initFlutter();
  Hive.registerAdapter(SuggestionModelAdapter());
  await Hive.openBox('Suggestions_edited');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House Record',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: quicksandTextTheme,
        primaryColor: color1,
        buttonTheme: const ButtonThemeData(buttonColor: color1),
      ),
      home: BlocProvider<HouseCubit>(
        create: (context) => sl<HouseCubit>(),
        child: const AuthScreen(),
      ),
    );
  }
}
