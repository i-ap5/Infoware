import 'package:flutter/material.dart';
import 'package:infoware/Home/home_screen.dart';
import 'package:infoware/Home/view_detail.dart';

import '../api/api_important.dart';

class StyleWidget {
  headerBoldTextStyle() {
    return const TextStyle(
        fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold);
  }

  headerNormalTextStyle() {
    return const TextStyle(fontSize: 24, color: Colors.white);
  }

  normalTextStyle() {
    return TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.4));
  }

  textStyle({double? fontsize, Color? color}) {
    return TextStyle(fontSize: fontsize, color: color, height: 1.2);
  }

  subHeadingTextStyle() {
    return const TextStyle(
        fontFamily: "Product", fontSize: 20, color: Colors.white);
  }

  movieTitle({double? fontsize}) {
    return TextStyle(
        fontFamily: "Helvetica",
        fontSize: fontsize,
        color: Colors.white,
        height: 0.9,
        fontWeight: FontWeight.bold);
  }

  movieRatingDis() {
    return const TextStyle(
        fontFamily: "Helvetica",
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.normal);
  }

  subHeadingBoldTextStyle() {
    return const TextStyle(
        fontFamily: "Product",
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold);
  }

  searchMethod() {
    return InputDecoration(
        fillColor: Colors.white.withOpacity(0.2),
        filled: true,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)));
  }

  formFieldDesign(String LabelText, PrefixIcon) {
    return InputDecoration(
        labelText: LabelText,
        labelStyle: styleWidget.textStyle(
            fontsize: 16, color: Colors.white.withOpacity(0.7)),
        prefixIcon: Icon(
          PrefixIcon,
          size: 22,
          color: Colors.white,
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 17, 0),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white.withOpacity(0.2), width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0), width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.all(20));
  }

  dropdownDecoration(prefixIcon) {
    return InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          size: 22,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white.withOpacity(0.2), width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0), width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 17, 0),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(vertical: 15));
  }
}

class ListingWidgets {
  List<Widget> listing(BuildContext context) {
    List<Widget> moviesTrenginListDisplay = [];

    for (int i = 0; i < trendingmovies.length; i++) {
      moviesTrenginListDisplay.add(
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => PreviewMovie(
                          title:
                              trendingmovies[i]['title'] ?? "Title Unavailable",
                          about: trendingmovies[i]['overview'],
                          language: trendingmovies[i]['original_language'],
                          imageBg: trendingmovies[i]['poster_path'],
                          rating: trendingmovies[i]['vote_average'],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://image.tmdb.org/t/p/original' +
                        trendingmovies[i]['poster_path']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: AlignmentDirectional.bottomCenter,
                    end: AlignmentDirectional.topCenter,
                    colors: [Colors.black, Colors.black.withOpacity(0)]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trendingmovies[i]['title'] ?? "Title Unavailable",
                    style: styleWidget.movieTitle(fontsize: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "IMDB ",
                        style: styleWidget.movieRatingDis(),
                      ),
                      Text(
                        trendingmovies[i]['vote_average'] != null
                            ? trendingmovies[i]['vote_average'].toString() +
                                " Rating"
                            : "NA",
                        style: styleWidget.movieRatingDis(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return moviesTrenginListDisplay;
  }
}
