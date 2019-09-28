import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Select contact'),
            Text('0 contacts', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          appPopUpMeuButton()
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ListView(
          children: <Widget>[
            ListTile(
              
              leading: CircleAvatar(child: Icon(Icons.people,color: Colors.white,),backgroundColor: Colors.green, ),
              title: Text('New Group', style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.person_add,color: Colors.white,),backgroundColor: Colors.green, ),
              title: Text('New contact', style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  get appPopUpMeuButton => () {
        return PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(child: Text('Invite a friend'), value: 1),
            PopupMenuItem(child: Text('Contacts'), value: 2),
            PopupMenuItem(child: Text('Refresh'), value: 3),
            PopupMenuItem(child: Text('Help'), value: 4)
          ],
        );
      };
}
