import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api/Model/posts_model.dart';
import 'package:flutter/material.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<PostsModel>postList=[];

  Future<List<PostsModel>> getPostApi()async{
    final respons=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data=jsonDecode(respons.body.toString());

    if(respons.statusCode== 200){

      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen',style: TextStyle(fontSize: 10,),),
          backgroundColor: Colors.red
      ),
      body:  Column(

        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');
                }
                else{
                  return ListView.builder(
                    itemCount:postList.length,
                    itemBuilder:(context,index){
                      // return Text(index.toString());
                      return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                Text(postList[index].title.toString()),
                                Text('Describe',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                Text(postList[index].title.toString()),
                              ],
                            ),
                          ),
                      );
                    }
                  );
                }
            }
            ),
          ),
        ],
      ),
    );
  }
}
