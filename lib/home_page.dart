import 'package:flutter/material.dart';
import 'package:interview/constants.dart';
import 'package:interview/helpers.dart';
import 'package:interview/socket.dart';

List chatList = [];
ValueNotifier<bool> notifyChat = ValueNotifier(true);

StreamSocket streamSocket = StreamSocket();

class BuildWithSocketStream extends StatelessWidget {
  const BuildWithSocketStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Constants.kColorsGreen,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Constants.kColorsGreen,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.phone_rounded, color: Constants.kColorsGreen)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Constants.kColorsGreen))
          ]),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: notifyChat,
          builder: (context, value, child) => StreamBuilder(
            stream: streamSocket.getResponse,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return chatList.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container(
                            height: 50,
                            color: Colors.grey.shade300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: Constants.headerRow
                            ),
                          );
                        } else {
                          index = index - 1;
                          String profilePicUrl = chatList[index]['profile'];
                          String title = '${chatList[index]['name']}';
                          int unreadMsg =
                              int.parse("${chatList[index]['unread_message']}");
                          String date =
                              chatList[index]['date'].split(' ').first ==
                                      DateTime.now().toString().split(' ').first
                                  ? Helpers.timeHelper(chatList[index]['date'])
                                  : chatList[index]['date'].split(' ').first;

                          Widget subTitle = Helpers.subTitleHelper(
                              chatList[index]['message_type'],
                              chatList[index]['message'],
                              unreadMsg);
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(profilePicUrl),
                            ),
                            title: Text(title),
                            subtitle: subTitle,
                            trailing: Column(
                                children: Helpers.getTrailing(date, unreadMsg)),
                          );
                        }
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: chatList.length + 1)
                  : const Center(
                      child: Text('Chat is empty'),
                    );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Constants.kColorsGreen,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
