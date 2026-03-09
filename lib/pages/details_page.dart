import 'package:flutter/material.dart';
import 'package:riverpod_practice/model/user.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.user});

  final User user;

   @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body:Center(
        child: Padding(padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60 ,
                backgroundColor: Colors.blue,
              ),
              
            ),
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
            Text('Address: ${user.address.city}')
          ],
        ),
        ),
      
      )
    );
  }
}