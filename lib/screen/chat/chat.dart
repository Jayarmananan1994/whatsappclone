import 'package:flutter/material.dart';
import 'package:whatsapp/screen/chatroom/chatroom.dart';

class Chat extends StatelessWidget {
  final list = [
    ChatItem(
        circleAvatar:
            'https://image.shutterstock.com/image-vector/man-character-face-avatar-glasses-600w-542759665.jpg',
        name: 'Arsent',
        lastMessage: 'Arsent: Received the money',
        lastSeen: '20:50',
        unread: 0),
    ChatItem(
        circleAvatar: 'https://i.stack.imgur.com/kdrpp.png',
        name: 'We need shuttle reunion',
        lastMessage: 'Received the money',
        lastSeen: '20:50',
        unread: 0),
    ChatItem(
        circleAvatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7QpVGMXkaI2Xur3eEEUeYP5ME5EhcYvLzwMGMlzQ1AbKRF4wl',
        name: 'Partha',
        lastMessage: 'Partha: have you seen it?',
        lastSeen: '20:02',
        unread: 0),
    ChatItem(
        circleAvatar:
            'https://media.creativemornings.com/uploads/user/avatar/120448/profile-circle.png',
        name: 'Mahesh yadhav',
        lastMessage: 'Partha: have you seen it?',
        lastSeen: '19:31',
        unread: 0),
    ChatItem(
        circleAvatar:
            'https://www.ingenie.com/wp-content/uploads/2014/03/avatar-customers-faith-mitchell-circle.png',
        name: 'Link2Settle ',
        lastMessage: 'You: sent the email',
        lastSeen: '18:04',
        unread: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Chats'),),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: chatList(),
      ),
    );
  }

  get chatList => () {
        return ListView.separated(
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            indent: 70,
            height: 0,
          ),
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(list[index].circleAvatar),
                  radius: 30,
                ),
                onTap: () {
                  return showDialog( context: ctxt, builder: (ctxt){
                      return SimpleDialog(

                        children: <Widget>[                          
                          Image.network(list[index].circleAvatar),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceEvenly, 
                             children: <Widget>[
                            IconButton(icon: Icon(Icons.message),onPressed: (){}, color: Color(0xff075e54),),
                            IconButton(icon: Icon(Icons.call),onPressed: (){},color: Color(0xff075e54)),
                            IconButton(icon: Icon(Icons.videocam),onPressed: (){},color: Color(0xff075e54)),
                            IconButton(icon: Icon(Icons.info_outline),onPressed: (){},color: Color(0xff075e54)),
                          ],)
                        ],
                      );
                  });
                },
              ),
              title: Text(list[index].name,
                  style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(list[index].lastMessage),
              onTap: () {
                Navigator.push(
                    ctxt,
                    MaterialPageRoute(
                        builder: (context) => Chatroom(
                              chatItem: list[index],
                            )));
              },
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    list[index].lastSeen,
                    style: TextStyle(
                        fontSize: 11,
                        color: (list[index].unread > 0)
                            ? Colors.green[400]
                            : Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: (list[index].unread > 0)
                            ? Colors.green[400]
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        (list[index].unread > 0)
                            ? list[index].unread.toString()
                            : '',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            );
          },
        );
      };
}

class ChatItem {
  String circleAvatar;
  String name;
  String lastMessage;
  String lastSeen;
  int unread;

  ChatItem(
      {this.circleAvatar,
      this.name,
      this.lastMessage,
      this.lastSeen,
      this.unread});
}
