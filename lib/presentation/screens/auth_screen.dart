import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/homescreen.dart';
import 'package:house_record/presentation/screens/login_screen.dart';

import '../../dependency.dart';
import '../cubit/getrole_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data as User;

          return MultiBlocProvider(
            providers: [
              BlocProvider<HouseCubit>(
                create: (context) => sl<HouseCubit>(),
              ),
              BlocProvider<GetRoleCubit>(
                create: (context) =>
                    sl<GetRoleCubit>()..getUserInFirestore(user.email!),
              ),
            ],
            child: const HomeScreen(),
          );
        } else {
          return const LogInScreen();
        }
      },
    );
  }
}
