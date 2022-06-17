import 'dart:io';
import 'package:category_listing/ui/DetailItemsView.dart';
import 'package:flutter/material.dart';
import '../Model/DataModel.dart';

class DetailedScreen extends StatelessWidget {
  DataModel list;
  List<DataModel>? subList;

  DetailedScreen(this.list, this.subList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Container(color: Colors.lightBlue))),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsetsDirectional.only(bottom: 50, top: 20),
            decoration: const BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0))),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(start: 20),
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsetsDirectional.only(end: 20),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                Container(
                  child: list.image?.length == 0
                      ? Container()
                      : Image.file(
                          File(list.image![0].toString()),
                          height: 150,
                        ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsetsDirectional.only(start: 25, top: 40),
                  child: const Text(
                    'Parent Category',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        const EdgeInsetsDirectional.only(start: 25, top: 10),
                    child: Text(
                      list.name![0].value.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsetsDirectional.only(
                        start: 25, top: 10, end: 15),
                    child: Text(
                      list.description.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
          ),
          Container(
            child: subList?.length == 0
                ? Container()
                : Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsetsDirectional.only(
                        start: 25, top: 20, end: 15, bottom: 10),
                    child: const Text('Sub Categories - ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ),
          ),
          Expanded(
              child: Container(
                  child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                DetailItemsView(subList?[index]),
            itemCount: subList?.length,
          )))
        ],
      ),
    );
  }
}
