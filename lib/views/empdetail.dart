import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import './empdrawer.dart';

class DetailPage extends StatelessWidget {
  final Employee empo;
  DetailPage(this.empo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      drawer: EmpDrawer(empo),
      appBar: AppBar(
        title: Text(empo.name),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              child: Wrap(children: [
            Text(
              empo.about,
              style: TextStyle(fontSize: 20),
            ),
          ])),
        ),
      ),
    );
  }
}
