import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/detailscreen.dart';
import 'package:house_record/presentation/screens/searchscreen.dart';
import 'package:house_record/presentation/widgets/add_dialog.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';

import '../../core/theme/colors.dart';
import '../../dependency.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider<HouseCubit>(
                            create: (context) => sl<HouseCubit>(),
                            child: const SearchScreen(),
                          )));
            },
            icon: const Iconify(
              Teenyicons.search_property_outline,
              color: color4,
            ),
          ),
          IconButton(
            onPressed: () async {
              Navigator.pop(context);
              // context.read<HouseCubit>().logOut();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: color4,
            ),
          ),
        ],
      ),
      body: BlocBuilder<HouseCubit, HouseState>(
        builder: (context, state) {
          if (state is Loaded) {
            return SingleChildScrollView(
              child: Column(
                children: state.houses.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4, top: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider<HouseCubit>(
                                      create: (context) => sl<HouseCubit>(),
                                      child: DetailScreen(
                                        record: e,
                                        uid: e.uid,
                                      ),
                                    )));
                      },
                      tileColor: color2,
                      textColor: color4,
                      title: CustomText(e.ownerName),
                      subtitle: CustomText(e.address),
                      trailing: CustomText(e.coveredMonth),
                    ),
                  );
                }).toList(),
              ),
            );
          } else if (state is Empty) {
            return const Align(
              alignment: Alignment.center,
              child: CustomText(
                'Empty',
                color: Colors.grey,
                size: 25,
              ),
            );
          } else if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: color4,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color5,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => BlocProvider<HouseCubit>(
                    create: (context) => sl<HouseCubit>(),
                    child: const AddDialog(),
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
