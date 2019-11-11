import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:httpbloc/jsonclass.dart';

class Emloyeesbloc{

  var _employeeStreamController = StreamController<List<Employee>>();

  Stream<List<Employee>> get streamcounter => _employeeStreamController.stream;

  StreamSink<List<Employee>> get employeeeData => _employeeStreamController.sink;



  Emloyeesbloc(){

    Future<List<Employee>> empLists= fetchEmployee();
    empLists.then((result){

      employeeeData.add(result);

    });
  }

  Future<List<Employee>> fetchEmployee()async{
    final surya = await http.get('https://jsonplaceholder.typicode.com/todos');

    return  employeeFromJson(surya.body);
  }
  dispose(){
    _employeeStreamController.close();
  }


}