import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:fastrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fastrent/app/data/utils/app_text_style.dart';
import '../controllers/pages_home_controller.dart';

// ignore: camel_case_types, must_be_immutable
class pagesHomeView extends GetView<PagesHomeController> {
  pagesHomeView({Key? key}) : super(key: key);

  @override
  PagesHomeController controller = PagesHomeController();
  final List<String> seatitems = [
    '4',
    '8',
  ];
  final List<String> transmision = [
    'Manual',
    'Matic',
  ];
  bool _isClicked = false;

  bool kembaliisClicked = false;
  String? seat;
  String? transmisions;
  List<DateTime?> _dialogCalendarPickerValue = [];

  List<DateTime?> dialogCalendarPickerValue = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fastrent',
          style: AppTextStyles.topnavbar,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cari Mobil',
                  style: AppTextStyles.h2,
                )),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kami memiliki lebih dari 300 mobil  yang tersedia untuk kamu sewa dengan harga termurah  ',
                  style: AppTextStyles.subtitle,
                )),
            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                //Add isDense true and zero Padding.
                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                //Add more decoration as you want here
                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
              ),
              hint: Row(
                children: [
                  const Icon(
                    Icons.group,
                    color: Colors.black45,
                  ),
                  Text(
                    seat == null ? ' Select Seat' : '$seat seat',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14),
                  ),
                ],
              ),
              items: seatitems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.group,
                              color: Colors.black45,
                            ),
                            Text(
                              " $item seat",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                seat = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                height: 60,
                padding: EdgeInsets.only(left: 10, right: 10),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                //Add isDense true and zero Padding.
                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                //Add more decoration as you want here
                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
              ),
              isExpanded: true,
              hint: Row(
                children: [
                  Icon(
                    Icons.electric_car,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Text(
                    transmisions == null
                        ? ' Select Transmision'
                        : transmisions.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14),
                  ),
                ],
              ),
              items: transmision
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Row(
                          children: [
                            Icon(
                              Icons.electric_car,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            Text(
                              ' $item',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                transmisions = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                height: 60,
                padding: EdgeInsets.only(left: 10, right: 10),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(
                    () => TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: PagesHomeController.startdatex.value,
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        prefixIcon: const Icon(Icons.calendar_month),
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: _isClicked
                            ? FloatingLabelBehavior.always
                            : FloatingLabelBehavior.never,
                        labelText: 'Sewa',
                      ),
                      onTap: () async {
                        _isClicked = true;
                        kembaliisClicked = false;
                        dialogCalendarPickerValue = [];
                        PagesHomeController.startdatex.value = '';
                        final values = await showCalendarDatePicker2Dialog(
                          context: context,
                          config: controller.configx('start'),
                          dialogSize: const Size(325, 400),
                          borderRadius: BorderRadius.circular(15),
                          value: _dialogCalendarPickerValue,
                          dialogBackgroundColor: Colors.white,
                        );

                        if (values != null) {
                          // ignore: avoid_print
                          controller.getValueText(
                            'start',
                            values,
                          );

                          _dialogCalendarPickerValue = values;
                        }
                      },
                    ),
                  ),
                ),
                Container(width: 5, color: Colors.transparent),
                Expanded(
                  child: Obx(
                    () => TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'kembali',
                        hintText: controller.enddatex.value,
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        prefixIcon: const Icon(Icons.calendar_month),
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: kembaliisClicked
                            ? FloatingLabelBehavior.always
                            : FloatingLabelBehavior.never,
                      ),
                      onTap: () async {
                        kembaliisClicked = true;

                        if (PagesHomeController.startdatex.value != '') {
                          final valuess = await showCalendarDatePicker2Dialog(
                            context: context,
                            config: controller.configx('end'),
                            dialogSize: const Size(325, 400),
                            borderRadius: BorderRadius.circular(15),
                            value: dialogCalendarPickerValue,
                            dialogBackgroundColor: Colors.white,
                          );
                          if (valuess != null) {
                            // ignore: avoid_print
                            controller.getValueText(
                              'end',
                              valuess,
                            );

                            dialogCalendarPickerValue = valuess;
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Rcolors.primaryVariant,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () async {
                    Get.toNamed(Routes.SEARCH, arguments: {
                      "sd": PagesHomeController.startdatex.value,
                      "ed": controller.enddatex.value,
                      "seat": seat,
                      "transmisi": transmisions,
                    });
                  },
                  child: const Text(
                    'Seach',
                    style: AppTextStyles.button,
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
