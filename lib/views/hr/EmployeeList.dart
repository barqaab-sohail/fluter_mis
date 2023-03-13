import 'dart:async';

import 'package:first_project/controllers/hr/EmployeeListController.dart';
import 'package:first_project/controllers/hr/SearchEmployee.dart';
import 'package:first_project/model/hr/EmployeeModel.dart';
import 'package:first_project/views/hr/EmployeeDocumentList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../drawer/Drawer.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  // Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  final employeeListController = Get.put(EmployeeListController());

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // timer = Timer.periodic(Duration(seconds: 50),
    //     (Timer t) => employeeListController.getNewEmployeeList());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Employee List'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchEmployee());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        drawer: HomeDrawer(),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: FutureBuilder<List<EmployeeModal>>(
            future: employeeListController.EmployeeList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          onTap: () {
                            Get.to(EmployeeDocumentList(), arguments: [
                              snapshot.data![index].id,
                              snapshot.data![index].fullName
                            ]);
                          },
                          leading: CircleAvatar(
                            radius: 20.0,
                            backgroundImage:
                                NetworkImage(snapshot.data![index].picture!),
                            backgroundColor: Colors.transparent,
                            child: InteractiveViewer(
                                child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    snapshot.data![index].picture!,
                                    fit: BoxFit.cover),
                              ),
                              title: Text(snapshot.data![index].fullName!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].designation!),
                                  Text('Employee No: ' +
                                      snapshot.data![index].employeeNo!),
                                  Text('Date of Birth: ' +
                                      snapshot.data![index].dateOfBirth!),
                                  Text('Date of Joining: ' +
                                      snapshot.data![index].dateOfJoining!),
                                  Text('Mobile: ' +
                                      snapshot.data![index].mobile!),
                                  Text('Current Status: ' +
                                      snapshot.data![index].status!),
                                ],
                              ),
                            )),
                          ),
                        )));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              // By default show a loading spinner.
              return Center(child: const CircularProgressIndicator());
            },
          ))
        ]));
  }
}
