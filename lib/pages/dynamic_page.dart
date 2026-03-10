import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/services/string_generator.dart';
import 'package:riverpod_practice/widget/logic_controller.dart';

class DynamicPage extends ConsumerStatefulWidget {
  const DynamicPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DynamicPageState();
  }
}

class _DynamicPageState extends ConsumerState<DynamicPage> {

  late LogicController _controller;

@override
  void initState() {
  
    super.initState();
    Future.delayed(Duration(seconds: 0), (){
      _controller =LogicController(ref: ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> randomStrList = ref.watch(strNotifierProvider);
    final random = Random();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Dynamic widget')),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ...randomStrList.map(
                  (e) => Row(
                    mainAxisAlignment: .center,
                    children: [
                      Container(
                        alignment: .center,
                        margin: EdgeInsets.only(bottom: 1, top: 5),
                        height: 40,
                        width: 350,
                        color: Colors.blue,

                        child: Text(
                          e.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(Icons.remove),
                        onTap: () {
                          int index = randomStrList.indexOf(e);
                          ref
                              .read(strNotifierProvider.notifier)
                              .removeItem(index);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    ref
                        .read(strNotifierProvider.notifier)
                        .addString(
                          "This is the random string ${5 + random.nextInt(1000 + 1 - 5)}",
                        );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'create',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(strNotifierProvider.notifier).removeString();
                  },
                  icon: const Icon(Icons.clear),
                  label: const Text(
                    'Clear',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    iconColor: Colors.white,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
               _controller.showDialogue(1, "Riverpod", " Hello riverpod");
                }, 
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber
                ),
                child: Text(
                    'Tap me',
                    style: TextStyle(color: Colors.white),
                  ),
                  
                 )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
