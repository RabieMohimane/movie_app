import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie,this.isDetails = false });

  final Movie movie;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title!),
        subtitle: Text('Director: ${movie.director}'),
        leading: CircleAvatar(backgroundImage: NetworkImage(movie.images![0])),
        trailing: Icon(Icons.arrow_drop_down),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 75.0,
              right: 10.0,
              bottom: 10.0,
              top: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Released: ',
                        style:
                            (Theme.of(context).textTheme.labelLarge ??
                                    const TextStyle())
                                .copyWith(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(text: '${movie.year}\n'),
                      TextSpan(
                        text: 'Genre: ',
                        style:
                            (Theme.of(context).textTheme.labelLarge ??
                                    const TextStyle())
                                .copyWith(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(text: '${movie.genre}\n'),
                      TextSpan(
                        text: 'Plot: ',
                        style:
                            (Theme.of(context).textTheme.labelLarge ??
                                    const TextStyle())
                                .copyWith(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(text: '${movie.plot}\n'),
                    ],
                  ),
                ),
                if (!isDetails
            )
                  TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(movie: movie),
                        ),
                      ),
                    },
                    child: Text('Read More'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
