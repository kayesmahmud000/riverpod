import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/user.dart';
import 'package:riverpod_practice/pages/details_page.dart';
import 'package:riverpod_practice/provider/data_provider.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(appBar: AppBar(title: Text('Users')),
    body:_data.when(data: (_data){
      List<User>userList = _data;
      return Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: userList.length,

            itemBuilder:(_, index) {
              return Card(
                color: Colors.blue,
                elevation: 4,
                margin: const EdgeInsets.all( 10),
                child: ListTile(
                  title: Text(userList[index].name ,style: const TextStyle(color: Colors.white),),
                  subtitle: Text(userList[index].email, style: const TextStyle(color: Colors.white)),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => DetailsPage(user: userList[index]),)),
                ),
              );
            
          },))
        ],
      );
    },
     error: (err,s)=> Text(err.toString()),
      loading: ()=> const Center(
        child: CircularProgressIndicator(),
      ))
    );
  }
}
