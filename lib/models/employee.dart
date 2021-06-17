import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Employee {
  int index;
  String about;
  String name;
  String picture;
  String company;
  String email;

  Employee(this.index, this.about, this.name, this.picture, this.company,
      this.email);

  Employee.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    about = json['about'];
    name = json['name'];
    picture = json['picture'];
    company = json['company'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['about'] = this.about;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['company'] = this.company;
    data['email'] = this.email;
    return data;
  }
}
