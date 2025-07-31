import 'package:flutter/material.dart';
import 'package:movie_app/component/movie_card.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return MovieProvider();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
   Provider.of<MovieProvider>(context,listen: false).loadMovies(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context).movieList;
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: Center(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieCard(movie: movie);
            // return ListTile(
            //   title: Text(movies[index].title!),
            //   trailing: Icon(Icons.sunny),
            //   leading: CircleAvatar(
            //     child: Text(
            //       movies[index].title![0],
            //     ), // Display first letter of movie title
            //   ),
            //   subtitle: Text('Description of Movie ${index + 1}'),
            // );
          },
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null, // Add your onPressed code here!
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

