import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/login_screen.dart';
import 'package:house_record/presentation/screens/user_screen.dart';

import '../../dependency.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BlocProvider<HouseCubit>(
            create: (context) => sl<HouseCubit>()..getHouses(),
            child: const UserScreen(),
          );
        } else {
          return const LogInScreen();
        }
      },
    );
  }
}
