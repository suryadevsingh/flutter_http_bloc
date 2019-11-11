

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:httpbloc/bloc.dart';
import 'package:httpbloc/jsonclass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  final _bloc = Emloyeesbloc();


  List<Employee> employee(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }


  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder<List<Employee>>(
        stream: _bloc.streamcounter,

        builder: (BuildContext context , AsyncSnapshot<List<Employee>> snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? EmployeesList(employees: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
class EmployeesList extends StatelessWidget {
  final List<Employee> employees;
  EmployeesList({Key key, this.employees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context ,index )
        {
          return Card(
            child: Column(
              children: <Widget>[

               Text('${employees[index].id}'),
                Text("${employees[index].title}"),
                Text("${employees[index].completed}"),
                Text("${employees[index].userId}"),

              ],
            ),
          );
        }
    );
  }
}