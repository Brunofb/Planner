import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerApp extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
       child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("w@w.pl"),
            accountName: Text("Wiktoria Sobczyk"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://icons-for-free.com/iconfiles/png/512/female+person+user+woman+young+icon-1320196266256009072.png"),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text("Adding new account..."));
                      });
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.clipboardList),
            title: Text("Twój plan"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.search),
            title: Text("Wyszukaj organizacje"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.calendarPlus),
            title: Text("Dodaj zajęcia"),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.signOutAlt),
                title: Text("Wyloguj się"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
