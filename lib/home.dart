import 'package:flutter/material.dart';
import 'package:flutter_app_provider/model/employee.dart';
import 'package:flutter_app_provider/repository/user_repo.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future <List<Employee>> futureData;


  @override
  void initState() {
    super.initState();
    futureData = UserRepository().fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Employee'),
        centerTitle: true,
      ),
      body: FutureBuilder <List<Employee>>(
        future: futureData,
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
      ),
    );
  }
}
