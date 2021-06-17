import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'empdetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import './empdrawer.dart';

class EmpInformation extends StatefulWidget {
  // EmpInformation({Key key, this.title}) : super(key: key);

  final String title = "";

  @override
  _EmpInformationState createState() => _EmpInformationState();
}

class _EmpInformationState extends State<EmpInformation> {
  Future<List<Employee>> getEmp() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/bYKKPeXRcO?indent=2");
    var jsonData = json.decode(data.body);
    List<Employee> empp = [];

    for (var u in jsonData) {
      Employee em = Employee(u["index"], u["about"], u["name"], u["picture"],
          u["company"], u["email"]);
      empp.add(em);
    }
    return empp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(" Employee list"), backgroundColor: Colors.green[500]),
      body: Container(
        child: FutureBuilder(
          future: getEmp(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.data == null) {
              return Container(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else {
              return ListView.builder(
                itemCount: asyncSnapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (Context) =>
                                  DetailPage(asyncSnapshot.data[index])));
                    },
                    title: Text(asyncSnapshot.data[index].name),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          asyncSnapshot.data[index].picture +
                              asyncSnapshot.data[index].index.toString() +
                              '.jpg'),
                    ),
                    subtitle: Text(asyncSnapshot.data[index].email),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
