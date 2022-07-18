import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:house_record/core/theme/colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:intl/intl.dart';

import '../../../domain/entity/house_record_entity.dart';
import '../../cubit/house_cubit.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final paymentNumber = TextEditingController();
  final date = TextEditingController();
  final owner = TextEditingController();
  final amount = TextEditingController();
  final coveredMonth = TextEditingController();
  final address = TextEditingController();
  @override
  void initState() {
    date.text = DateFormat('dd MMM yyyy, KK:mm a').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: color1,
      title: const CustomText(
        'ADD RECORD',
        letterSpacing: 2,
        textAlign: TextAlign.center,
        size: 15,
        color: color4,
        weight: FontWeight.w700,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'payment number',
            controller: paymentNumber,
            keyboard: TextInputType.number,
            color: color4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'date',
            controller: date,
            defaultData: date.text,
            color: color4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'owner',
            controller: owner,
            color: color4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'amount',
            controller: amount,
            keyboard: TextInputType.number,
            color: color4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'coveredMonth',
            controller: coveredMonth,
            color: color4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'address',
            controller: address,
            color: color4,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.orange,
              ),
            ),
            IconButton(
              onPressed: () async {
                final house = HouseRecordEntity(
                  paymentNumber: paymentNumber.text,
                  date: date.text,
                  ownerName: owner.text,
                  amount: amount.text,
                  coveredMonth: coveredMonth.text,
                  address: address.text.toLowerCase(),
                );
                context.read<HouseCubit>().add(house);
                context.read<HouseCubit>().getHouses();
                Navigator.pop(context);
              },
              icon: const Iconify(
                Ic.sharp_add_task,
                color: color3,
              ),
            ),
          ],
        )
      ],
    );
  }
}
