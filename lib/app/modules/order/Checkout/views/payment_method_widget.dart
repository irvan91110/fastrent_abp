import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final String Title;
  final String value;
  final String GroupValue;
  final String IconUrl;
  final Function(String?)? onChanged;

  PaymentMethod({
    required this.Title,
    required this.value,
    required this.GroupValue,
    required this.IconUrl,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                SizedBox(
                  height: 25,
                  width: 30,
                  child: Image.network(
                    IconUrl,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(Title),
              ],
            ),
            Radio(
              value: value,
              groupValue: GroupValue, //controller.selectedPayment.value
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}
