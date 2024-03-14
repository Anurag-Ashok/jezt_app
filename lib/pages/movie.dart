import 'package:flutter/material.dart';
import 'package:jezt_app/pages/models/movies.dart';

class moviePage extends StatefulWidget {
  const moviePage({super.key});

  @override
  State<moviePage> createState() => _moviePageState();
}

class _moviePageState extends State<moviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(1000, 172, 225, 175),
        body: ListView.builder(
          itemCount: movieDetails().Name.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    movieDetails().image[index],
                    width: 150,
                    height: 300,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        movieDetails().Name[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movieDetails().Discription[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }
}
