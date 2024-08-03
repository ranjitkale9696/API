import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode ==200){
      data=jsonDecode(response.body.toString());
    }
    else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('User Model',style: TextStyle(fontSize: 20,),),
          backgroundColor: Colors.teal
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context,snapshot){

                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Text('Loading');
                    }
                    else{
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context,index){
                            return Card(
                              child: Column(
                                children: [
                                  ReusbaleRow(title: 'id', value: data[index]['id'].toString(),),
                                  ReusbaleRow(title: 'name', value: data[index]['name'].toString(),),
                                  ReusbaleRow(title: 'address', value: data[index]['address']['street'].toString(),),
                                  ReusbaleRow(title: 'address', value: data[index]['address']['suite'].toString(),),
                                  ReusbaleRow(title: 'address', value: data[index]['address']['city'].toString(),),
                                  ReusbaleRow(title: 'address', value: data[index]['address']['zipcode'].toString(),),
                                  ReusbaleRow(title: 'address', value: data[index]['address']['geo']['lat'].toString(),),
                                  ReusbaleRow(title: 'address', value: data[index]['address']['geo']['lng'].toString(),),
                                  ReusbaleRow(title: 'username', value: data[index]['username'].toString(),),
                                  ReusbaleRow(title: 'email', value: data[index]['email'].toString(),),
                                  ReusbaleRow(title: 'phone', value: data[index]['phone'].toString(),),
                                  ReusbaleRow(title: 'website', value: data[index]['website'].toString(),),
                                ],
                              ),
                            );
                          });
                    }
                  }
              ),
          ),
        ],
      ),
    );
  }
}


class ReusbaleRow extends StatelessWidget {
  String title,value;

  ReusbaleRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),

        ],
      ),
    );
  }
}