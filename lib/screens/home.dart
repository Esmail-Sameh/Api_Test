import 'dart:convert';

import 'package:apiget/widget/user_item.dart';
import 'package:flutter/material.dart';
import '../user.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {
  List<User> data = [];
  Future<List<User>> getUserData() async{
    // var url = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    //String uri = "https://jsonplaceholder.typicode.com/users";
    var url = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var jsonData = await jsonDecode(url.body);

    for( var u in jsonData ){
      data.add(User(id: u['id'], name: u['name'], email: u['email']));
      //print(u['id']);
    }
    print(data[2].name);
    //print(data);

    return data;
  }
  @override
  void initState()   {
    getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'User Screen',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: ()async {
          setState((){

          });
          await getUserData();
        },
       ),
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          if(snapshot == false){
           return CircularProgressIndicator(
             semanticsLabel: 'Loding',
           );
          }else{
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemBuilder: (context, index) => UserItemBuilder(id:data[index].id ,name:data[index].name  , email:data[index].email ),
                itemCount: data.length,
              ),
            );
          }
        },
      ),

    );

  }
}
