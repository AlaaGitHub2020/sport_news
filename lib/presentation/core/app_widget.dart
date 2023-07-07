import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sport_news/application/core/theme_cubit/theme_cubit.dart';
import 'package:sport_news/application/news/top_sports_headlines/top_sports_headlines_bloc.dart';
import 'package:sport_news/application/remote_url/remote_url_bloc.dart';
import 'package:sport_news/domain/analytics/i_analytics_repository.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import 'package:sport_news/generated/l10n.dart';
import 'package:sport_news/injection.dart';
import 'package:sport_news/presentation/routes/router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<RemoteUrlBloc>(
          create: (BuildContext context) =>
              getIt<RemoteUrlBloc>()..add(const RemoteUrlEvent.getRemoteUrl()),
        ),
        BlocProvider<TopSportsHeadlinesBloc>(
            create: (BuildContext context) => getIt<TopSportsHeadlinesBloc>()
              ..add(const TopSportsHeadlinesEvent.getNewsData())),
      ],
      child: const SportNews(),
    );
  }
}

class SportNews extends StatefulWidget {
  const SportNews({Key? key}) : super(key: key);

  @override
  State<SportNews> createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews> {
  final heroController = HeroController();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: context.watch<ThemeCubit>().state.theme,
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () =>
            [getIt<IAnalyticsRepository>().getAnalyticsObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return locale;
          }
        }
        return null;
      },
    );
  }
}
