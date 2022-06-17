import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/DataModel.dart';
import 'DetailedScreen.dart';

class ItemsView extends StatelessWidget {
  ItemsView(this.popup);
  final DataModel popup;

  Widget _buildList(DataModel list) {
    if (list.children == null) {
      return Builder(
          builder: (context) {
            return ListTile(
                onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedScreen(popup,popup.children))),
                leading: SizedBox(),
                title: Text(list.name![0].value.toString())
            );
          }
      );
    }
    return ExpansionTile(
      key: PageStorageKey<DataModel>(list),
      title:
      InkWell(onTap: () {
        Get.to(() => DetailedScreen(popup, popup.children));
      },
      child: Text(
        list.name![0].value.toString(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),),
      children: list.children!.map(_buildList).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(popup);
  }
}









