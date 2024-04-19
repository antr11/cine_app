import 'package:cine_app/commom/constants/custom_button.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/commom/ultis/string_utils.dart';
import 'package:cine_app/features/movie_details/domain/entities/movie_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '/commom/ultis/int_ultils.dart';
import '/commom/ultis/date_utils.dart';
import '/commom/ultis/double_utils.dart';

import '../../../commom/ultis/localizations.dart';

class NewAboutTabWidget extends StatefulWidget {
  final NewMovieDetailEntity? movieDetailEntity;
  const NewAboutTabWidget({
    super.key,
    this.movieDetailEntity,
  });

  @override
  State<NewAboutTabWidget> createState() => _NewAboutTabWidgetState();
}

class _NewAboutTabWidgetState extends State<NewAboutTabWidget>
    with AutomaticKeepAliveClientMixin {
  late ThemeData theme;

  // TextTheme get _textTheme => theme.textTheme;
  // ColorScheme get _colorScheme => theme.colorScheme;
  late YoutubePlayerController youtubeController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Call init state');
    youtubeController = YoutubePlayerController(initialVideoId: '');
  }

  @override
  void didUpdateWidget(covariant NewAboutTabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Call Did update widget');
    youtubeController = YoutubePlayerController(
      // initialVideoId: widget.movieDetailEntity?.youtubeUrl ?? '',
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        loop: true,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('Call Build widget');
    youtubeController = YoutubePlayerController(
      // initialVideoId: widget.movieDetailEntity?.youtubeUrl ?? '',
      initialVideoId: '_inKs4eeHiI',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        loop: true,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: true,
        showLiveFullscreenButton: false,
      ),
    );
    final width = MediaQuery.of(context).size.width;
    theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: width,
                  height: width * 9 / 16,
                  // child: YoutubePlayer(
                  //   controller: youtubeController,
                  // ),
                  child: widget.movieDetailEntity?.youtubeUrl == null
                      ? const SizedBox()
                      : YoutubePlayer(
                          showVideoProgressIndicator: true,
                          topActions: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print('Mở app youtube');
                                },
                                child: Text(
                                  widget.movieDetailEntity?.youtubeName ?? '',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                          bottomActions: [
                            GestureDetector(
                              onTap: () {
                                print('Mở app youtube');
                              },
                              child: SizedBox(
                                width: 48,
                                height: 48,
                                child: Image.network(
                                  'https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png',
                                ),
                              ),
                            ),
                          ],
                          progressIndicatorColor: Colors.red,
                          progressColors: const ProgressBarColors(
                            backgroundColor: Colors.grey,
                            playedColor: Colors.red,
                            bufferedColor: Colors.grey,
                            handleColor: Colors.grey,
                          ),
                          controller: youtubeController,
                        ),
                ),
                Container(
                  // color: _colorScheme.surface,
                  child: Row(
                    children: [
                      _buildRatingItem(
                        widget.movieDetailEntity?.voteAverage
                            ?.toStringAsFixed(1),
                        'IMDB',
                      ),
                      const SizedBox(
                        width: 1,
                        height: 70,
                        // color: _colorScheme.outline,
                      ),
                      _buildRatingItem(
                        widget.movieDetailEntity?.voteCount?.addCommas(),
                        translate(context).vote,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        widget.movieDetailEntity?.description ?? '',
                        style: Globalvariables.bodyMedium,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildMovieInfoRow(
                        'Runtime',
                        widget.movieDetailEntity?.runtime
                            ?.toStringAsFixed(0)
                            .addUnitPost(translate(context).minutes),
                      ),
                      _buildMovieInfoRow(
                        'Release',
                        widget.movieDetailEntity?.releaseDate
                                ?.toLocalddmmyyyy() ??
                            '',
                      ),
                      _buildMovieInfoRow(
                        'Genre',
                        widget.movieDetailEntity?.genre,
                      ),
                      _buildMovieInfoRow(
                        'Budget',
                        (widget.movieDetailEntity?.budget ?? 0) == 0
                            ? null
                            : widget.movieDetailEntity?.budget?.toDollar(),
                      ),
                      _buildMovieInfoRow(
                        'Prod Countries',
                        widget.movieDetailEntity?.countries?.join(', '),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Globalvariables.unselectedNavBarColor,
          padding: const EdgeInsets.all(16),
          child: CustomButton(
            onTap: () {},
            text: translate(context).selectSessions,
            color: Globalvariables.greyBackgroundCOlor,
          ),
        ),
      ],
    );
  }

  Widget _buildMovieInfoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(
              title,
              style: Globalvariables.bodyMedium
                  .copyWith(color: Globalvariables.primaryContainer),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              value ?? translate(context).unknown,
              style: Globalvariables.bodyMedium
                  .copyWith(color: Globalvariables.greyBackgroundCOlor),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildRatingItem(String? value, String? unit) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value ?? '',
              style: Globalvariables.titleLarge,
            ),
            Text(
              unit ?? '',
              style: Globalvariables.bodyMedium
                  .copyWith(color: Globalvariables.primaryContainer),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
