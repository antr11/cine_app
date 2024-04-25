import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/account/account_route.dart';
import 'package:cine_app/features/new_home/presentation/views/widget/customize_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../commom/constants/assets.dart';
import '../../../../commom/emuns/bloc_status.dart';
import '../../../movie_details/movie_detail_route.dart';
import '../../data/models/movie.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  late ThemeData theme;

  List<NewMovie> movies = [];

  int carouselActiveIndex = 0;

  HomeBloc get bloc => BlocProvider.of<HomeBloc>(context);

  @override
  void initState() {
    super.initState();
    bloc.add(GetUpcomingMovieNewHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globalvariables.backgroundColor,
      body: BlocConsumer<HomeBloc, HomeState>(
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
              color: Globalvariables.backgroundColor,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.svg.icAppIcon),
          _buildAppbarInfoItem(assets: Assets.svg.icLocation, label: 'TP.HCM'),
          _buildAppbarInfoItem(assets: Assets.svg.icLanguage, label: 'Eng'),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomizeButton2(
              onPress: () {
                Navigator.pushNamed(context, AccountRoute.routeName);
              },
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
