import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general/general.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:intl/intl.dart';

import 'package:house_record/core/theme/colors.dart';

import '../../domain/entity/house_record_entity.dart';
import '../cubit/house_cubit.dart';

class UpdateDialog extends StatefulWidget {
  final String uid;
  final HouseRecordEntity house;
  const UpdateDialog({
    Key? key,
    required this.uid,
    required this.house,
  }) : super(key: key);

  @override
  State<UpdateDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<UpdateDialog> {
  final paymentNumber = TextEditingController();
  final date = TextEditingController();
  final owner = TextEditingController();
  final amount = TextEditingController();
  final coveredMonth = TextEditingController();
  final address = TextEditingController();
  @override
  void initState() {
    date.text = DateFormat('dd MMM yyyy, KK:mm a').format(DateTime.now());
    paymentNumber.text = widget.house.paymentNumber;
    owner.text = widget.house.ownerName;
    amount.text = widget.house.amount;
    coveredMonth.text = widget.house.coveredMonth;
    address.text = widget.house.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: color1,
      title: const CustomText(
        'UPDATE RECORD',
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
            'OR number',
            controller: paymentNumber,
            keyboard: TextInputType.number,
            color: color4,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'date',
            controller: date,
            defaultData: date.text,
            color: color4,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'owner',
            controller: owner,
            color: color4,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'amount',
            controller: amount,
            keyboard: TextInputType.number,
            color: color4,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'coveredMonth',
            controller: coveredMonth,
            color: color4,
            radius: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: CustomTextField(
            'address',
            controller: address,
            color: color4,
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
                context.read<HouseCubit>().updateHouse(widget.uid, house);
                context.read<HouseCubit>().getHouses();
                Navigator.pop(context);
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
