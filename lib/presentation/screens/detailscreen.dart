import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:intl/intl.dart';

import 'package:house_record/core/theme/colors.dart';

import '../../core/utils/helper_widget.dart';
import '../../dependency.dart';
import '../../domain/entity/house_record_entity.dart';
import '../cubit/house_cubit.dart';
import '../widgets/update_dialog.dart';

class DetailScreen extends StatelessWidget {
  final String uid;
  final HouseRecordEntity record;
  const DetailScreen({
    Key? key,
    required this.uid,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const CustomText(
          'RECORD DETAIL',
          letterSpacing: 2,
          color: color3,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomText(
                record.ownerName.toUpperCase(),
                weight: FontWeight.bold,
                color: color4,
                size: 20,
              ),
            ),
            addVerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  'payment number',
                  color: color4,
                ),
                CustomText(
                  record.paymentNumber,
                  color: color4,
                ),
              ],
            ),
            addVerticalSpace(16),
            const HDivider(
              splitter: 40,
              isDot: true,
              color: color3,
            ),
            addVerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  'amount',
                  color: color4,
                ),
                CustomText(
                  NumberFormat.currency(
                          locale: 'fil', symbol: '₱', decimalDigits: 2)
                      .format(
                    double.parse(record.amount),
                  ),
                  color: color4,
                ),
              ],
            ),
            addVerticalSpace(16),
            const HDivider(
              splitter: 40,
              isDot: true,
              color: color3,
            ),
            addVerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  'address',
                  color: color4,
                ),
                CustomText(
                  record.address.toUpperCase(),
                  color: color4,
                ),
              ],
            ),
            addVerticalSpace(16),
            const HDivider(
              splitter: 40,
              isDot: true,
              color: color3,
            ),
            addVerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  'covered month',
                  color: color4,
                ),
                CustomText(
                  record.coveredMonth.toUpperCase(),
                  color: color4,
                ),
              ],
            ),
            addVerticalSpace(16),
            const HDivider(
              splitter: 40,
              isDot: true,
              color: color3,
            ),
            addVerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  'date',
                  color: color4,
                ),
                CustomText(
                  record.date,
                  color: color4,
                ),
              ],
            ),
            addVerticalSpace(16),
            const HDivider(
              splitter: 40,
              isDot: true,
              color: color3,
            ),
            addVerticalSpace(16),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => BlocProvider<HouseCubit>(
                            create: (context) => sl<HouseCubit>(),
                            child: UpdateDialog(
                              uid: uid,
                              house: record,
                            ),
                          ));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: color3,
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                    child: CustomBtnText(
                      'Update',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
