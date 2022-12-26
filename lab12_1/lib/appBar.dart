import 'package:flutter/material.dart';
import 'package:lab12_1/datatheme.dart';

AppBar appbar() {
    return AppBar(
        title: Text("VIP ELECTRONIC STORE"),
        shadowColor: Color.fromARGB(255, 23, 8, 71),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 25,
                    child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple[100],
                        ),
                        child: Text(
                          "00",
                          style: TextStyle(
                              color: Color.fromARGB(255, 44, 6, 3),
                              fontSize: 15),
                        )),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.add_shopping_cart),
                    color: Color.fromARGB(255, 31, 15, 3),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\$   ",
                  style: TextStyle(color: Color.fromARGB(255, 69, 53, 5)),
                ),
              ),
            ],
          )
        ],
        backgroundColor: backcolorMain,
        elevation: 10,
      );
  }

