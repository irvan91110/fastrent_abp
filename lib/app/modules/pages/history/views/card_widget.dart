import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCardWidget extends StatelessWidget {
  final String bookid;
  final String price;
  final String start;
  final String end;
  final String status;
  final Function() onChanged;

  CustomCardWidget({
    required this.bookid,
    required this.price,
    required this.start,
    required this.end,
    required this.status,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Booking ID "),
                        Text(
                          bookid,
                          style: TextStyle(color: Rcolors.primary),
                        ),
                      ],
                    ),
                    Text("Rp $price.00"),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 222, 220, 220),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: Row(
                    children: [
                      Text(DateFormat.yMMMEd()
                          .format(DateTime.parse(start))
                          .toString()),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("-"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(DateFormat.yMMMEd()
                          .format(DateTime.parse(end))
                          .toString()),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(status),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
