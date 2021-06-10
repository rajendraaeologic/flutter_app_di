import 'package:flutter/material.dart';
import 'package:flutter_app_provider/repository/user_repo.dart';
import 'package:provider/provider.dart';

import 'di/locator.dart';
import 'model/employee.dart';

class EmployeeDetails extends StatelessWidget {

  final int id;
  final String name;

  EmployeeDetails(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), centerTitle: true,),
      body: FutureProvider(
        create: (context) => locator<UserRepository>().fetchUserById(id),
        child: Center(
          child: Consumer<Employee> (
            builder: (context, employee, widget) {
              return (employee != null)
                ? Container(
                child: Column(
                  children: [
                    Text(employee.name),
                    Text(employee.email),
                    Text(employee.username),
                  ],
                )
              ) : const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
