import 'package:exercisemates/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchExercise extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final homeRepo = ref.watch(homeProvider);
      final searchResults = homeRepo.searchExercisesByName(query);
      return ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final exercise = searchResults[index];
          return ListTile(
            leading: Image.network(exercise.gifUrl),
            title: Text(exercise.name),
            subtitle: Text(exercise.bodyPart),
          );
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final homeRepo = ref.watch(homeProvider);
        return ListView.builder(
            itemCount: homeRepo.dummyExercises.length,
            itemBuilder: (context, index) {
              final exercise = homeRepo.dummyExercises[index];
              return GestureDetector(
                onTap: () {
                  query = exercise.name;
                },
                child: ListTile(
                  leading: Image.network(exercise.gifUrl),
                  title: Text(exercise.name),
                  subtitle: Text(exercise.bodyPart),
                ),
              );
            });
      },
    );
  }
}
