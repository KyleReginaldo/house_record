import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';

import '../../core/theme/colors.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('HOUSE RECORD'),
        elevation: 0,
        leading: Image.asset(
          'assets/logo.png',
        ),
        actions: [
          IconButton(
              onPressed: () async {
                context.read<HouseCubit>().logOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: BlocBuilder<HouseCubit, HouseState>(
        builder: (context, state) {
          if (state is Loaded) {
            return Column(
              children: state.houses.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 10),
                  child: ListTile(
                    tileColor: color2,
                    textColor: color4,
                    title: CustomText(e.ownerName),
                    subtitle: CustomText(e.address),
                    trailing: CustomText(e.coveredMonth),
                  ),
                );
              }).toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
