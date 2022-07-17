import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/houses_screen.dart';

import '../../dependency.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentNumber = TextEditingController();
    final date = TextEditingController();
    final owner = TextEditingController();
    final amount = TextEditingController();
    final coveredMonth = TextEditingController();
    final address = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            'payment number',
            controller: paymentNumber,
          ),
          CustomTextField(
            'date',
            controller: date,
          ),
          CustomTextField(
            'owner',
            controller: owner,
          ),
          CustomTextField(
            'amount',
            controller: amount,
          ),
          CustomTextField(
            'coveredMonth',
            controller: coveredMonth,
          ),
          CustomTextField(
            'address',
            controller: address,
          ),
          GestureDetector(
            onTap: () async {
              final house = HouseRecordEntity(
                paymentNumber: paymentNumber.text,
                date: date.text,
                ownerName: owner.text,
                amount: amount.text,
                coveredMonth: coveredMonth.text,
                address: address.text,
              );
              context.read<HouseCubit>().add(house);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider<HouseCubit>(
                            create: (context) => sl<HouseCubit>()..getHouses(),
                            child: const HousesScreen(),
                          )));
            },
            child: const CustomBtnText(
              'ADD',
            ),
          ),
        ],
      ),
    );
  }
}
