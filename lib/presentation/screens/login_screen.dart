import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:house_record/core/utils/helper_widget.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogINState();
}

class _LogINState extends State<LogInScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final pin = TextEditingController();
  @override
  void dispose() {
    pin.dispose();
    super.dispose();
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
              color: color3,
              letterSpacing: 3,
              weight: FontWeight.w700,
            ),
            addVerticalSpace(20),
            CustomTextField(
              'email',
              controller: email,
              keyboard: TextInputType.emailAddress,
              color: color1,
              radius: 0,
              prefix: const Icon(
                Icons.email_outlined,
              ),
            ),
            addVerticalSpace(16),
            CustomTextField(
              'password',
              controller: password,
              obscureText: true,
              color: color1,
              radius: 0,
              prefix: const Icon(
                Icons.lock_open_rounded,
              ),
            ),
            addVerticalSpace(25),
            BtnFilled(
              width: 180,
              onTap: () async {
                context.read<HouseCubit>().logIn(email.text, password.text);
              },
              text: 'log in',
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
