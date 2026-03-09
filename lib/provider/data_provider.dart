import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/user.dart';
import 'package:riverpod_practice/services/service.dart';

final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());

final userDataProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(apiServiceProvider).getUsers();
});
