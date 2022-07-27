import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/widgets/text.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:house_record/presentation/cubit/getrolecubit/getrole_cubit.dart';
import 'package:house_record/presentation/cubit/getusercubit/getuser_cubit.dart';
import 'package:house_record/presentation/screens/accounts_screen.dart';

import '../../dependency.dart';
import '../cubit/getrolecubit/getrole_cubit.dart';
import '../cubit/house/house_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: color3,
        child: BlocBuilder<GetRoleCubit, UserState>(
          builder: (context, state) {
            if (state is SuperAdmin) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    child: Image.asset(
                      'assets/grs.png',
                    ),
                  ),
                  const Divider(
                    color: color1,
                    thickness: 2,
                  ),
                  ListTile(
                    textColor: color1,
                    leading: const Icon(
                      Icons.mail_outline,
                      color: color1,
                    ),
                    title: CustomText(
                      FirebaseAuth.instance.currentUser?.email ?? "",
                      size: 14,
                    ),
                    subtitle: CustomText(
                      'role: ${state.user.role}',
                    ),
                  ),
                  ListTile(
                    textColor: color1,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider<GetuserCubit>(
                                    create: (context) =>
                                        sl<GetuserCubit>()..getUserAccounts(),
                                  ),
                                  BlocProvider<GetRoleCubit>(
                                    create: (context) => sl<GetRoleCubit>()
                                      ..getUserInFirestore(FirebaseAuth
                                              .instance.currentUser?.email ??
                                          ""),
                                  ),
                                ],
                                child: const AccountsScreen(),
                              )));
                    },
                    title: const CustomBtnText(
                      'accounts',
                      color: color1,
                    ),
                    leading: const Icon(
                      Icons.account_circle_outlined,
                      color: color1,
                    ),
                  ),
                  ListTile(
                    textColor: color1,
                    onTap: () async {
                      context.read<HouseCubit>().logOut();
                    },
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: color1,
                    ),
                    title: const CustomBtnText(
                      'Log out',
                      color: color1,
                    ),
                  ),
                ],
              );
            } else if (state is Admin) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    child: Image.asset(
                      'assets/grs.png',
                    ),
                  ),
                  const Divider(
                    color: color1,
                    thickness: 2,
                  ),
                  ListTile(
                    textColor: color1,
                    leading: const Icon(
                      Icons.mail_outline,
                      color: color1,
                    ),
                    title: CustomText(
                      FirebaseAuth.instance.currentUser?.email ?? "",
                      size: 14,
                    ),
                    subtitle: CustomText(
                      'role: ${state.user.role}',
                    ),
                  ),
                  ListTile(
                    textColor: color1,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider<GetuserCubit>(
                                    create: (context) =>
                                        sl<GetuserCubit>()..getUserAccounts(),
                                  ),
                                  BlocProvider<GetRoleCubit>(
                                    create: (context) => sl<GetRoleCubit>()
                                      ..getUserInFirestore(FirebaseAuth
                                              .instance.currentUser?.email ??
                                          ""),
                                  ),
                                ],
                                child: const AccountsScreen(),
                              )));
                    },
                    title: const CustomBtnText(
                      'accounts',
                      color: color1,
                    ),
                    leading: const Icon(
                      Icons.account_circle_outlined,
                      color: color1,
                    ),
                  ),
                  ListTile(
                    textColor: color1,
                    onTap: () async {
                      context.read<HouseCubit>().logOut();
                    },
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: color1,
                    ),
                    title: const CustomBtnText(
                      'Log out',
                      color: color1,
                    ),
                  ),
                ],
              );
            } else if (state is FirestoreUser) {
              return Column(
                children: [
                  Image.asset(
                    'assets/grs.png',
                    height: 180,
                    width: 180,
                  ),
                  const Divider(
                    color: color1,
                    thickness: 2,
                  ),
                  ListTile(
                    title: CustomText(
                      FirebaseAuth.instance.currentUser?.email ?? "",
                      size: 14,
                      color: color1,
                    ),
                    subtitle: CustomText(
                      'role: ${state.user.role}',
                      color: color1,
                    ),
                    leading: const Icon(
                      Icons.mail_outline,
                      color: color1,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      context.read<HouseCubit>().logOut();
                    },
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: color1,
                    ),
                    title: const CustomBtnText(
                      'Log out',
                      color: color1,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
