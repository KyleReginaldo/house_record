import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:intl/intl.dart';

import '../../core/utils/helper_widget.dart';
import '../../domain/entity/house_record_entity.dart';

class DetailScreen extends StatelessWidget {
  final HouseRecordEntity record;
  const DetailScreen({Key? key, required this.record}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
