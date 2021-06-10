import 'package:flutter/material.dart';
import 'package:flutter_app_provider/model/employee.dart';
import 'package:flutter_app_provider/repository/user_repo.dart';
import 'package:provider/provider.dart';

import 'di/locator.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Future <List<Employee>> futureData;


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
                )
            );
          }
      )
      /*FutureProvider(
        create: (context) => locator<UserRepository>().fetchMovieList(),
        child: Consumer<Employee> (
          builder: (context, employee, widget) {
            return ListTile(
                title: Text(employee.name),
            subtitle: Text(employee.email)
            );
          },
        ),
      )*/
      /*FutureBuilder <List<Employee>>(
        future: locator<UserRepository>().fetchMovieList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Employee> data = snapshot.data;
            return
              ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(data[index].name),
                        subtitle: Text(data[index].email
                      ),
                    )
                    );
                  }
              );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),*/
    );
  }
}
