import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeService {
  // Get the current date and time
  static final DateTime now = DateTime.now();

  // Method to get the human-readable representation of the day based on the provided date
  static String day(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    // Check if the provided date is today
    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return 'Today';
    }
    // Check if the provided date is yesterday
    else if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day - 1) {
      return 'Yesterday';
    }
    // Check if the difference between now and the provided date is less than or equal to 7 days
    else if (now.difference(dateTime).inDays <= 7) {
      return DateFormat.EEEE().format(dateTime); // Return the day name
    }
    // Otherwise, return the date in the format 'dd MMM yyyy'
    else {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
  }

  // Method to format time based on the device settings
  static String time({
    required DateTime? dateTime,
    required BuildContext context,
  }) {
    if (dateTime == null) {
      return "";
    }
    // Get the current locale's time format
    String timeFormat;

    // Check if the device prefers 24-hour format
    TimeOfDayFormat preferredFormat =
        MediaQuery.of(context).alwaysUse24HourFormat
            ? TimeOfDayFormat.HH_colon_mm
            : TimeOfDayFormat.h_colon_mm_space_a;

    // Format the given DateTime to time based on the device time format
    if (preferredFormat == TimeOfDayFormat.HH_colon_mm) {
      timeFormat = 'HH:mm'; // 24-hour format
    } else {
      timeFormat = 'h:mm a'; // 12-hour format
    }

    return DateFormat(timeFormat).format(dateTime);
  }

  static String timePassed({
    required DateTime? dateTime,
  }) {
    if (dateTime == null) {
      return "";
    }

    final Duration difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else {
      return '${(difference.inDays / 365).floor()} years ago';
    }
  }
}
