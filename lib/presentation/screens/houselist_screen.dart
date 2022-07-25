import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/widgets/text.dart';

import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/detailscreen.dart';

import '../../core/theme/colors.dart';
import '../../dependency.dart';

class HouseListScreen extends StatelessWidget {
  const HouseListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocBuilder<HouseCubit, HouseState>(
        builder: (context, state) {
          if (state is Loaded) {
            return Column(
              children: state.houses
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        tileColor: color1,
                        textColor: color3,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<HouseCubit>(
                              create: (context) => sl<HouseCubit>(),
                              child: DetailScreen(
                                uid: e.uid,
                                record: e,
                              ),
                            ),
                          ),
                        ),
                        title: CustomText(e.ownerName),
                        subtitle: CustomText(e.address),
                        trailing: CustomText(e.phase),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else if (state is Empty) {
            return const Align(
              alignment: Alignment.center,
              child: CustomBtnText('Empty phase'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
