import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HouseCubit, HouseState>(
        builder: (context, state) {
          if (state is Loaded) {
            print(state.houses);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.houses
                  .map(
                    (e) => ListTile(
                      title: Text(e.paymentNumber),
                    ),
                  )
                  .toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
