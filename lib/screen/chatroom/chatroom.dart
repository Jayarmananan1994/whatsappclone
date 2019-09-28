import 'package:flutter/material.dart';
import 'package:whatsapp/screen/chat/chat.dart';
import 'package:whatsapp/screen/chatroom/chatmessge.dart';

class Chatroom extends StatefulWidget {
  final ChatItem chatItem;

  const Chatroom({Key key, this.chatItem}) : super(key: key);

  @override
  _ChatroomState createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  final List<String> messageList = [];
  var sendicon = Icons.keyboard_voice;
  final msgTextController = TextEditingController();

  @override
  void initState() {
    msgTextController.addListener(() {
      print(msgTextController.text.length);
      setState(() { });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Text(
                      widget.chatItem.name,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ],
            ),
            onTap: () {},
          ),
        ),
        leading: chatlogo(),
        actions: chatOptions(),
      ),
      body: Container(
        //width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('chatscreen.png'),
          ),
        ),
        child: Column(children: <Widget>[
          chatMessagebox(),
          SizedBox(width: 5),
          bottomMessengerWidget()
        ]),
      ),
      resizeToAvoidBottomPadding: true,
    );
  }

  get chatMessagebox => () {
        return Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemCount: messageList.length,
            itemBuilder: (context, int index) {
              return ChatMessage(
                message: messageList[index],
              );
            },
          ),
        );
      };

  get appPopUpMeuButton => () {
        return PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(child: Text('New group'), value: 1),
            PopupMenuItem(child: Text('New broadcast'), value: 2),
            PopupMenuItem(child: Text('WhatsApp Web'), value: 3),
            PopupMenuItem(child: Text('Starred messages'), value: 4),
            PopupMenuItem(child: Text('Settings'), value: 5),
          ],
        );
      };

  get bottomMessengerWidget => () {
        return Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Expanded(child: textMessageWidget()),
              SizedBox(width: 5),
              sendMessageutton()
            ],
          ),
        );
      };

  get textMessageWidget => () {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.face, color: Colors.grey),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(
                  controller: msgTextController,
                  decoration: InputDecoration.collapsed(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Type a message",
                  ),
                ),
              ),
              Transform.rotate(
                angle: 75,
                child: IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {},
                ),
              ),
              (msgTextController.text.length == 0)
                  ? IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.grey),
                      onPressed: () {},
                    )
                  : Container()
            ],
          ),
        );
      };

  get sendMessageutton => () {
        return Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xff128c7e)),
            child: IconButton(
              color: Colors.white,
              icon: Icon( ( (msgTextController.text.length == 0)) ? sendicon : Icons.send),
              onPressed: () {
                setState(() {
                  messageList.add('Some random text');
                  msgTextController.text = '';
                });
              },
            ));
      };

  get chatOptions => () {
        return <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          appPopUpMeuButton()
        ];
      };

  get chatlogo => () {
        return RawMaterialButton(
          shape: StadiumBorder(),
          child: Row(children: <Widget>[
            Icon(Icons.arrow_back),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chatItem.circleAvatar),
              radius: 16,
            ),
          ]),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      };

  @override
  void dispose() {
    msgTextController.dispose();
    super.dispose();
  }
}
