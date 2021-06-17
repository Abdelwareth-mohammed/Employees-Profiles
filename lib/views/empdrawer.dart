import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmpDrawer extends StatelessWidget {
  final Employee empo;
  EmpDrawer(this.empo);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                empo.name,
                style: TextStyle(color: Colors.black),
              ),
              accountEmail:
                  Text(empo.email, style: TextStyle(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                      child: Image.network(
                          empo.picture + empo.index.toString() + '.jpg'))),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1444927714506-8492d94b4e3d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1510&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Text("account",
                  style: TextStyle(fontSize: 20, color: Colors.orange[400])),
              title: Icon(Icons.account_circle_rounded,
                  color: Colors.red, size: 30),
              //subtitle: Text(asyncSnapshot.data[index].email),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Text("favorites",
                  style: TextStyle(fontSize: 20, color: Colors.orange[400])),
              title: Icon(Icons.favorite, color: Colors.red, size: 30),
              //subtitle: Text(asyncSnapshot.data[index].email),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Text("messages",
                  style: TextStyle(fontSize: 17, color: Colors.orange[400])),
              title: Icon(Icons.message_sharp, color: Colors.red, size: 30),
              //subtitle: Text(asyncSnapshot.data[index].email),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Text("groups",
                  style: TextStyle(fontSize: 20, color: Colors.orange[400])),
              title: Icon(Icons.group_add_sharp, color: Colors.red, size: 30),
              //subtitle: Text(asyncSnapshot.data[index].email),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Text("about",
                  style: TextStyle(fontSize: 23, color: Colors.orange[400])),
              title:
                  Icon(Icons.help_outline_sharp, color: Colors.red, size: 30),
              //subtitle: Text(asyncSnapshot.data[index].email),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Text("setting",
                  style: TextStyle(fontSize: 20, color: Colors.orange[400])),
              title: Icon(Icons.settings, color: Colors.red, size: 30),
              //subtitle: Text(asyncSnapshot.data[index].email),
            ),
          ],
        ),
      ),
    );
  }
}
