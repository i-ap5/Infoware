import 'package:flutter/material.dart';
import 'package:infoware/Home/home_screen.dart';

class PreviewMovie extends StatelessWidget {
  String title;
  String about;
  String language;
  String imageBg;
  double rating;

  PreviewMovie(
      {super.key,
      required this.title,
      required this.about,
      required this.language,
      required this.imageBg,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      // decoration: const BoxDecoration(
      //     gradient: SweepGradient(
      //   colors: [Color(0xff171717), Color.fromARGB(255, 7, 0, 78)],
      //   stops: [0, 1],
      //   center: Alignment.topLeft,
      // )),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/original$imageBg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.bottomCenter,
                        end: AlignmentDirectional.topCenter,
                        colors: [Colors.black, Colors.transparent])),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 30,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.closed_caption,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          language.toUpperCase(),
                          style: styleWidget.textStyle(
                              fontsize: 14, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          rating.round().toString(),
                          style: styleWidget.textStyle(
                              fontsize: 14, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 10),
                //   child: Container(
                //     height: 30,
                //     width: 70,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: const Color.fromARGB(255, 91, 91, 91),
                //     ),
                //   ),
                // )
              ]),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    title,
                    style: styleWidget.movieTitle(fontsize: 32),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    about,
                    style: styleWidget.textStyle(
                        fontsize: 15, color: Colors.white70),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
