import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:infoware/Home/view_detail.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../Style/style.dart';
import '../api/api_important.dart';

StyleWidget styleWidget = StyleWidget();
ListingWidgets listingWidgets = ListingWidgets();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCostomLogs = (TMDB(ApiKeys(apiKey, apiRAT),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true)));
    Map trendingMovies = await tmdbWithCostomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCostomLogs.v3.movies.getTopRated();
    Map popularMovies = await tmdbWithCostomLogs.v3.movies.getPopular();
    debugPrint(trendingMovies.toString());
    setState(() {
      trendingmovies = trendingMovies['results'];
      topratedmovies = topratedresult['results'];
      popularList = popularMovies['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: SweepGradient(
              colors: [Color(0xff171717), Color.fromARGB(255, 7, 0, 78)],
              stops: [0, 1],
              center: Alignment.topLeft,
            )),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          style: styleWidget.headerNormalTextStyle(),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Hello',
                              style: styleWidget.headerBoldTextStyle(),
                            ),
                            const TextSpan(
                              text: ' User!',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'infoware',
                        style: styleWidget.normalTextStyle(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        style: styleWidget.textStyle(
                            fontsize: 16, color: Colors.white),
                        cursorColor: Colors.white,
                        cursorHeight: 20,
                        decoration: styleWidget.searchMethod(),
                      ),
                      Container(
                        height: 30,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: const MaterialScrollBehavior()
                          .copyWith(overscroll: false),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: styleWidget.subHeadingTextStyle(),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Trending',
                                    style:
                                        styleWidget.subHeadingBoldTextStyle(),
                                  ),
                                  const TextSpan(
                                    text: ' Movies',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                height: 350,
                                child: CarouselSlider(
                                  items: listingWidgets.listing(context),
                                  options: CarouselOptions(
                                    height: 350,
                                    enlargeCenterPage: true,
                                    aspectRatio: 16 / 9,
                                    autoPlay: true,
                                    autoPlayCurve:
                                        Curves.fastLinearToSlowEaseIn,
                                    enableInfiniteScroll: true,
                                    enlargeFactor: 0.3,
                                    autoPlayInterval:
                                        const Duration(seconds: 5),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                style: styleWidget.subHeadingTextStyle(),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Most',
                                    style:
                                        styleWidget.subHeadingBoldTextStyle(),
                                  ),
                                  const TextSpan(
                                    text: ' Popular',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:
                                    List.generate(popularList.length, (index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (ctx) => PreviewMovie(
                                                    title: popularList[index]
                                                            ['title'] ??
                                                        "Title Unavailable",
                                                    about: popularList[index]
                                                        ['overview'],
                                                    language: popularList[index]
                                                        ['original_language'],
                                                    imageBg: popularList[index]
                                                        ['poster_path'],
                                                    rating: popularList[index]
                                                        ['vote_average'],
                                                  )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/original' +
                                                  popularList[index]
                                                      ['poster_path']),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white.withOpacity(0.4),
                                      ),
                                      margin: const EdgeInsets.only(right: 10),
                                      height: 180,
                                      width: 120,
                                      // Customize the content of each item
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
