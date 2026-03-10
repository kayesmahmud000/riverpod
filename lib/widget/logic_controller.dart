import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogicController {
  final WidgetRef ref ;

  LogicController({required this.ref});
  
  Future showDialogue(
    int id, String? title , String? body
  ) async{
    showDialog(context: ref.context, builder:(BuildContext context)=> CupertinoAlertDialog(
      title: Text(title!),
      content: Text(body!),
      actions: [
        CupertinoDialogAction(child: Text('Ok'),
        onPressed: () async{
          Navigator.of(context, rootNavigator: true).pop();
          await Navigator.push(context, MaterialPageRoute(builder:(context) => Text('Hello Riverpod'),));
        },
        )
      ],
    ));
  }
}