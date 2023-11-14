import 'package:flutter/material.dart';

class Helpers{
  

static List<Widget> getTrailing(String date, int unreadMsg) {
  List<Widget> widgetList = [
    Text(
      date,
      style: TextStyle(color: unreadMsg == 0 ? Colors.grey : Colors.black),
    )
  ];
  if (unreadMsg != 0) {
    widgetList.add(CircleAvatar(
      radius: 10,
      backgroundColor: Colors.green,
      child: Text(
        '$unreadMsg',
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    ));
  }
  return widgetList;
}

 
static String timeHelper(String dateTime) {
  final tempDate = DateTime.parse(dateTime);
  String postFix = tempDate.hour > 12 ? 'PM' : 'AM';
  int hour = tempDate.hour > 12 ? tempDate.hour % 12 : tempDate.hour;
  String min =
      tempDate.minute < 10 ? '0${tempDate.minute}' : '${tempDate.minute}';
  return '$hour:$min$postFix';
}

static Widget subTitleHelper(String messageType, String message, int unreadCount) {
  if (messageType == 'location') {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.grey),
        Text(
          'Location',
          style: TextStyle(color: unreadCount > 0 ? Colors.black : Colors.grey),
        )
      ],
    );
  } else if (messageType == 'doc') {
    return Row(
      children: [
        const Icon(Icons.picture_as_pdf_rounded),
        Text(
          'document',
          style: TextStyle(color: unreadCount > 0 ? Colors.black : Colors.grey),
        )
      ],
    );
  } else {
    return Text(
      message,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: unreadCount > 0 ? Colors.black : Colors.grey),
    );
  }
}

}