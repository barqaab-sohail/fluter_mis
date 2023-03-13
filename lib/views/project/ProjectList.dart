import 'package:first_project/controllers/project/ProjectListController.dart';
import 'package:first_project/controllers/project/searchProject.dart';
import 'package:first_project/model/project/ProjectListModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../drawer/Drawer.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final projectListController = Get.put(ProjectListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Project List'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchProject());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        drawer: HomeDrawer(),
        body: FutureBuilder<List<ProjectListModal>>(
          future: projectListController.ProjectList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(children: [
                        Card(
                          color: Colors.blue[200],
                          shadowColor: Colors.amber,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            // leading: CircleAvatar(child: Icon(Icons.add)),
                            title: Text(
                              snapshot.data![index].projectName!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Project Type: ' +
                                        snapshot.data![index].projectType!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Total Payment Received: ' +
                                        snapshot.data![index].paymentReceived!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Total Pending Payments: ' +
                                        snapshot.data![index].pendingPayments!,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                            // trailing: Icon(Icons.train),
                          ),
                        ),
                        // children: [
                        //   Text(snapshot.data![index].projectName!),
                        //   Text(snapshot.data![index].projectType!),
                        //   Text(snapshot.data![index].paymentReceived!),
                        //   Text(snapshot.data![index].pendingPayments!),
                        // ],
                      ]),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            // By default show a loading spinner.
            return Center(child: const CircularProgressIndicator());
          },
        ));
  }
}
