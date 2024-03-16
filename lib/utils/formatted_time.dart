import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Function to format a DateTime object to a time string based on device settings
String formattedTime({
  required DateTime dateTime,
  required BuildContext context,
}) {
  // Check if the device is set to use the 24-hour format
  bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;

  // Format the time either in 24-hour format or AM/PM format
  String formattedTime = is24HoursFormat
      ? DateFormat.Hm().format(dateTime) // Use 24-hour format
      : DateFormat('h:mm a').format(dateTime); // Use AM/PM format

  // Return the formatted time
  return formattedTime;
}
