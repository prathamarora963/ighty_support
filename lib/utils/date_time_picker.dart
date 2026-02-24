import 'package:intl/intl.dart';

import 'all_imports.dart';

class DateTimePicker {
  static Future<String> selectTime({required TimeOfDay initialTime}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.themeColor,
              onSurface: AppColor.blackColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: WidgetStateProperty.resolveWith(
                        (states) => AppColor.whiteColor),
                foregroundColor: WidgetStateProperty.resolveWith(
                        (states) => AppColor.blackColor),
                overlayColor: WidgetStateProperty.resolveWith(
                        (states) => AppColor.blackColor),
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
        );
      },
    );
    if (pickedTime != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
          now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      final formattedTime = DateFormat('hh:mm a').format(dateTime);
      return formattedTime;
    }
    return "";
  }

  static Future<String> selectDate({String? dateFormat,required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate}) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                onPrimary: AppColor.whiteColor,
                primary: AppColor.themeColor,
                surface: AppColor.whiteColor,
                onSurface: AppColor.blackColor,
              ),
              dialogBackgroundColor: AppColor.whiteColor,
            ),
            child: child!,
          );
        },
        context: Get.context!,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (pickedDate != null) {
      return DateFormat(dateFormat ?? 'MM/dd/yyyy')
          .format(pickedDate)
          .toString();
    }
    return "";
  }
}