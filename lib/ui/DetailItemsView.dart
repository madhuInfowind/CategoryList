import 'package:flutter/material.dart';
import '../Model/DataModel.dart';

class DetailItemsView extends StatelessWidget {
  DataModel? subList;

  DetailItemsView(this.subList);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
        child: Container(
          padding: EdgeInsetsDirectional.only( bottom: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin:
                const EdgeInsetsDirectional.only(start: 25, top: 20, end: 15),
            child: Text(
              subList!.name![0].value.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin:
                const EdgeInsetsDirectional.only(start: 25, top: 20, end: 15),
            child: Text(
              "Description :  " + subList!.description.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin:
                const EdgeInsetsDirectional.only(start: 25, top: 10, end: 15),
            child: Text(
              "Slug :  " + subList!.slug.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsetsDirectional.only(start: 25, top: 10, end: 15),
            child: Text(
              "Featured :  " + subList!.featured.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsetsDirectional.only(start: 25, top: 10, end: 15),
            child: Text(
              "Status :  " + subList!.status.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsetsDirectional.only(start: 25, top: 10, end: 15),
            child: Text(
              "Create Date :  " + subList!.createDate.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    ));
  }
}
