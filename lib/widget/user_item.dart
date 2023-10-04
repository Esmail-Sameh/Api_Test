import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserItemBuilder extends StatelessWidget {
  int id;
  String name;
  String email;

  UserItemBuilder({
  required this.id,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            child: Text('${id.toString()}', style: TextStyle(fontSize: 25),),
            radius: 30,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),

              ),
              SizedBox(height: 3,),
              Text(
                '$email',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  color: Colors.grey
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
