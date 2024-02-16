import 'package:flutter/material.dart';
import '../pages/detail_page.dart';
import '../services/services.dart';
import '../utils.dart';
import '../models/movie_model.dart';

class Search extends SearchDelegate<Model> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Model>(
      future: movieSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data?.results;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                            data: snapshot.data!,
                            index: index,
                            isTvShow: false),
                      ));
                },
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 88, 85, 51),
                  backgroundImage: NetworkImage(
                    '$imageUrl${data[index].posterPath}',
                  ),
                ),
                title: Text(data[index].title ?? data[index].name!),
              );
            },
          );
        } else if (query.isEmpty) {
          return const SizedBox();
        } else {
          return const Center(
            child: Text('Ничего не найдено'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<Model>(
      future: movieSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data?.results;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                            data: snapshot.data!,
                            index: index,
                            isTvShow: false),
                      ));
                },
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 88, 85, 51),
                  backgroundImage: NetworkImage(
                    '$imageUrl${data[index].posterPath}',
                  ),
                ),
                title: Text(data[index].title ?? data[index].name!),
              );
            },
          );
        } else if (query.isEmpty) {
          return const SizedBox();
        } else {
          return const Center(
            child: Text('Ничего не найдено'),
          );
        }
      },
    );
  }
}
