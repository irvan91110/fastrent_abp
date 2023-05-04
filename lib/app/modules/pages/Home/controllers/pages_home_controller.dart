import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:fastrent/app/modules/pages/Home/views/pages_home_view.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import 'package:flutter/material.dart';

class PagesHomeController extends GetxController {
// It is mandatory initialize with one value from listType
  static var startdatex = ''.obs;
  var enddatex = ''.obs;

  static DateTime startdates = startdatex.value == ''
      ? DateTime.now()
      : DateTime.parse(startdatex.value);

  static DateTime enddate = DateTime.now();

  static const dayTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w700);

  DateTime? getValueText(
    String properties,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();

    if (values.isNotEmpty) {
      if (properties == 'start') {
        final start = values[0].toString().replaceAll(' 00:00:00.000', '');

        startdatex.value = start;
        startdates = DateTime.parse(start);
        return startdates;
      } else if (properties == 'end') {
        final endDate = values[0].toString().replaceAll(' 00:00:00.000', '');
        enddatex.value = endDate;
        enddate = DateTime.parse(endDate);
        return DateTime.parse(enddatex.value);
      }
    }

    return null;
  }

  configx(properties) {
    return CalendarDatePicker2WithActionButtonsConfig(
      firstDate: startdatex.value == ''
          ? DateTime.now()
          : DateTime.parse(startdatex.value),
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: Rcolors.primary,
      closeDialogOnCancelTapped: true,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
    );
  }
}
