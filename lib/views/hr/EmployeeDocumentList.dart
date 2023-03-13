import 'package:first_project/controllers/hr/EmployeeDocumentController.dart';
import 'package:first_project/model/hr/EmployeeDocumentModel.dart';
import 'package:first_project/model/hr/EmployeeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/hr/SearchEmployee.dart';
import '../drawer/Drawer.dart';

class EmployeeDocumentList extends StatefulWidget {
  const EmployeeDocumentList({super.key});

  @override
  State<EmployeeDocumentList> createState() => _EmployeeDocumentListState();
}

class _EmployeeDocumentListState extends State<EmployeeDocumentList> {
  final employeeDocumentController = Get.put(EmployeeDocumentController());

  @override
  void initState() {
    super.initState();
  }

  var documentTitle = 'Employee Documents';

  @override
  Widget build(BuildContext context) {
    print(Get.arguments[0]);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Get.arguments[1] + ' - Documents'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchEmployee());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: FutureBuilder<List<EmployeeDocumentModel>>(
            future: employeeDocumentController.EmployeeDocumentList(
                id: Get.arguments[0].toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: ListTile(
                      title: Text(snapshot.data![index].description!),
                    ),
                  ),
                );
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
