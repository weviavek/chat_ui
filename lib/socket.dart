
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'home_page.dart';

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}


class SocketDocker extends ChangeNotifier {
  static void connectAndListen() {
    Socket socket = io(
        'https://node.creativeapplab.in/',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableReconnection()
            .build());

    socket.onConnect((_) {
      socket.emit('chat_list',
          {"user_id": "36", "accessToken": "a892fd0aaf2a17a18f61be3cf9eb2aca"});
    });

    socket.on('chat_list', (data) {
      data['data'].map((element) {
        chatList.add(element);
      }).toList();
      notifyChat.notifyListeners();
    });
  }
}