import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:house_record/core/utils/helper_widget.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/homescreen.dart';
import 'package:house_record/presentation/screens/register_screen.dart';

import '../../dependency.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogINState();
}

class _LogINState extends State<LogInScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  void adminLogIn() async {
    FirebaseFirestore.instance
        .collection('admin')
        .doc('adminLogin')
        .snapshots()
        .forEach((element) {
      if (element.data()?['email'] == email.text &&
          element.data()?['password'] == password.text) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider<HouseCubit>(
              create: (context) => sl<HouseCubit>()..getHouses(),
              child: const HomeScreen(),
            ),
          ),
        );
        email.clear();
        password.clear();
      } else {
        context.read<HouseCubit>().logIn(email.text, password.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/houselogo.png',
              height: 80,
            ),
            const CustomText(
              'HOUSE RECORD',
              color: color4,
            ),
            addVerticalSpace(20),
            CustomTextField(
              'email',
              controller: email,
              keyboard: TextInputType.emailAddress,
              color: color4,
              radius: 0,
            ),
            addVerticalSpace(16),
            CustomTextField(
              'password',
              controller: password,
              obscureText: true,
              color: color4,
              radius: 0,
            ),
            addVerticalSpace(25),
            InkWell(
              onTap: () async {
                adminLogIn();
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: color4,
                ),
                width: 250,
                height: 40,
                child: const Center(
                  child: CustomBtnText(
                    'Log In',
                    color: color5,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            addVerticalSpace(16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<HouseCubit>(
                      create: (context) => sl<HouseCubit>(),
                      child: const RegisterScreen(),
                    ),
                  ),
                );
              },
              child: const CustomText(
                'Dont have account? REGISTER',
                color: color3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
