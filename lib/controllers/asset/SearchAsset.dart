import 'package:first_project/model/asset/AssetModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'AssetListController.dart';

class SearchAsset extends SearchDelegate {
  final assetListController = Get.put(AssetListController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<AssetModal>>(
      future: assetListController.getAssetList(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) => Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(snapshot.data![index].picture!),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(snapshot.data![index].name!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Asset Code: ' + snapshot.data![index].assetCode!),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
