

import 'package:flutter/material.dart';
import 'package:movie_ticket_app/models/cast_model.dart';
import 'package:movie_ticket_app/models/movie_model.dart';

class MovieData {
  List<MovieModel> movieList;

  MovieData() {
    movieList = List();

    movieList.add(
      MovieModel(
          id: 0,
          name: 'Togo',
          rating: 8.0,
          genre: ["Drama",],
          director: 'Ericson Core',
          storyLine:
          'Togo (1913 – December 5, 1929) was the lead sled dog of Leonhard Seppala and his dog sled team in the 1925 serum run to Nome across central and northern Alaska. Even though he covered more distance (260 miles) than his co-sledder Balto (55 miles), he didn\'t get as much fame.',
          image: Image.asset("assets/image/togo.jpeg"),
          imageLogo: Image.asset("assets/image/togologo.png"),
          castList: [
            MovieCastModel(
              name: "Willem Dafoe",
              photo: Image.asset("assets/image/cast/willem.jpg"),
            ),
            MovieCastModel(
              name: "Julianne Nicholson",
              photo: Image.asset("assets/image/cast/julianne.jpg"),
            ),
            MovieCastModel(
              name: "Christopher Heyerdahl",
              photo: Image.asset("assets/image/cast/christopher.jpg"),
            ),
            MovieCastModel(
              name: "Michael McElhatton",
              photo: Image.asset("assets/image/cast/michael.jpg"),
            )
          ]),
    );
    movieList.add(
      MovieModel(
          id: 1,
          name: 'Joker',
          rating: 8.5,
          genre: ["Crime", "Drama"],
          director: 'Todd Phillips',
          storyLine:
          "Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he's part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.",
          image: Image.asset("assets/image/joker.jpeg"),
          imageLogo: Image.asset("assets/image/jokerlogo.png"),
          castList: [
            MovieCastModel(
              name: "Joaquin Phoenix",
              photo: Image.asset("assets/image/cast/joaquin.jpg"),
            ),
            MovieCastModel(
              name: "Robert De Niro",
              photo: Image.asset("assets/image/cast/niro.jpg"),
            ),
            MovieCastModel(
              name: "Zazie Beetz",
              photo: Image.asset("assets/image/cast/zazie.jpg"),
            ),
            MovieCastModel(
              name: "Frances Conroy",
              photo: Image.asset("assets/image/cast/frances.jpg"),
            ),
          ]),
    );
    movieList.add(
      MovieModel(
          id: 2,
          name: 'Planet of the Apes',
          rating: 5.7,
          genre: ["Action", "Adventure", "Fantasy"],
          director: 'Tim Burton',
          storyLine:
          "Complex sociological themes run through this science-fiction classic about three astronauts marooned on a futuristic planet where apes rule and humans are slaves. The stunned trio discovers that these highly intellectual simians can both walk upright and talk. They have even established a class system and a political structure. The astronauts suddenly find themselves part of a devalued species, trapped and imprisoned by the apes.",
          image: Image.asset("assets/image/apes.jpeg"),
          imageLogo: Image.asset("assets/image/apeslogo.png"),
          castList: [
            MovieCastModel(
              name: "Cornelius",
              photo: Image.asset("assets/image/cast/cornelius.jpg"),
            ),
            MovieCastModel(
              name: "Dr. Zaius",
              photo: Image.asset("assets/image/cast/zaius.jpg"),
            ),
            MovieCastModel(
              name: "Dr. Zira",
              photo: Image.asset("assets/image/cast/zira.jpg"),
            ),
            MovieCastModel(
              name: "Nova",
              photo: Image.asset("assets/image/cast/nova.jpg"),
            )
          ]),
    );
  }
}


