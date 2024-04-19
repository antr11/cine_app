import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/new_home/presentation/views/widget/customize_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../commom/constants/assets.dart';
import '../../../../commom/emuns/bloc_status.dart';
import '../../../movie_details/movie_detail_route.dart';
import '../../data/models/movie.dart';
import '../bloc/new_home_bloc.dart';
import '../bloc/new_home_event.dart';
import '../bloc/new_home_state.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  late ThemeData theme;

  // List<String> movies = [
  //   'https://lh3.googleusercontent.com/proxy/WyKOUXIEolzVEhdrm2BE4lLyAgCmMV5nZxGM7am8qZqKgi-X4hG63SB1MM8QjTHdoYBIHy2dpGobNZu88euQhukMAe0jWnD1BEtPYiy-ZyAANydGs8FrUzkzdze4U8pX7IWDynM7fAB6sOZlzfYLlPjkAxxd',
  //   'https://image.tmdb.org/t/p/original/mtqqD00vB4PGRt20gWtGqFhrkd0.jpg',
  //   'https://m.media-amazon.com/images/I/81S7LIaKQHL._AC_UF894,1000_QL80_.jpg',
  //   'https://upload.wikimedia.org/wikipedia/vi/7/7f/Kung_Fu_Panda_4_poster.jpg',
  //   'https://www.elle.vn/wp-content/uploads/2023/12/06/560540/poster-Mai-1024x1450.jpg',
  //   'https://upload.wikimedia.org/wikipedia/vi/6/62/L%E1%BA%ADt_m%E1%BA%B7t_48h_poster.jpg',
  //   'https://upload.wikimedia.org/wikipedia/vi/1/17/Lat_Mat_2_Poster.jpeg',
  // ];`

  List<NewMovie> movies = [
    // Movie(
    //   title: 'Kung Panda',
    //   genre: 'Animation',
    //   posterUrl:
    //       'https://image.tmdb.org/t/p/original/1FkeC2MGq10ch64zRMUlrDGjeCy.jpg',
    // ),
    // Movie(
    //   title: 'Kung Panda 2',
    //   genre: 'Animation',
    //   posterUrl:
    //       'https://image.tmdb.org/t/p/original/mtqqD00vB4PGRt20gWtGqFhrkd0.jpg',
    // ),
    // Movie(
    //   title: 'Kung Panda 3',
    //   genre: 'Animation',
    //   posterUrl:
    //       'https://m.media-amazon.com/images/I/81S7LIaKQHL._AC_UF894,1000_QL80_.jpg',
    // ),
    // Movie(
    //   title: 'Kung Panda 4',
    //   genre: 'Animation',
    //   posterUrl:
    //       'https://upload.wikimedia.org/wikipedia/vi/7/7f/Kung_Fu_Panda_4_poster.jpg',
    // ),
    // Movie(
    //   title: 'Mai',
    //   genre: 'Drama',
    //   posterUrl:
    //       'https://www.elle.vn/wp-content/uploads/2023/12/06/560540/poster-Mai-1024x1450.jpg',
    // ),
    // Movie(
    //   title: 'Lật mặt 5',
    //   genre: 'Action',
    //   posterUrl:
    //       'https://upload.wikimedia.org/wikipedia/vi/6/62/L%E1%BA%ADt_m%E1%BA%B7t_48h_poster.jpg',
    // ),
    // Movie(
    //   title: 'Lật mặt 2',
    //   genre: 'Action, Comedy',
    //   posterUrl:
    //       'https://upload.wikimedia.org/wikipedia/vi/1/17/Lat_Mat_2_Poster.jpeg',
    // ),
  ];

  int carouselActiveIndex = 0;

  NewHomeBloc get bloc => BlocProvider.of<NewHomeBloc>(context);

  @override
  void initState() {
    super.initState();
    bloc.add(GetUpcomingMovieNewHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Globalvariables.backgroundColor,
      body: BlocConsumer<NewHomeBloc, NewHomeState>(
        listener: (context, state) {
          if (state.status == BlocStatusState.failed) {
            showOkAlertDialog(context: context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          movies = state.upcomingMovies ?? [];
          return SafeArea(
            bottom: false,
            child: Container(
              color: Globalvariables.greyBackgroundCOlor,
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  _buildAppbar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Builder(
                            builder: (context) {
                              if (state.status == BlocStatusState.failed ||
                                  state.upcomingMovies == null) {
                                return const SizedBox(
                                  height: 290,
                                  child: NotFoundDataWidget(),
                                );
                              }
                              return _buildUpcomingCarousel();
                            },
                          ),
                          _buildNowInCinema(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      color: Globalvariables.greyBackgroundCOlor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.svg.icAppIcon),
          // AppBarInfoItem (icon: maps, label: TP.HCM)
          _buildAppbarInfoItem(assets: Assets.svg.icLocation, label: 'TP.HCM'),
          // AppBarInfoItem (icon: translate, label: Eng)
          _buildAppbarInfoItem(assets: Assets.svg.icLanguage, label: 'Eng'),
          // Button (customize)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomizeButton2(
              onPress: () {},
              text: 'Profile',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbarInfoItem({required String assets, required String label}) {
    return Row(
      children: [
        SvgPicture.asset(assets),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildUpcomingCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text(
            'Upcoming',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          items:
              movies.map((e) => _buildCarouselItem(e.posterUrl ?? '')).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                carouselActiveIndex = index;
              });
            },
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            aspectRatio: 16 / 9,
            viewportFraction: 0.55,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          activeIndex: carouselActiveIndex,
          count: movies.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: Globalvariables.selectedNavBarColor,
            dotColor: Globalvariables.greyBackgroundCOlor,
          ),
        ),
      ],
    );
  }

  Container _buildCarouselItem(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(url),
    );
  }

  Widget _buildNowInCinema() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Now in Cinemas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.search,
                size: 36,
                color: Globalvariables.primaryContainer,
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // width height ratio
            childAspectRatio: 163 / 278,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: movies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NewMovieDetailRoute.routeName,
                  arguments: [movies[index].id],
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      movies[index].posterUrl ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    movies[index].title ?? '--',
                    style: Globalvariables.bodyMedium,
                  ),
                  Text(
                    movies[index].genre ?? '--',
                    style: Globalvariables.bodyMedium
                        .copyWith(color: Globalvariables.primaryContainer),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // Scaffold => singleChildScroll => Column => GridView (Expanded)
}

class NotFoundDataWidget extends StatelessWidget {
  const NotFoundDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.svg.icEmptyPopcorn,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('Not found data'),
      ],
    );
  }
}
