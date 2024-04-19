import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:svg_flutter/svg.dart';

import '../../commom/constants/assets.dart';
import '../../commom/emuns/bloc_status.dart';
import '../../commom/ultis/localizations.dart';
import 'bloc/movie_detail_bloc.dart';
import 'bloc/movie_detail_event.dart';
import 'bloc/movie_detail_state.dart';
import 'tab/new_movie_detail_about_tab.dart';
import 'tab/new_movie_session_tab.dart';

class NewMovieDetailScreen extends StatefulWidget {
  String movieId;
  NewMovieDetailScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<NewMovieDetailScreen> createState() => _NewMovieDetailScreenState();
}

class _NewMovieDetailScreenState extends State<NewMovieDetailScreen> {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;
  // late YoutubePlayerController youtubeController;

  NewMovieDetailBloc get bloc => BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    bloc.add(GetNewMovieDetailEvent(movieId: widget.movieId));

    // Mock
    // Future.delayed(Duration.zero, () {
    //   bloc.add(
    //     GetMovieDetailEvent(
    //       id: widget.movieId,
    //       languageCode: Localizations.localeOf(context).languageCode,
    //     ),
    //   );
    // });
    // youtubeController = YoutubePlayerController(
    //   initialVideoId: '',
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: false,
    //     mute: false,
    //     hideControls: false,
    //     controlsVisibleAtStart: true,
    //     showLiveFullscreenButton: false,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return BlocListener<NewMovieDetailBloc, NewMovieDetailState>(
      listener: (context, state) {
        if (state.status == BlocStatusState.loading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }

        if (state.status == BlocStatusState.failed) {
          showOkAlertDialog(
            context: context,
            message: state.errorMessage,
            title: translate(context).error,
          );
        } else if (state.status == BlocStatusState.success) {
          // Show snackbar, show toast.
        }
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<NewMovieDetailBloc, NewMovieDetailState>(
              builder: (context, state) {
                return Text(
                  state.movieDetail?.title ?? translate(context).movieDetail,
                  style: _textTheme.titleMedium,
                );
              },
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: _colorScheme.outline,
              dividerHeight: 2,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(translate(context).about),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(translate(context).sessions),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocBuilder<NewMovieDetailBloc, NewMovieDetailState>(
                builder: (context, state) {
                  final movie = state.movieDetail;
                  if (movie == null) {
                    return Center(
                      child: SvgPicture.asset(Assets.svg.icEmptyPopcorn),
                    );
                  }
                  return NewAboutTabWidget(
                    movieDetailEntity: movie,
                  );
                },
              ),
              NewMovieSessionTab(
                movieId: widget.movieId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
