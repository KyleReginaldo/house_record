import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/detailscreen.dart';

import '../../dependency.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: color4,
          ),
        ),
        title: CustomTextField(
          'sarch address',
          controller: searchController,
          suffix: const Icon(
            Icons.search,
            color: color4,
          ),
          radius: 0,
          color: color3,
          onChanged: (value) {
            if (value.isNotEmpty) {
              context.read<HouseCubit>().searchPayment(value);
            }
          },
        ),
      ),
      body: BlocBuilder<HouseCubit, HouseState>(
        builder: (context, state) {
          if (state is Loaded) {
            return Column(
              children: state.houses.map((house) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider<HouseCubit>(
                                  create: (context) => sl<HouseCubit>(),
                                  child: DetailScreen(
                                    record: house,
                                    uid: house.uid,
                                  ),
                                )));
                  },
                  tileColor: color2,
                  textColor: color4,
                  title: CustomText(house.ownerName),
                  subtitle: CustomText(house.address),
                  trailing: CustomText(house.coveredMonth),
                );
              }).toList(),
            );
          } else if (state is Loading) {
            return const LinearProgressIndicator();
          } else if (state is Empty) {
            return const Align(
              alignment: Alignment.center,
              child: CustomText(
                'NO RESULT',
                color: Colors.grey,
                size: 25,
                letterSpacing: 4,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
