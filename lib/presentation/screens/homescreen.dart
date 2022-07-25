import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/presentation/cubit/getrole_cubit.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';

import 'package:house_record/presentation/cubit/house_cubit.dart';
import 'package:house_record/presentation/screens/searchscreen.dart';
import 'package:house_record/presentation/screens/houselist_screen.dart';

import '../../core/theme/colors.dart';
import '../../dependency.dart';
import '../widgets/add_dialog.dart';

//Lagay mo to later sa global variable

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'HOUSE RECORD',
          letterSpacing: 2,
          size: 15,
          weight: FontWeight.bold,
          color: color1,
        ),
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
              color: color3,
            ),
          ),
          IconButton(
            onPressed: () async {
              context.read<HouseCubit>().logOut();
              // context.read<HouseCubit>().logOut();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: color3,
            ),
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<HouseCubit>(
                  create: (context) => sl<HouseCubit>()..getHouses('phase 1'),
                  child: const HouseListScreen(),
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/phase1.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: const Center(
                child: CustomText(
                  'PHASE 1',
                  weight: FontWeight.bold,
                  letterSpacing: 5,
                  size: 20,
                  color: color2,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<HouseCubit>(
                  create: (context) => sl<HouseCubit>()..getHouses('phase 2'),
                  child: const HouseListScreen(),
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/phase2.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: const Center(
                child: CustomText(
                  'PHASE 2',
                  weight: FontWeight.bold,
                  letterSpacing: 5,
                  size: 20,
                  color: color2,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<HouseCubit>(
                  create: (context) => sl<HouseCubit>()..getHouses('phase 2a'),
                  child: const HouseListScreen(),
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/phase2a.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: const Center(
                child: CustomText(
                  'PHASE 2a',
                  weight: FontWeight.bold,
                  letterSpacing: 5,
                  size: 20,
                  color: color2,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider<HouseCubit>(
                  create: (context) => sl<HouseCubit>()..getHouses('phase 2b'),
                  child: const HouseListScreen(),
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/phase2b.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: const Center(
                child: CustomText(
                  'PHASE 2b',
                  weight: FontWeight.bold,
                  letterSpacing: 5,
                  size: 20,
                  color: color2,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<GetRoleCubit, UserState>(
        builder: (context, state) {
          if (state is Admin) {
            return FloatingActionButton(
              backgroundColor: color1,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider<HouseCubit>(
                    create: (context) => sl<HouseCubit>(),
                    child: const AddDialog(),
                  ),
                );
              },
              tooltip: 'Add Record',
              splashColor: color1,
              child: const Icon(
                Icons.add_home_outlined,
                color: color3,
                size: 35,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
