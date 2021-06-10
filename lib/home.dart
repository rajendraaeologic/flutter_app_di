import 'package:flutter/material.dart';
import 'package:flutter_app_provider/employee.dart';
import 'package:flutter_app_provider/model/employee.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    List<Employee> employee = Provider.of<List<Employee>>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Employee'),
        centerTitle: true,
      ),
      body: (employee == null)
        ? const Center(child: CircularProgressIndicator(),)
          : ListView.builder(
          itemCount: employee.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 75,
                color: Colors.white,
                child: ListTile(
                  title: Text(employee[index].name),
                  subtitle: Text(employee[index].email
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeDetails(employee[index].id, employee[index].name)));
                  },
                )
            );
          }
      )
    );
  }
}
