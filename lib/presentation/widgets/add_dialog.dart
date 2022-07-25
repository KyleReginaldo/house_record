import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:intl/intl.dart';

import 'package:house_record/core/theme/colors.dart';

import '../../domain/entity/house_record_entity.dart';
import '../cubit/house_cubit.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({
    Key? key,
  }) : super(key: key);

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
  final phase = TextEditingController();
  @override
  void dispose() {
    date.dispose();
    paymentNumber.dispose();
    owner.dispose();
    amount.dispose();
    coveredMonth.dispose();
    address.dispose();
    phase.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: color2,
      title: const CustomText(
        'ADD RECORD',
        letterSpacing: 3,
        textAlign: TextAlign.center,
        size: 15,
        color: color1,
        weight: FontWeight.w700,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'OR number',
            controller: paymentNumber,
            keyboard: TextInputType.number,
            color: color1,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'date',
            controller: date,
            color: color1,
            radius: 0,
            suffix: IconButton(
              onPressed: () async {
                DateTime? datepicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now());
                setState(() {
                  date.text = DateFormat('dd/MMM/yyyy')
                      .format(datepicked ?? DateTime.now());
                });
              },
              icon: const Icon(
                Icons.date_range_outlined,
                color: color3,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'owner',
            controller: owner,
            color: color1,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'amount',
            controller: amount,
            keyboard: TextInputType.number,
            color: color1,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'coveredMonth',
            controller: coveredMonth,
            color: color1,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'address',
            controller: address,
            color: color1,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'phase',
            controller: phase,
            color: color1,
            radius: 0,
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
                color: Colors.red,
                size: 30,
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
                  phase: phase.text.toLowerCase(),
                );
                context.read<HouseCubit>().add(house);
                Navigator.pop(context);
              },
              icon: const Iconify(
                Ic.sharp_add_task,
                color: Colors.green,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }
}
