import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/core/utils/helper_widget.dart';
import 'package:house_record/domain/entity/user_entity.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';

import '../../core/theme/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final repass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              'email',
              controller: email,
              color: color4,
              keyboard: TextInputType.emailAddress,
              radius: 0,
            ),
            addVerticalSpace(16),
            CustomTextField(
              'password',
              controller: password,
              color: color4,
              radius: 0,
            ),
            addVerticalSpace(16),
            CustomTextField(
              're-enter password',
              controller: repass,
              color: color4,
              radius: 0,
              validator: (value) {
                if (!value!.contains(password.text)) {
                  return 'password doesnt match';
                }
                return null;
              },
            ),
            addVerticalSpace(25),
            InkWell(
              onTap: () async {
                final user = UserEntity(
                  email: email.text,
                  password: password.text,
                  isAdmin: false,
                );
                context.read<HouseCubit>().addUser(user);
                context.read<HouseCubit>().register(email.text, password.text);

                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 250,
                decoration: const BoxDecoration(
                  color: color4,
                ),
                child: const CustomBtnText(
                  'Register',
                  color: color5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
