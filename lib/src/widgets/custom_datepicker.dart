import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user/user_provider.dart';

class CustomDatepicker extends StatefulWidget {
  const CustomDatepicker({super.key});

  @override
  State<CustomDatepicker> createState() => _CustomDatepickerState();
}

class _CustomDatepickerState extends State<CustomDatepicker> {
  Future<DateTime> _selectDate(BuildContext context, age) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: age,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != age) {
      return picked;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "${userProvider.age.toLocal()}".split(' ')[0],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          onPressed: () async {
            final age = await _selectDate(context, userProvider.age);
            userProvider.handleAge(age);
          },
          child: const Text(
            'Fecha de nacimineto',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
