import 'package:flutter_riverpod/flutter_riverpod.dart';

class StringGenerator extends Notifier<List<String>> {
  @override
  List<String> build() {
   return [];
  }

void addString (String randomStr){
  state =[...state ,randomStr];
  print(state.length);
}

void removeItem ( int index){
  state.removeAt(index);
  state = [...state];
}


void removeString(){
  state =[];
}
}

var strNotifierProvider = NotifierProvider<StringGenerator, List<String>>(StringGenerator.new);