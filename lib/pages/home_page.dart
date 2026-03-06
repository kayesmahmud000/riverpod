import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/joke.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(jokeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Joke Generator')),
      body: SizedBox.expand(
        child: asyncValue.when(
          data: (joke) {
  return Stack(
    alignment: Alignment.center,
    children: [
        if (asyncValue.isRefreshing)
      const Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: LinearProgressIndicator(),
      ),
      SelectableText(
        '${joke.setup}\n\n${joke.punchline}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
      ),
      Positioned(
        bottom: 30,
        child: ElevatedButton(
          onPressed: () {
           ref.invalidate(jokeProvider);
          },
          child: const Text('Get New Joke'),
        ),
      ),
    ],
  );
},
          error: (error, stackTrace) {
            return Center(child: Text('Error: $error'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}