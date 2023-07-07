import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_news/application/news/top_sports_headlines/top_sports_headlines_bloc.dart';
import 'package:sport_news/domain/core/utilities/colors.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import 'package:sport_news/generated/l10n.dart';
import 'package:sport_news/presentation/sport_news/widgets/news_card.dart';

import '../../main.dart';

class SportNewsScreen extends StatelessWidget {
  const SportNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.appTitle)),
      body: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0),
        child: BlocBuilder<TopSportsHeadlinesBloc, TopSportsHeadlinesState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => Container(),
              actionFailure: (failure) =>
                  buildFailureWidget(context, failure),
              loading: (_) =>
                  const Center(child: CircularProgressIndicator()),
              actionSuccess: (newsData) {
                log.wtf(newsData.toString());
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          newsData.topSportsHeadlines.articles?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        log.wtf("index:$index");
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: NewsCard(
                            article:
                                newsData.topSportsHeadlines.articles?[index],
                          ),
                        );
                      }),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Center buildFailureWidget(BuildContext context, failure) {
    return Center(
      child: Text(
        failure.topSportsHeadlinesFailure.map(
          unexpected: (_) => S.of(context).unexpectedError,
          fetchNewsDataFailure: (_) => S.of(context).fetchingNewsDataFailure,
        ),
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: AppColors.errorColor),
      ),
    );
  }
}
