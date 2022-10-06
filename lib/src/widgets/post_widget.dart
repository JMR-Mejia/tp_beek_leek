import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/models/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  bool editable;
  Function? edit;
  Function? delete;

  PostWidget({
    super.key,
    required this.post,
    this.editable = false,
    this.edit,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.05,
        left: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.height * 0.02,
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.6,
            alignment: Alignment.centerLeft,
            child: Text(
              post.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'NimbusSans',
              ),
            ),
          ),
          Divider(color: Colors.grey),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            alignment: Alignment.centerLeft,
            child: Text(
              post.body,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'NimbusSans',
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
          // dos iconos editar y eliminar
          editable
              ? Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => edit!(post),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => delete!(post.id),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
